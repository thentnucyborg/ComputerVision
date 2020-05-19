behaviourdetection
=====

This repository contains the source code for the ROS workspace including the NTNU Cyborg's Computer Vision Module, which should be installed on the [Jetson TX1 Development Kit](https://developer.nvidia.com/embedded/jetson-tx1-developer-kit). The system uses the first generation [ZED Stereo Camera](https://www.stereolabs.com/zed/) to detect human behaviour. The repository includes the source files for [pyyolo](https://github.com/digitalbrain79/pyyolo) and [sort](https://github.com/abewley/sort)

Node name: jetsontx1_cvmodule Language: Python
### Dependencies
Following packages and ther dependendencies should be installed, before proceeding to the "Installation" section:
1. [OpenCV](https://pypi.org/project/opencv-python/) (Allready installed if TX1 is flashed with JetPack)
0. [CUDA](https://developer.nvidia.com/cuda-downloads) (Allready installed if TX1 is flashed with JetPack)
0. Python 2.7 (Allready installed if TX1 is flashed with JetPack)
0. [ZED SDK](https://www.stereolabs.com/docs/installation/jetson/)
0. [ZED Python API](https://github.com/stereolabs/zed-python-api)
0. [scikit-learn](http://scikit-learn.org/stable/)
0. [scikit-image](http://scikit-image.org/download)
0. [FilterPy](https://github.com/rlabbe/filterpy)
### Installation
1. Install and configure a catkin ROS environment by following [the ROS tutorials](http://wiki.ros.org/ROS/Tutorials)
0. Clone this repository and copy the folder "jetsontx1_cvmodule" into the src folder in your ROS workspace where the ROS packages should be located.
0. Build the ROS package by using the command "catkin_make" in the catkin workspace terminal window.
0. Locate the pyyolo folder in the terminal and install using the commands as following:
    1. make
    0. rm -rf build/
    0. python setup_gpu.py build
    0. sudo python setup_gpu.py install

### Run the system
To launch the main code publishing info about detected human behaviour:
```
rosrun jetsontx1_cvmodule behaviourdetection.py
```
To launch the example of a code subscribing to the Topics published by behaviourdetection.py:
```
rosrun jetsontx1_cvmodule subscribertest.py
```
Instead of running behaviourdetection.py, you can play the rosbag file testbagfile.bag:
```
rosbag play testbagfile.bag
```
If subscribertest.py is allready running it should visualize the a sample of the published topic ”videostream”. Also, it will print information about detected people ID and smile/face indication, in the terminal.

**Note:** This installation is tested on a Jetson TX1 board running a version of Ubuntu 18.04 with ROS Melodic.

**Note:** Read the report on how to integrate the CV-module on the Jetson board with the Cyborg.
