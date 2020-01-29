#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist,Point,PoseStamped,Pose,Quaternion
from tf import transformations
from nav_msgs.msg import Odometry
import math
import sys
from threading import Thread, Lock

from point_navigation.srv import goToPoint
from point_navigation.srv import goToPointRequest
from point_navigation.srv import goToPointResponse


def request():
	req = goToPointRequest()
	req.tf_prefix = ""
	req.pose = Pose(Point(-5,7,0),Quaternion(0,0,0,0))
	
	rospy.init_node("MyClient")

	print("Waiting for service")
	rospy.wait_for_service("goToPoint")
	print("DONE Waiting")
	s = rospy.ServiceProxy("goToPoint",goToPoint)

	resp = s(req.tf_prefix,req.pose)
	
	rospy.loginfo("Response : "+str(resp.success))

if __name__ == '__main__':
	
	request()