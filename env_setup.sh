#!/bin/bash

function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

if [ "$EUID" -ne 0 ]
  echo ' ' && echo ' '
  then echo "please run as root..."
  echo ' ' && echo ' '
  exit
fi

sudo apt clean && sudo apt update && apt upgrade -y

# xhost +SI:localuser:root


echo ' ' && echo ' '
echo '--->> install basics'
echo ' ' && echo ' '
sudo apt install wget meld git okular curl tree tmux pandoc -y
sudo apt-get install ubuntu-restricted-extras -y

echo ' ' && echo ' '
echo '--->> install gnome-shell-extension'
echo ' ' && echo ' '
sudo apt install gnome-shell-extensions -y

sudo bash git_setup.sh
sudo bash vscode_setup.sh
sudo bash refind_setup.sh
sudo bash gnome_software_setup.sh
sudo bash teams_setup.sh
sudo bash bluetooth_drv_setup.sh
sudo bash shell_ext_setup.sh
sudo bash slimbookbattery_setup.sh
sudo bash solaar_setup.sh
sudo bash spotify_setup.sh



okular shell_ext.pdf



# set MS fonts
echo ' ' && echo ' '
echo '--->> install ms fonts'
echo ' ' && echo ' '
pause
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v
# reinstall if accidentally reject the license agreement
sudo apt install --reinstall ttf-mscorefonts-installer
sudo apt-get update --fix-missing

cp ./.bashrc ~/.bashrc


# EOF
