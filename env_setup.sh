#!/bin/bash


sudo apt update

printf '\n\n\n --->> setting up device drivers... \n'
sudo apt-get purge xserver-xorg-video-intel
sudo apt-get purge 'nvidia*'
sudo apt autoremove
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

printf '\n\n\n --->> enable A2DP (High Fidelity) bluetooth audio... \n'
sudo apt install pulseaudio pulseaudio-utils pavucontrol pulseaudio-module-bluetooth
sudo cp ./audio.conf /etc/bluetooth/audio.conf
sudo service bluetooth restart

printf '\n\n\n --->> upgrade packages... \n'
sudo apt upgrade -y

printf '\n\n\n --->> install basics... \n'
sudo apt install wget meld git okular curl tree tmux -y
sudo apt-get install ubuntu-restricted-extras -y
sudo apt install

printf '\n\n\n --->> install texlive? \n'
sudo apt install texlive-full

#git config --global user.email "bardia.mojra@gmail.com"
#git config --global user.name "bardi"
#git init #Turn an existing directory into a git repository

sudo apt update
sudo apt upgrade -y

printf '\n\n\n --->> installing Google Chrome... \n'
wget -O google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
sudo dpkg -i google-chrome.deb
rm google-chrome.deb

# set MS fonts
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v
# reinstall if accidentally reject the license agreement
sudo apt install --reinstall ttf-mscorefonts-installer
sudo apt-get update --fix-missing

cp ./.bashrc ./../..
#https://www.displaylink.org/forum/showthread.php?t=67148

# EOF
