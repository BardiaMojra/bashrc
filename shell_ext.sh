#!/bin/bash


if [ "$EUID" -ne 0 ]
  then echo "Please run as root..."
  exit
fi
sudo apt clean && sudo apt update && sudo apt upgrade -y
printf '\n\n\n ---->>> installing the latest gnome shell extension...'
# install latest Gnome Shell extension
sudo apt install -y gnome-tweaks
sudo apt install -y gnome-shell-extensions
sudo apt install -y chrome-gnome-shell

# system monitor
sudo apt install gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 gnome-system-monitor -y
# ros moveit tutorials
#https://www.youtube.com/watch?v=18SQssJ-l_Y
#https://www.youtube.com/watch?v=ayp87SjrwPc
#https://www.youtube.com/user/RobotiqTV
# EOF
