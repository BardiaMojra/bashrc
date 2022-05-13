#!/bin/bash
# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

sudo apt clean && sudo apt update #&& sudo apt upgrade -y

printf '\n\n\n --->> setting up device drivers... \n'
sudo apt-get purge xserver-xorg-video-intel
sudo apt-get purge 'nvidia*'
sudo apt autoremove


printf '\n\n\n ---->>> Blacklist nouveau (xServer) graphics driver...'
## Pause it ##
pause
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
printf '\n ---->>> Confirm the new modprobe config file...'
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf
sudo update-initramfs -u
printf '\n\n\n --->> install recommended Nvidia driver... \n'
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
printf '\n\n'
printf ' ---->>> now set PRIME mode to performance\n'
printf '    \--->>> run nvidia-settings \n'
printf '    \--->>> set PRIME mode to Performance \n'
printf '    \--->>> reboot...\n'
## Pause it ##
pause


printf '\n\n\n --->> install Solaar... \n'
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt update && sudo apt install solaar

printf '\n\n\n --->> enable A2DP (High Fidelity) bluetooth audio... \n'
sudo apt install pulseaudio pulseaudio-utils pavucontrol pulseaudio-module-bluetooth
sudo cp ./audio.conf /etc/bluetooth/audio.conf
sudo service bluetooth restart

printf '\n\n\n --->> upgrade packages... \n'
## Pause it ##
pause

sudo apt upgrade 

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

#printf '\n\n\n --->> installing Google Chrome... \n'
#wget -O google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
#sudo dpkg -i google-chrome.deb
#rm google-chrome.deb

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
