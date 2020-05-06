#!/usr/bin/env python
#########################################################################
# Cyborg 2020, CV module.
# Tracking detected people using Sort and Yolo. 
# Detecting face and smile on the tracked people using OpenCV haarcascade
# classifiers.
# Integrated with ROS.
# By Ole Martin Brokstad.
#########################################################################
import pyzed.sl as sl
import pyyolo
import numpy as np
import cv2
import rospy
from jetsontx1_cvmodule.msg import Predictions, Prediction, Peoplecount
import math
import time
from sort import *
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

def detector():
	print cv2.__version__
	# Initialize publisher ROS node
	pub = rospy.Publisher('predictions', Predictions, queue_size=10)
	pub1 = rospy.Publisher('peoplecount', Peoplecount, queue_size=10)
	pub2 = rospy.Publisher('videostream', Image, queue_size=10)
	rospy.init_node('detector', anonymous=True)
	# Ceate sort object
	mot_tracker = Sort()
	# Define paths for yolo files
	darknet_path = '/home/ubuntu/catkin_ws/src/jetsontx1_cvmodule/src/pyyolo/darknet' # Only './darknet' is dependent on location of rosrun command
	datacfg = 'cfg/coco.data'
	cfgfile =  'cfg/yolov3-tiny.cfg'
	weightfile = '../yolov3-tiny.weights' #'/media/ubuntu/SDcard/yoloWeights/yolov2-tiny.weights' this also works but it loads way slower
	filename = darknet_path + '/data/person.jpg'
	# Image resolution parameters
	(width, height) = (1280, 720) # Use (672,376) for VGA and (1280,720) for HD720 resolution
	# Initialize visualization
	fourcc = cv2.VideoWriter_fourcc(*'MJPG')
	video = cv2.VideoWriter('predictionstest.avi', fourcc, 10, (width,height))
	# Initialize pyyolo
	pyyolo.init(darknet_path, datacfg, cfgfile, weightfile)
	# Initialize face detector
	face_cascade = cv2.CascadeClassifier('/usr/share/OpenCV/haarcascades/haarcascade_frontalface_default.xml')
	smile_cascade = cv2.CascadeClassifier('/usr/share/OpenCV/haarcascades/haarcascade_smile.xml')
	# Create a Camera object
	zed = sl.Camera()
	# Create a InitParameters object and set configuration parameters
	init_params = sl.InitParameters()
	init_params.camera_resolution = sl.RESOLUTION.HD720  # Use HD1080, HD720 or VGA video mode
	init_params.camera_fps = 15  # Set fps at 30
	# Open the camera
	err = zed.open(init_params)
	if err != sl.ERROR_CODE.SUCCESS:
		exit(1)
	zed.set_camera_settings(sl.VIDEO_SETTINGS.EXPOSURE, 40)
	image = sl.Mat()
	point_cloud = sl.Mat()
	colours = 255*np.random.rand(32,3) # For drawing different colours on BB

	runtime_parameters = sl.RuntimeParameters()
	while not rospy.is_shutdown():
		start = time.time()
        # Grab an image, a RuntimeParameters object must be given to grab()
		if zed.grab(runtime_parameters) == sl.ERROR_CODE.SUCCESS:
			# A new image is available if grab() returns SUCCESS
			zed.retrieve_image(image, sl.VIEW.LEFT)
			data = image.get_data()
			gray_picture = cv2.cvtColor(data, cv2.COLOR_BGR2GRAY)# Make picture gray for face/smile detection
			# Retrieve colored point cloud. Point cloud is aligned on the left image.
			zed.retrieve_measure(point_cloud, sl.MEASURE.XYZRGBA)
			Data = data.transpose(2,0,1)
			start5 = time.time()
			Data = Data.ravel()/255.0
			end5 = time.time()
			Data = np.ascontiguousarray(Data, dtype=np.float32)
			start1 = time.time()
			outputs = pyyolo.detect(width, height, 4, Data, 0.5, 0.8) #pyyolo.detect returns: [{'right':, 'bottom':, 'top':, 'class':, 'prob':, 'left':}]
			end1 = time.time()
			print("Section cycle time: ", end1 - start1)
			dets = np.empty((0,5), int) 
			count = 0
			for output in outputs:
				if output['class'] == 'person':#track only people
					count = count+1# Count detected people
					dets = np.append(dets, [[output['left'], output['top'], output['right'], output['bottom'], output['prob']]], axis=0)
			people = Peoplecount()
			people.tot_detected_people	= count
			pub1.publish(people)
			preds = Predictions()
			trackers = mot_tracker.update(dets)#update tracking ID. mot_tracker.update() returns: [[x1,y1,x2,y2,id]]
			for d in trackers:
				d = d.astype(np.int32)
				# Create a dictionary to store info for publishing
				detectinfo = {'left': d[0], 'top': d[1], 'right': d[2], 'bottom': d[3], 'class': 'person', 'ID': int(d[4])}

				euclidean_distance(detectinfo, point_cloud)
				relative_coordinates(detectinfo, width)
				start3 = time.time()
				facesmile_detect(detectinfo, gray_picture, data, face_cascade, smile_cascade)
				end3 = time.time()
				#print("facesmile detect cycle time: ", end3 - start3)
				#print detectinfo['smile']

				pred = Prediction()
				#pred.probabilities.append()
				pred.classes.append(detectinfo['class'])
				pred.xmin               = detectinfo['left']
				pred.ymin               = detectinfo['top']
				pred.xmax               = detectinfo['right']
				pred.ymax               = detectinfo['bottom']
				pred.id					= detectinfo['ID']	
				pred.face 				= detectinfo['face']
				pred.smile				= detectinfo['smile']		
				pred.distance           = detectinfo['distance']
				pred.angle				= detectinfo['angle']
				pred.xcoord				= detectinfo['x']
				pred.ycoord 			= detectinfo['y']
				preds.predictions.append(pred)

				label = detectinfo['class'] + " " + str(detectinfo['ID'])

				cv2.rectangle(data, (d[0],d[1]), (d[2],d[3]), (colours[d[4]%32,0],colours[d[4]%32,1],colours[d[4]%32,2]), 2)
				font = cv2.FONT_HERSHEY_SIMPLEX
				cv2.putText(data, label, (d[2],d[1]+25), font, 1,(0,0,255),1,cv2.LINE_AA)
			pub.publish(preds)
			msg_frame = CvBridge().cv2_to_imgmsg(data, "8UC4")
			pub2.publish(msg_frame)
			#video.write(data[:,:,:3])#because data.shape is (376,672,4) and it only supports 3 channels.
			cv2.imshow("image", data)
			cv2.waitKey(35)
		end = time.time()
		print("Total cycle time: ", end - start)
	# Close the camera
	zed.close()


