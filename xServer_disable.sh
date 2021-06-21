#!/bin/bash

printf '\n\n\n ---->>> Blacklist nouveau (xServer) graphics driver...'
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

printf '\n ---->>> Confirm the new modprobe config file...'
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf

sudo update-initramfs -u

printf '\n\n ---->>> Reboot system for updates to take effect...\n'


# EOF
