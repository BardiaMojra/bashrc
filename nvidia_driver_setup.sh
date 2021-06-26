#!/bin/bash

sudo apt update
sudo apt upgrade -y

printf '\n\n\n\n \----->>> removing nouveau and installing nvidia driver...\n'

sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

printf '\n  \----->>> confirm nouveau is black listed...\n'
printf '    \->>> blacklist nouveau\n'
printf '    \->>> options nouveau modeset=0\n'
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf

printf '\n  \----->>> setup device drivers... \n'
sudo ubuntu-drivers devices
sudo ubuntu-drivers install


printf '\n\n\n  \----->>> nvidia_driver_setup.sh finished... \n\n\n\n'
# EOF 
