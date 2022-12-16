#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root..."
  exit
fi

sudo apt clean && sudo apt update && sudo apt upgrade -y

# set MS fonts
echo ' ' && echo ' '
echo '--->> installing ms fonts...'
echo ' ' && echo ' '
sudo add-apt-repository multiverse
sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v
# reinstall if accidentally reject the license agreement
sudo apt install --reinstall ttf-mscorefonts-installer
sudo apt-get update --fix-missing

# EOF
