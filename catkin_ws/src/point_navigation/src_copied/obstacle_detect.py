#! /usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist, Point,PoseStamped
from nav_msgs.msg import Odometry
from tf import transformations
from std_srvs.srv import *
import math

#GLOBAL VARIABLES FOR CURRENT ROBOT STATE
yaw_ = 0
position_ = Point()
regions = []
regions_debug = ['left_back','left','left_fwd','right_fwd','right', 'right_back']
state_ = 0
direc = {'left_back':-1.9634916, 'left':-1.178094, 'left_fwd':-0.392698,'right_fwd':0.392698327,'right':1.178094,'right_back':1.9634916,'':0}
pub = rospy.Publisher('/cmd_vel',Twist, queue_size=1)
yaw_precision_ = math.pi / 90
reg_to_go = ''
indices = {'left_back':0,'left':1,'left_fwd':2,'right_fwd':3,'right':4, 'right_back':5, '':0}

def change_state(state):
    global state_
    state_ = state
    print 'State changed to [%s]' % state_


def read_laser(msg):
    global regions    
    regions = [
            min(min(msg.ranges[0:180]), 10), #left back
            min(min(msg.ranges[181:361]), 10), #left 
            min(min(msg.ranges[362:543]), 10), #left-fwd
            min(min(msg.ranges[544:725]), 10), #right-fwd
            min(min(msg.ranges[726:906]), 10), #right
            min(min(msg.ranges[907:]), 10) #Right-back
        ]
    

def clbk_odom(msg):
    global position_
    global yaw_
    
    # position
    position_ = msg.pose.position
    
    # yaw
    quaternion = (
        msg.pose.orientation.x,
        msg.pose.orientation.y,
        msg.pose.orientation.z,
        msg.pose.orientation.w)
    euler = transformations.euler_from_quaternion(quaternion)
    yaw_ = euler[2]


def fix_yaw():
    global direc,yaw_,pub,yaw_precision_,reg_to_go
    err_yaw = normalize_angle(direc[reg_to_go] - yaw_) 
    twist_msg = Twist()
  
    if math.fabs(err_yaw) > yaw_precision_:
        twist_msg.angular.z = 0.7 if err_yaw > 0 else -0.7
        twist_msg.linear.z = 0.2
        print("Linear z")
    pub.publish(twist_msg)
    
    if math.fabs(err_yaw) <= yaw_precision_:
        print 'Yaw error: [%s]' % err_yaw
        change_state(1)
    
def normalize_angle(angle):
    if(math.fabs(angle) > math.pi):
        angle = angle - (2 * math.pi * angle) / (math.fabs(angle))
    return angle

def go_straight():
    global reg_to_go,regions,pub
    twist_msg = Twist()
    twist_msg.linear.x = 0.2
    pub.publish(twist_msg)
    if regions[indices[reg_to_go]] < 1:
        change_state(0)
        
        
def move():
    
    global regions,regions_debug,reg_to_go   
    mx = 0
    reg_to_go = ''
    
    #FIND WHICH REGION TO GO TO
    for i in range(len(regions)):
        if regions[i] > mx:
            mx = regions[i]
            reg_to_go = regions_debug[i]        
    
    print("")
    print(" Going towards : " + reg_to_go)
    

def done():
    global pub
    twist_msg = Twist()
    twist_msg.linear.x = 0
    twist_msg.angular.z = 0
    pub.publish(twist_msg)

def start():
    global pub
    print("Starting")
    rt = rospy.Rate(1000)
    twist_msg = Twist()
    twist_msg.linear.z = 2.5
    pub.publish(twist_msg)
    rt.sleep()

def main():
    global state_
    rospy.init_node('obstacle_detect')
    
    #/scan subscriber
    sub_scan = rospy.Subscriber('/scan',LaserScan,read_laser)

    # Subscribe to  /ground_truth_to_tf/pose 
    sub_pose = rospy.Subscriber('/ground_truth_to_tf/pose',PoseStamped,clbk_odom)
    rate = rospy.Rate(200)
    start()

    print(" \n\n\n  STARTING \n\n\n")
    while not rospy.is_shutdown():
        move()
        if state_ == 0:
            fix_yaw()
        elif state_ == 1:
            go_straight()
        elif state_ == 2:
            done()
        else:
            rospy.logerr('Unknown state!')
        rate.sleep()

        
main()
