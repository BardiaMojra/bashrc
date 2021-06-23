#!/bin/bash

# config
_cv_version="3.4.9"

printf '\n\n\n\n ---->>> setting up opencv-%s source files...\n' ${_cv_version}
# setup

## dependencies
sudo apt update
sudo apt-get install build-essential -y # compiler
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y  # required dependencies
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y # optional dependencies

## if $1 is not passed, set to the current working dir using $PWD
_dir="${1:-${PWD}}"

## die if $dir does not exist
[ ! -d "$_dir" ] && { echo "Error: Directory $_dir not found."; exit 2; }

mkdir opencv-${_cv_version} #&& cd opencv-$_cv_version

## get source files
git clone https://github.com/opencv/opencv.git
git -C opencv checkout ${_cv_version}
sudo rm -rfv opencv-${_cv_version}/opencv/.git*

git clone https://github.com/opencv/opencv_contrib.git
git -C opencv_contrib checkout ${_cv_version}
sudo rm -rfv opencv-${_cv_version}/opencv_contrib/.git*
# EOF
