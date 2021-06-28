#!/bin/bash

printf '\n\n\n ---->>> Blacklist nouveau (xServer) graphics driver...'
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

printf '\n ---->>> Confirm the new modprobe config file...'
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf

sudo update-initramfs -u

printf '\n\n'
printf ' ---->>> now set PRIME mode to performance\n'
printf '    \--->>> run nvidia-settings \n'
printf '    \--->>> set PRIME mode to Performance \n'
printf '    \--->>> reboot...\n'


# EOF
