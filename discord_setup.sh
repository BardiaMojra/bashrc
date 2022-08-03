#!/bin/bash

function pause(){
 read -s -n 1 -p "Press any key to continue..."
 echo " "
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root..."
  exit
fi

echo ' ' && echo ' '
echo ' --->> installing latest discord...'
echo ' ' && echo ' '
sudo apt clean && sudo apt update && sudo apt upgrade -y
sudo apt install gconf-service gconf-service-backend gconf2-common libappindicator1 \
                 libatomic1 libc++1 libc++1-10 libc++abi1-10 libdbusmenu-gtk4 libgconf-2-4
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i ./discord.deb
