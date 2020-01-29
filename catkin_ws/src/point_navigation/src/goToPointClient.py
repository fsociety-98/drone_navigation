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


def myCallback(data):
	request(data.pose)

def request(dt):

	req = goToPointRequest()
	req.tf_prefix = sys.argv[1]
	req.pose = dt
	
	s = rospy.ServiceProxy("goToPoint_"+req.tf_prefix,goToPoint)

	resp = s(req.tf_prefix,req.pose)
	
	rospy.loginfo("Response : "+str(resp.success))

if __name__ == '__main__':

	prefix = sys.argv[1]
	
	rospy.init_node("MyMoveBase")

	print("\n\n\n\n Waiting for service")
	rospy.wait_for_service("goToPoint_"+prefix)
	print("\n\n\n\n\n DONE Waiting")

	sub = rospy.Subscriber(prefix+"/move_base_simple/goal",PoseStamped,myCallback)

	rospy.spin()