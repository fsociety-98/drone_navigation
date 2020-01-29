#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist,Point,PoseStamped
from tf import transformations
from nav_msgs.msg import Odometry
import math
import sys

#GLOBAL VARIABLES

#Publisher to /cmd_vel
pub = None
sub = None

#List of Destination points
destination_points = []

#Current pointer
current_destination_pointer = 0

#Current destination
current_destination_point = Point()
current_destination_point.z = 0

#Current robot state indicators
current_position = Point()
current_yaw = 0

#Acceptable Error
yaw_precision = math.pi/90 
dist_precision = 0.3

#CURRENT STATE OF EXECUTION
current_state = 0

"""
    0 -> fix_yaw
    1 -> Go_straight
    2 -> Destination_reached
    3 -> All points Covered
"""


#CALLBACK FUNCTION TO UPDATE THE CURRENT POSITION OF DRONE
def callback_odom(msg):
    #print("Calling odom")
    global pub,sub,destination_points, current_destination_pointer
    global current_destination_point,current_position,current_yaw,yaw_precision,dist_precision

    
    current_position = msg.pose.position
    
    #FINDING CURRENT YAW
    quaternion = (
                    msg.pose.orientation.x,
                    msg.pose.orientation.y,
                    msg.pose.orientation.z,
                    msg.pose.orientation.w,                                      
                 )
    euler = transformations.euler_from_quaternion(quaternion)
    current_yaw = euler[2]
    #print("Current_yaw ",current_yaw)
   
        
def setup():
    global pub,sub,destination_points, current_destination_pointer
    global current_destination_point,current_position,current_yaw,yaw_precision,dist_precision
    
    pub = rospy.Publisher("/cmd_vel",Twist,queue_size=1)
    sub = rospy.Subscriber("/ground_truth_to_tf/pose",PoseStamped,callback_odom)
    
    #GETTING LIST OF DESTINATION POINTS
    des_string = rospy.get_param('/go_to_list_of_points/des_points')
    
    for v in des_string.split(','):
        destination_points.append(Point(int(v.split(' ')[0]),int(v.split(' ')[1]),0))
    
    current_destination_pointer = 0
    current_destination_point = destination_points[0]
    
def normalize_angle(angle):
    if(math.fabs(angle) > math.pi):
        angle = angle - (2 * math.pi * angle) / (math.fabs(angle))
    return angle

def change_state(state):
    global current_state
    current_state = state
    #print 'State changed to [%s]' % current_state


def fix_yaw():
    
    global pub,sub,destination_points, current_destination_pointer
    global current_destination_point,current_position,current_yaw,yaw_precision,dist_precision

    desired_yaw = math.atan2(current_destination_point.y - current_position.y, current_destination_point.x - current_position.x)
    err_yaw = normalize_angle(desired_yaw - current_yaw)
    
    #rospy.loginfo(err_yaw)
    
    twist_msg = Twist()
    if math.fabs(err_yaw) > yaw_precision:
        twist_msg.angular.z = 0.7 if err_yaw > 0 else -0.7
    
    pub.publish(twist_msg)
    #print("Error yaw ",err_yaw)
    #print("Yaw_precision ",yaw_precision)
    # state change conditions to go staright
    if math.fabs(err_yaw) <= yaw_precision:
        #print 'Yaw error: [%s]' % err_yaw
        change_state(1)



def go_straight_ahead(des_pos):
    global pub,sub,destination_points, current_destination_pointer
    global current_destination_point,current_position,current_yaw,yaw_precision,dist_precision

    
    desired_yaw = math.atan2(des_pos.y - current_position.y, des_pos.x - current_position.x)
    err_yaw = desired_yaw - current_yaw
    err_pos = math.sqrt(pow(des_pos.y - current_position.y, 2) + pow(des_pos.x - current_position.x, 2))
    
    if err_pos > dist_precision:
        twist_msg = Twist()
        twist_msg.linear.x = 0.6
        twist_msg.angular.z = 0.2 if err_yaw > 0 else -0.2
        pub.publish(twist_msg)
    else:
        #print 'Position error: [%s]' % err_pos
        change_state(2)
    
    # state change conditions
    if math.fabs(err_yaw) > yaw_precision:
        #print 'Yaw error: [%s]' % err_yaw
        change_state(0)


def change_destination_point():

    global pub,sub,destination_points, current_destination_pointer
    global current_destination_point,current_position,current_yaw,yaw_precision,dist_precision

    print("POINT: X:"+str(current_destination_point.x)+" Y: "+str(current_destination_point.y)+" EXPLORED")
    #CURRENT DESTIANTION PTR Indicator should be incremented
    if(current_destination_pointer == len(destination_points) -1):
        print("ALL POINTS EXPLORED")
        change_state(3)
        return

    current_destination_pointer = current_destination_pointer + 1
    current_destination_point = destination_points[current_destination_pointer]
    change_state(0)
    
def finish():
    global pub
    twist_msg = Twist()    
    twist_msg.angular.z = 2.5
    pub.publish(twist_msg)
    
def takeoff():
    global pub
    twist_msg = Twist()    
    twist_msg.linear.z = 2.5
    pub.publish(twist_msg)
        
def main():

    global current_state,current_destination_point,pub

    rospy.init_node("go_to_list_of_points")    
    rate = rospy.Rate(20)
    
    #Initialize all global variables
    setup()

    
    #DRONE_TAKEOFF
    print("TAKING OFF")    
    for i in range(1,100):
        takeoff()
    print("TAKEOFF DONE")
    

    while not rospy.is_shutdown():
        #takeoff2()
        #print("Current state ",current_state)
        if current_state == 0:
            fix_yaw()
        elif current_state == 1:
            go_straight_ahead(current_destination_point)
        elif current_state == 2:
            change_destination_point()  
        elif current_state == 3:
            finish()
        else:
            rospy.logerr("Invalid state")
            
        
        rate.sleep()

main()
    
    

