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

printf '\n\n\n --->> perform step by step... \n'
printf '\n\n\n --->> git credentials format: https://user:pass@example.com \n'
pause
printf '\n\n\n --->> setting up git config... \n'

git config --global credential.helper 'store --file ./../../.git-credentials'
#git config --global user.email "bardia.mojra@gmail.com"
#git config --global user.name "bardi"
#git init #Turn an existing directory into a git repository
cp ./.git-credentials ./../../.git-credentials

# EOF
