#!/bin/bash
# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue..."
 echo ""
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt clean && sudo apt update && sudo apt upgrade -y

echo '' && echo '' && echo '--->> setting up latest nvidia driver...' && echo '' && echo ''

echo '' && echo '' && echo '--->> remove nvidia driver and packages...' && echo '' && echo ''
sudo apt-get --purge remove "*cuda*" "*cublas*" "*cufft*" "*cufile*" "*curand*" \
 "*cusolver*" "*cusparse*" "*gds-tools*" "*npp*" "*nvjpeg*" "nsight*" "*nvvm*"
sudo apt-get --purge remove "*nvidia*" "libxnvctrl*" -y
sudo apt clean && sudo apt-get autoremove -y

echo '' && echo '' && echo '--->> blacklist XServer nouveau driver...' && echo '' && echo ''
sudo apt-get purge xserver-xorg-video-intel
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"
sudo bash -c "echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

echo '' && echo '' && echo '---->>> Confirm the new modprobe config file...'
echo '---->>> blacklist nouveau'
echo '---->>> options nouveau modeset=0' && echo '' && echo ''
cat /etc/modprobe.d/blacklist-nvidia-nouveau.conf
sudo apt autoremove -y
sudo add-apt-repository ppa:graphics-drivers/ppa --yes
sudo update-initramfs -u
sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall
sudo apt update

echo '' && echo ''
echo ' ---->>> now set PRIME mode to performance'
echo '    \--->>> run nvidia-settings '
echo '    \--->>> set PRIME mode to Performance '
echo '    \--->>> reboot...'


# still not detecting one or more external monitors? Check modeset settings
# Looks like you ran into a driver bug with 430.50 where the gpu thinks it has no outputs. Try adding the graphics ppa and update to 440. Alternatively, run
# grep nvidia /etc/modprobe.d/* /lib/modprobe.d/*
#to find a file containing
# options nvidia-drm modeset=1
#and change 1 to 0
#then run
#sudo update-initramfs -u
# and reboot.
