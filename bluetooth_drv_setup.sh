#!/bin/bash

# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

sudo apt clean && sudo apt update && sudo apt upgrade -y
echo ' ---->>> installing latest bluetooth driver...'
sudo add-apt-repository ppa:blaze/rtbth-dkms
sudo apt update
sudo apt install rtbth-dkms

echo ''
echo "Add the command modprobe 'rtbth &> /dev/null' right before 'exit 0' and save."
echo ''

## Pause it ##
pause

sudo gedit /etc/rc.local

sudo chmod 777 /etc/rc.local
sudo apt install blueman -y

# EOF
