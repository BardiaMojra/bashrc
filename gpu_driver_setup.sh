#!/bin/bash

sudo apt update
sudo apt upgrade -y

echo '--->> setting up latest nvidia driver... '
echo '--->> blacklist XServer nouveau driver... '
sudo apt-get purge xserver-xorg-video-intel
sudo apt-get purge 'nvidia*'
#sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
#sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

echo '---->>> Confirm the new modprobe config file...'
#cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf
echo '---->>> blacklist nouveau'
echo '---->>> options nouveau modeset=0'

sudo apt autoremove

sudo update-initramfs -u

sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

echo ' '
echo ' ---->>> now set PRIME mode to performance'
echo '    \--->>> run nvidia-settings '
echo '    \--->>> set PRIME mode to Performance '
echo '    \--->>> reboot...'
