#!/bin/bash
# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue..."
 echo ""
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root...\n"
  exit
fi
sudo apt clean && sudo apt update # && sudo apt upgrade -y

# xhost +SI:localuser:root

printf '--->> perform step by step... '
printf '--->> git credentials format: https://user:pass@example.com '
pause
printf ' '
printf '--->> setting up git config...'
printf 'store credentials at  ~/.git-credentials'

git config --global credential.helper store
#git config --global user.email "bardia.mojra@gmail.com"
#git config --global user.name "bardi"
#git init #Turn an existing directory into a git repository
cp ./.git-credentials ~/.git-credentials

# EOF
