#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist,Point,PoseStamped,Pose,Quaternion
from tf import transformations
from nav_msgs.msg import Odometry
import math
import sys
from threading import Thread, Lock

from move_base_msgs.msg import MoveBaseActionGoal

from point_navigation.srv import goToPoint
from point_navigation.srv import goToPointRequest
from point_navigation.srv import goToPointResponse


height_to_maintain = 1.5
sub = None
pub = None
hgt_reached = False
mutex = Lock()
count = 0

def myCallback(data):
	global count,hgt_reached
	if hgt_reached and count < 100:
		count = count + 1
		return
	else:
		count = 0
		balance(data.pose)

def balance(dt):
    #print("Balancing")
    global pub,sub,height_to_maintain,hgt_reached,mutex
    msg = Twist()


    if dt.position.z >= height_to_maintain:
    	hgt_reached = True

    """
    if abs(dt.position.z-height_to_maintain) < 0.1 and hgt_reached:
        if dt.position.z > height_to_maintain :
            msg.linear.z = -(dt.position.z-height_to_maintain) 
        if dt.position.z < height_to_maintain :
            msg.linear.z = abs(dt.position.z-height_to_maintain) 

    else:rospy.Rate(3000).sleep()
        if dt.position.z > height_to_maintain :
            msg.linear.z = -0.1
        if dt.position.z < height_to_maintain :
            msg.linear.z = 0.1
	"""	
    
    #print("\n\n\n\n\n\n\n\n\n\n\n Inside Height balance \n\n\n\n\n\n\n\n\n")
    if dt.position.z > height_to_maintain :
        msg.linear.z = -(dt.position.z-height_to_maintain) + 0.00025
    if dt.position.z < height_to_maintain :
        msg.linear.z = abs(dt.position.z-height_to_maintain) + 0.025
    pub.publish(msg)
    #rospy.Rate(500).sleep()
    

if __name__ == '__main__':

    global pub,sub

    prefix = sys.argv[1]
    print("Prefix is: "+prefix)
	
    rospy.init_node(prefix+"Height_Balancer")

    print("Waiting for enable_motors")
    #rospy.wait_for_service("/"+prefix+"/enable_motors")
    print("Done waiting")
    print("Subscribing to "+ prefix+"/ground_truth_to_tf/pose")
    print("Publishing to "+ prefix+"/cmd_vel")
    sub = rospy.Subscriber(prefix+"/ground_truth_to_tf/pose",PoseStamped,myCallback)

    pub = rospy.Publisher(prefix+"/cmd_vel",Twist,queue_size=10)

    rospy.spin()