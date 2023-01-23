#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root..."
  exit
fi

sudo apt clean && sudo apt update && sudo apt upgrade -y

echo ' ' && echo ' '
echo '--->> installing basics'
echo ' ' && echo ' '
sudo apt install wget meld git okular curl tree tmux pandoc -y
sudo apt-get install ubuntu-restricted-extras -y
sudo apt install gparted -y
sudo apt install texlive-latex-extra -y

#sudo snap install vlc -y
#sudo apt install wine winetricks -y
#sudo apt install steam
sudo add-apt-repository multiverse

# EOF
