#!/bin/bash

sudo apt update
sudo apt upgrade -y

# install basics
sudo apt install wget meld git okular curl tree -y 
#Turn an existing directory into a git repository
# sudo apt install texlive-full	-y
sudo apt-get install ubuntu-restricted-extras -y

printf '\n\n\n --->> Setting up device drivers... \n'
sudo ubuntu-drivers devices
sudo ubuntu-drivers install

git config --global user.email "bardia.mojra@gmail.com"
git config --global user.name "bardi"

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

# EOF

