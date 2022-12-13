#!/bin/bash

function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}


sudo apt clean && sudo apt update && apt upgrade -y

# xhost +SI:localuser:rootpause
echo ' ' && echo ' '
echo '--->> setting up Solaar... '
echo ' ' && echo ' '

sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt-get update

# install solaar
sudo apt install solaar -y

sudo cp 42-logitech-unify-permissions.rules /etc/udev/rules.d
sudo udevadm control --reload-rules # reload udev rules

echo ' ' && echo ' '
echo '--->> add solaar to startup applications... '
echo '--->> Name: Solaar'
echo '--->> Command: solaar'
echo ' ' && echo ' '



# EOF
