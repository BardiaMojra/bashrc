#!/bin/bash

sudo apt update && sudo apt upgrade -y

# setup
echo ' \---->>> installing matlab...'
echo "   \---->>> first, you must download the latest matlab from Mathworks \
user account:"
echo '   \---->>> https://www.mathworks.com/licensecenter/licenses/852709/2406435/products'
echo ''


sudo mkdir -p /usr/local/MATLAB/R2022a/
mkdir ~/Downloads/matlab

sudo unzip ~/Downloads/matlab_*.zip -d ~/Downloads/matlab
sudo su
bash ~/Downloads/matlab/install

# EOF
