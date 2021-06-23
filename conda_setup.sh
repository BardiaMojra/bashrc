#!/bin/bash 


printf '\n\n\n\n \---->>> installing latest conda...\n'

#install latest Conda 
wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-Linux-x86_64\.sh\)\">64-Bit (x86) Installer.*@\1@p' | xargs wget

mv Anaconda3*.sh anaconda3.sh
sudo chmod +x anaconda3.sh
sudo bash anaconda3.sh
sudo rm anaconda3.sh



# EOF
