#!/bin/bash

function pause(){ # pause function
 read -s -n 1 -p "Press any key to continue..."
 echo ""
}

# if [ "$EUID" -ne 0 ] # check sudo
#   echo ' ' && echo ' '
#   then echo "please run as root..."
#   echo ' ' && echo ' '
#   exit
# fi

sudo apt clean && sudo apt update && sudo apt upgrade -y

# install dependencies
sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

echo ' ' && echo ' ' && echo ' \---->>> installing latest conda...' && echo ' ' && echo ' '
pause
#install latest Conda
wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-Linux-x86_64\.sh\)\">64-Bit (x86) Installer.*@\1@p' | xargs wget

mv Anaconda3*.sh conda3.sh
sudo chmod +x conda3.sh
echo ' ' && echo ' '
echo ' \---->>> run:'
echo ' bash conda3.sh && rm conda3.sh'
echo ' ' && echo ' '
# pause
# bash conda3.sh
# rm conda3.sh



# EOF
