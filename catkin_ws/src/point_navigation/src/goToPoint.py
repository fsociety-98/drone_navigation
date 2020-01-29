#!/usr/bin/env python

import rospy
import sys
from geometry_msgs.msg import Twist,Point,PoseStamped
from tf import transformations
from nav_msgs.msg import Odometry
import math

from threading import Thread, Lock
from point_navigation.srv import goToPoint
from point_navigation.srv import goToPointRequest
from point_navigation.srv import goToPointResponse


#Publisher to /cmd_vel
pub = None
sub = None


#Current destination
destination_point = Point()

#Current robot state indicators
current_position = Point()
current_yaw = 0

#Acceptable Error
yaw_precision = math.pi/90 
dist_precision = 0.3

#CURRENT STATE OF EXECUTION
current_state = 0

#NAME OF DRONE
drone_name = ""

#MUTEX LOCK
mutex = Lock()

"""
    0 -> fix_yaw
    1 -> Go_straight
    2 -> Destination_reached
"""


# PARAMETERS REQUIRED
# DESTINATION POSE
# VELOCITY TOPIC
# TF PREFIX
# SERVICE NODE NAME
service_node_name = "goToPointNode"
service_name = "goToPoint"


#CALLBACK FUNCTION TO UPDATE THE CURRENT POSITION OF DRONE
def callback_odom(msg):
    #print("Calling odom")
    global pub,sub
    global current_position,current_yaw

    
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
    

def normalize_angle(angle):
    if(math.fabs(angle) > math.pi):
        angle = angle - (2 * math.pi * angle) / (math.fabs(angle))
    return angle

def change_state(state):
    global current_state
    current_state = state
    #print 'State changed to [%s]' % current_state


def fix_yaw(current_destination_point):
    
    desired_yaw = math.atan2(current_destination_point.y - current_position.y, current_destination_point.x - current_position.x)
    err_yaw = normalize_angle(desired_yaw - current_yaw)
    
    #rospy.loginfo(err_yaw)
    
    twist_msg = Twist()
    if math.fabs(err_yaw) > yaw_precision:
        twist_msg.angular.z = 0.5 if err_yaw > 0 else -0.7
    
    pub.publish(twist_msg)

    if math.fabs(err_yaw) <= yaw_precision:
        #print 'Yaw error: [%s]' % err_yaw
        change_state(1)



def go_straight_ahead(des_pos):
   
    desired_yaw = math.atan2(des_pos.y - current_position.y, des_pos.x - current_position.x)
    err_yaw = desired_yaw - current_yaw
    err_pos = math.sqrt(pow(des_pos.y - current_position.y, 2) + pow(des_pos.x - current_position.x, 2))
    
    if err_pos > dist_precision:
        twist_msg = Twist()
        twist_msg.linear.x = 0.25
        twist_msg.angular.z = 0.2 if err_yaw > 0 else -0.2
        pub.publish(twist_msg)
    else:
        #print 'Position error: [%s]' % err_pos
        change_state(2)
    
    # state change conditions
    if math.fabs(err_yaw) > yaw_precision:
        #print 'Yaw error: [%s]' % err_yaw
        change_state(0)

    
def finish():
    global pub
    twist_msg = Twist()    
    twist_msg.angular.z = 0.5
    pub.publish(twist_msg)
    change_state(3)
    
def takeoff():
    global pub,drone_name
    twist_msg = Twist()    
    twist_msg.linear.z = 0.75   
    #print("Drone: "+drone_name+"Takeoff")
    pub.publish(twist_msg)
        
def goToPointMain():

    global current_state,destination_point
    global pub,drone_name,mutex
  
    rate = rospy.Rate(20)
    
    #DRONE_TAKEOFF
    mutex.acquire()
    print("DRONE: "+drone_name+" TAKING OFF")    
    for i in range(1,100):
        takeoff()
        rate.sleep()
    print("DRONE: "+drone_name+" TAKEOFF DONE")
    mutex.release()
    current_state = 0
    
    while not rospy.is_shutdown():    
        if current_state == 0:
            fix_yaw(destination_point)
        elif current_state == 1:
            go_straight_ahead(destination_point)
        elif current_state == 2:
            finish()
        elif current_state == 3:
        	return
        else:
            rospy.logerr('Unknown state!')
            
        rate.sleep()

def goToPointCallback(req):

    global pub,sub,drone_name
    global destination_point

    
    prefix = sys.argv[1]
    	

    pub = rospy.Publisher(prefix+"/cmd_vel",Twist,queue_size = 100)
    sub = rospy.Subscriber(prefix+"/ground_truth_to_tf/pose",PoseStamped,callback_odom)
    
    destination_point = req.pose.position

    print("\n\n\n\n\n Going to Point Main called \n\n\n\n\n ")
    #HANDLES THE STATE MACHINE
    goToPointMain()

    print("\n\n\n\n Go to Point Main returned ")
    return goToPointResponse(True)


def init_server():

	global service_node_name,service_name

	#Initialize node
	rospy.init_node(service_node_name)

	srv = rospy.Service(service_name,goToPoint,goToPointCallback)

	rospy.spin()


if __name__ == '__main__':

	init_server()