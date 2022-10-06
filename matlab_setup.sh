#!/bin/bash

sudo apt update && sudo apt upgrade -y

# setup
echo ' \---->>> installing matlab...'
echo "   \---->>> first, you must download the latest matlab from Mathworks \
user account:"
echo '   \---->>> https://www.mathworks.com/licensecenter/licenses/852709/2406435/products'
echo ''


sudo mkdir -p /usr/local/MATLAB/R2021a/
mkdir ~/Downloads/matlab

sudo unzip ~/Downloads/matlab_*.zip -d ~/Downloads/matlab
sudo chmod -R 777 ~/Downloads/matlab
cd ~/Downloads/matlab
sudo ./install
sudo chmod a+w -R ~/.matlab/R2022b/

echo ' \---->>> cloning matlab snippets repo...'
cd ~/git && git clone https://github.com/trnkap/matlab-snippets.git matlab-snippets
echo ' \---->>> install snippets by using "Install App" inside matlab...'

#sudo chmod a+w -R ~/git/matlab-snippets
#bash 'matlab-snippets/MATLAB Snippets.mlappinstall'





# EOF
