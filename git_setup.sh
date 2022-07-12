#!/bin/bash
# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue..."
 echo ""
}
sudo apt clean && sudo apt update # && sudo apt upgrade -y

# xhost +SI:localuser:root

printf '\n\n\n --->> perform step by step... \n'
pause
printf '\n\n\n --->> setting up git config... \n'

git config --global credential.helper 'store --file ~/.my-credentials'






#git config --global user.email "bardia.mojra@gmail.com"
#git config --global user.name "bardi"
#git init #Turn an existing directory into a git repository

sudo apt update
sudo apt upgrade -y

# printf '\n\n\n --->> installing Google Chrome... \n'
# wget -O google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
# sudo dpkg -i google-chrome.deb
# rm google-chrome.deb

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