def facesmile_detect(detectinfo, gray_picture, data, face_cascade, smile_cascade):
	detectinfo['face'] = 'no'
	detectinfo['smile'] = 'no'
	gray_body = gray_picture[detectinfo['top']:detectinfo['bottom']-int((detectinfo['bottom']-detectinfo['top'])/2.0), detectinfo['left']:detectinfo['right']] # cut the top half gray body frame out
	faces = face_cascade.detectMultiScale(gray_body, 2, 5) #1.3, 5)
	for (x,y,w,h) in faces:
		detectinfo['face'] = 'yes'
		cv2.rectangle(data, (detectinfo['left']+x,detectinfo['top']+y), (detectinfo['left']+x+w,detectinfo['top']+y+h), (0,255,0), 2)
		gray_face = gray_body[y:y+h, x:x+w]
		smiles = smile_cascade.detectMultiScale(gray_face)
		for (sx,sy,sw,sh) in smiles:
			detectinfo['smile'] = 'yes'
			if sy+sh < h:
				cv2.rectangle(data, (detectinfo['left']+x+sx,detectinfo['top']+(y+sy)), (detectinfo['left']+x+sx+sw,detectinfo['top']+y+sy+sh), (0,0,255), 2)#pass
			else:
				cv2.rectangle(data, (detectinfo['left']+x+sx,detectinfo['top']+(y+sy)), (detectinfo['left']+x+sx+sw,detectinfo['top']+y+sy+sh), (0,255,0), 2)

def euclidean_distance(detectinfo, point_cloud):
	l = detectinfo['left']
	r = detectinfo['right']
	t = detectinfo['top']
	b = detectinfo['bottom']
	(x, y) = (r-(r-l)//2, b-(b-t)//2)
	detectinfo['center'] = (x, y)
	
	err, point_cloud_value = point_cloud.get_value(x, y)
	distance = math.sqrt(point_cloud_value[0] * point_cloud_value[0] + point_cloud_value[1] * point_cloud_value[1] + point_cloud_value[2] * point_cloud_value[2])
	detectinfo['distance'] = distance

def relative_coordinates(detectinfo, width):
	c = detectinfo['center']
	d = detectinfo['distance']
	St = d*np.pi/2  # Total lenght of arc at distance from camera
	S = (float(c[0]-width/2)/width)*St  # Length of arc between center of picture and center of object
	angle = S/d  # Angle in radians towards object, relative to center of image, calculated from the piece of the arc and it's distance
	x = np.sin(angle)*d  # x coordinates (left/right) in meters, relative to center of camera
	y = np.cos(angle)*d  # y coordinates (forwards/backwards) in meters, relative to center of camera
	detectinfo["angle"] = (angle/(2*np.pi))*360
	detectinfo["x"] = x
	detectinfo["y"] = y


if __name__ == "__main__":
	try:
		detector()
	except rospy.ROSInterruptException:
		pass
