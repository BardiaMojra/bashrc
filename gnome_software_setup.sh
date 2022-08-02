#!/bin/bash
# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue..."
 echo ""
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt clean && sudo apt update && sudo apt upgrade -y


echo ' ' && echo ' '
echo ' --->> setting up gnome software center (app store)...'
echo ' ' && echo ' '
sudo apt autoremove gnome-software -y && sudo apt install gnome-software -y
