#!/bin/bash

sudo apt update
sudo apt upgrade -y

# setup
printf '\n\n\n\n \---->>> installing matlab...\n'
ls ~/Downloads/ # make matlab file already downloaded
sudo mkdir -p /usr/local/MATLAB/R2021a/
mkdir ~/Downloads/matlab
sudo unzip ~/Downloads/matlab_R2018a_glnxa64.zip -d ~/Downloads/matlab 
sudo ~/Downloads/matlab/install

# EOF
