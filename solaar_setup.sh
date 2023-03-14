#!/bin/bash

function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


echo ' ' && echo ' ' && echo '--->> setting up Solaar... ' && echo ' ' && echo ' '
# xhost +SI:localuser:rootpause
sudo apt clean && sudo apt update && apt upgrade -y
sudo apt install udev python3-pyudev python3-psutil python3-xlib python3-yaml \
python3-gi gir1.2-gtk-3.0 python3-dev gir1.2-notify-0.7 \
gir1.2-ayatanaappindicator3-0.1 gir1.2-ayatanaappindicator3-0.1 \
gir1.2-appindicator3-0.1 -y

sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt-get update

sudo apt install solaar -y

sudo cp 42-logitech-unify-permissions.rules /etc/udev/rules.d
sudo udevadm control --reload-rules # reload udev rules

echo ' ' && echo ' '
echo '--->> add solaar to startup applications... '
echo '--->> Name: Solaar'
echo '--->> Command: solaar'
echo ' ' && echo ' '
pause

echo '--->> end of setup'

# EOF
