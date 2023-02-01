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



#todo ----------------------------------------------------------------->> installing solaar
#todo install script (perhaps full) from mybash
# sudo apt install udev python3-pyudev python3-psutil python3-xlib python3-yaml \
# python3-gi gir1.2-gtk-3.0 python3-dev gir1.2-notify-0.7 \
# gir1.2-ayatanaappindicator3-0.1 gir1.2-ayatanaappindicator3-0.1 \
# gir1.2-appindicator3-0.1
# then do:
# You can install this rule by copying, as root, rules.d/42-logitech-unify-permissions.rules from Solaar to /etc/udev/rules.d. You will probably also have to tell udev to reload its rule via sudo udevadm control --reload-rules.
echo ' ' && echo ' '
echo '--->> setting up Solaar... '
echo ' ' && echo ' '
echo ' ' && echo ' '
echo '--->> read todo note at ./solaar_setup.sh.'
echo ' ' && echo ' '
pause

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
