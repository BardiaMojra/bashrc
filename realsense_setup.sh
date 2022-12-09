#!/bin/bash

# @link https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md

function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}


sudo apt clean && sudo apt update && apt upgrade -y

# xhost +SI:localuser:root
echo ' ' && echo ' '
echo '--->> installing librealsense2 ...'
echo ' ' && echo ' '

sudo apt-get install librealsense2-dkms
sudo apt-get install librealsense2-utils

echo ' ' && echo ' '
echo '--->> installing dev packages ...'
echo ' ' && echo ' '
sudo apt-get install librealsense2-dev
sudo apt-get install librealsense2-dbg

echo ' ' && echo ' '
echo '--->> With dev package installed, you can compile an application with librealsense using "g++ -std=c++11 filename.cpp -lrealsense2" or an IDE of your choice.'
echo ' ' && echo ' '


echo ' ' && echo ' '
echo '--->> Reconnect the Intel RealSense depth camera and run: "realsense-viewer" to verify the installation..'
echo ' ' && echo ' '



# EOF
