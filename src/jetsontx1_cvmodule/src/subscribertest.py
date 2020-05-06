#!/usr/bin/env python
#########################################################################
# Cyborg 2020, CV-test module.
# Subscribes to the Topics published by behaviourdetection.py.
# Shows how to extract and use the published data.
# By Ole Martin Brokstad.
#########################################################################
import rospy
from sensor_msgs.msg import Image
import numpy as np
import cv2
from jetsontx1_cvmodule.msg import Predictions, Prediction

def callback(data):
	image = np.fromstring(data.data, np.uint8)
	image = image.reshape((720, 1280, 4))
	print image.shape 
	cv2.imshow("stream", image)
	cv2.waitKey(35)

def callback1(data):
	for person in data.predictions:
		print('Person with ID: %d, has %s smile, and is located at (x=%f,y=%f) in mm relative to me.' %(person.id, person.smile, person.xcoord, person.ycoord))

def listener():
	rospy.init_node('videosubscriber', anonymous=True)
	rospy.Subscriber('/videostream', Image, callback, queue_size=10)
	rospy.Subscriber('/predictions', Predictions, callback1, queue_size=10)
	
	rospy.spin()

if __name__ == '__main__':
	listener()
