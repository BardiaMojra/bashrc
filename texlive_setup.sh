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
echo '--->> install texlive...'
echo ' ' && echo ' '
sudo apt clean && sudo apt update && sudo apt upgrade -y
sudo apt install texlive-full -y
