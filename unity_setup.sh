#!/bin/bash

function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

if [ "$EUID" -ne 0 ]
  echo ' ' && echo ' '
  then echo "please run as root..."
  echo ' ' && echo ' '
  exit
fi

# xhost +SI:localuser:root
echo ' ' && echo ' '
echo '--->> setting up latest unity hub... '
echo ' ' && echo ' '
sudo apt clean && sudo apt update && sudo apt upgrade -y
sudo sh -c 'echo "deb https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
sudo apt update
sudo apt-get install unityhub
# to remove
# sudo apt-get remove unityhub
# EOF
