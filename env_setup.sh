#!/bin/bash

function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

if [ "$EUID" -ne 0 ]
  echo ' ' && echo ' '
  then echo "please run as root..."
  echo ' ' && echo ' '
  exit
fi

sudo apt clean && sudo apt update && apt upgrade -y

# xhost +SI:localuser:root
echo ' ' && echo ' '
echo '--->> perform step by step... '
echo ' ' && echo ' '
pause
echo ' ' && echo ' '
echo '--->> setting up latest nvidia driver... '
echo ' ' && echo ' '
sudo apt-get purge xserver-xorg-video-intel
sudo apt-get purge 'nvidia*'
sudo apt autoremove
echo ' ---->>> Blacklist nouveau (xServer) graphics driver...'
pause
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
echo ' ' && echo ' '
echo ' ---->>> Confirm the new modprobe config file...'
echo ' ' && echo ' '
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf

sudo update-initramfs -u
echo ' ' && echo ' '
echo ' --->> install recommended Nvidia driver.'
echo ' ' && echo ' '
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
echo ' ' && echo ' '
echo ' ---->>> now set PRIME mode to performance'
echo '    \--->>> run nvidia-settings '
echo '    \--->>> set PRIME mode to Performance '
echo '    \--->>> reboot...'
echo ' ' && echo ' '
pause

echo ' ' && echo ' '
echo '--->> install Solaar... '
echo ' ' && echo ' '
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt update && sudo apt install solaar -y

echo ' ' && echo ' '
echo '--->> enable A2DP (High Fidelity) bluetooth audio... '
echo ' ' && echo ' '
sudo apt install pulseaudio pulseaudio-utils pavucontrol pulseaudio-module-bluetooth -y
sudo cp ./audio.conf /etc/bluetooth/audio.conf
sudo service bluetooth restart

echo ' ' && echo ' '
echo '--->> upgrade package'
echo ' ' && echo ' '
sudo apt upgrade -y

echo ' ' && echo ' '
echo '--->> install basics'
echo ' ' && echo ' '
sudo apt install wget meld git okular curl tree tmux pandoc -y
sudo apt-get install ubuntu-restricted-extras -y

echo ' ' && echo ' '
echo '--->> install gnome-shell-extension'
echo ' ' && echo ' '
sudo apt install gnome-shell-extensions -y

#git config --global user.email "bardia.mojra@gmail.com"
#git config --global user.name "bardi"
#git init #Turn an existing directory into a git repository

# set MS fonts
echo ' ' && echo ' '
echo '--->> install ms fonts'
echo ' ' && echo ' '
pause
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v
# reinstall if accidentally reject the license agreement
sudo apt install --reinstall ttf-mscorefonts-installer
sudo apt-get update --fix-missing

cp ./.bashrc ~/.bashrc


# EOF
