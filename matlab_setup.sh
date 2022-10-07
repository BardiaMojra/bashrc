#!/bin/bash

# to uninstall, remove symb link and bin
#sudo rm /usr/local/bin/matlab /usr/local/bin/mcc /usr/local/bin/mex /usr/local/bin/mbuild
#sudo rm -rf /usr/local/MATLAB/R2022b

# in bashrc
#alias matlab21a="/usr/local/MATLAB/R2021a/bin/matlab . &"

sudo apt clean && sudo apt update && sudo apt upgrade -y

# setup
echo ' \---->>> installing matlab...'
echo "   \---->>> first, you must download the latest matlab from Mathworks \
user account:"
echo '   \---->>> https://www.mathworks.com/licensecenter/licenses/852709/2406435/products'
echo ''


sudo mkdir -p /usr/local/MATLAB/R2022a/
mkdir ~/Downloads/matlab

sudo unzip ~/Downloads/matlab_*.zip -d ~/Downloads/matlab
sudo chmod -R 777 ~/Downloads/matlab
cd ~/Downloads/matlab
sudo ./install

#sudo chmod a+w -R ~/git/matlab-snippets
#bash 'matlab-snippets/MATLAB Snippets.mlappinstall'

#echo ' \---->>> cloning matlab snippets repo...'
#cd ~/git && git clone https://github.com/trnkap/matlab-snippets.git matlab-snippets
#echo ' \---->>> install snippets by using "Install App" inside matlab...'



# EOF
