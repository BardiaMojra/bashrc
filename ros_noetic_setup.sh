#!/bin/bash

sudo apt update
sudo apt upgrade -y

echo "# ----->>> ROS setup <<<-----" >> ~/.bashrc
# install ROS http://wiki.ros.org/noetic/Installation/Ubuntu 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt install ros-noetic-desktop-full
#source /opt/ros/noetic/setup.bash # source ROS bash terminal 
# or 
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
#source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y 
sudo apt install python3-rosdep -y # setup ROS dep 
sudo rosdep init 
rosdep update
# i.g. install ROS packages 
#sudo apt install ros-noetic-slam-gmapping
# dont forget to add ROS and Gazebo master IP's
echo 'export ROS_HOSTNAME=localhost' >> ~/.bashrc
echo 'export ROS_MASTER_URI=http://localhost:11311' >> ~/.bashrc
