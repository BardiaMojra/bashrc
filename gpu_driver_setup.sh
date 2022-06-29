#!/bin/bash

sudo apt update
sudo apt upgrade -y

printf '\n\n\n --->> setting up latest nvidia driver... \n'
printf '\n\n\n --->> blacklist XServer nouveau driver... \n'
sudo apt-get purge xserver-xorg-video-intel
sudo apt-get purge 'nvidia*'
#sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
#sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

printf '\n ---->>> Confirm the new modprobe config file...'
#cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf

sudo apt autoremove

sudo update-initramfs -u

sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

printf '\n\n'
printf ' ---->>> now set PRIME mode to performance\n'
printf '    \--->>> run nvidia-settings \n'
printf '    \--->>> set PRIME mode to Performance \n'
printf '    \--->>> reboot...\n'
