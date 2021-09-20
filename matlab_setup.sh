#!/bin/bash

sudo apt update
sudo apt upgrade -y

HOME_=/home/smerx

# setup
printf '\n\n\n\n \---->>> installing matlab...\n'
printf "   \---->>> first, you must download the latest matlab from Mathworks \
user account:"
printf '   \---->>> https://www.mathworks.com/licensecenter/licenses/852709/2406435/products'
printf '\n\n\n\n'


sudo mkdir -p /usr/local/MATLAB/R2021a/
mkdir $HOME_/Downloads/matlab

sudo unzip $HOME_/Downloads/matlab_*.zip -d ~/Downloads/matlab
sudo bash $HOME_/Downloads/matlab/install

# EOF
