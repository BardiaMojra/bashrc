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

# xhost +SI:localuser:root

echo ' --->> install Solaar... '
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt update && sudo apt install solaar -y

echo ' --->> enable A2DP (High Fidelity) bluetooth audio... '
sudo apt install pulseaudio pulseaudio-utils pavucontrol pulseaudio-module-bluetooth
sudo cp ./audio.conf /etc/bluetooth/audio.conf
sudo service bluetooth restart

echo ' --->> upgrade packages... '
sudo apt upgrade -y

echo ' --->> install basics... '
sudo apt install wget meld git okular curl tree tmux -y
sudo apt-get install ubuntu-restricted-extras -y

echo ' --->> install texlive? '
sudo apt install texlive-full -y
sudo apt install  gnome-shell-extensions -y

curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

sudo apt clean && sudo apt update && sudo apt upgrade -y

# set MS fonts
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v
# reinstall if accidentally reject the license agreement
sudo apt install --reinstall ttf-mscorefonts-installer
sudo apt-get update --fix-missing

cp ./.bashrc ./../..
#https://www.displaylink.org/forum/showthread.php?t=67148

# EOF
