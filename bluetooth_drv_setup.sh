#!/bin/bash

# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

sudo apt clean && sudo apt update && sudo apt upgrade -y
printf '\n\n\n ---->>> installing latest bluetooth driver...'
sudo add-apt-repository ppa:blaze/rtbth-dkms
sudo apt update
sudo apt install rtbth-dkms

printf "Add the command modprobe 'rtbth &> /dev/null' right before 'exit 0' and save."

## Pause it ##
pause

sudo gedit /etc/rc.local

sudo chmod 777 /etc/rc.local
sudo apt install blueman


printf '\n\n'
printf ' ---->>> now set PRIME mode to performance\n'
printf '    \--->>> run nvidia-settings \n'
printf '    \--->>> set PRIME mode to Performance \n'


# EOF
