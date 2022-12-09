#!/bin/bash

function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}


sudo apt clean && sudo apt update && apt upgrade -y

# xhost +SI:localuser:root
echo ' ' && echo ' '
echo '--->> installing Slimbook Batter applet...'
echo ' ' && echo ' '

sudo add-apt-repository ppa:slimbook/slimbook
sudo apt update
sudo apt install slimbookbattery

echo ' ' && echo ' '
echo '--->> to remove, run: '
echo '      sudo apt remove slimbookbattery'
echo '      sudo add-apt-repository -r ppa:slimbook/slimbook'




# EOF
