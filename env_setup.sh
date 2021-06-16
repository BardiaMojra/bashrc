#!/bin/bash

sudo apt update
sudo apt upgrade -y

# install basics
sudo apt install wget meld git okular texlive-full tree -y
#Turn an existing directory into a git repository

echo '\n\n --> installing Google Chrome'
wget -O google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' 
sudo dpkg -i google-chrome.deb
rm google-chrome.deb


echo '\n\n --> installing Conda'
install latest Conda 
#wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-Linux-x86_64\.sh\)\">64-Bit (x86) Installer.*@\1@p' | xargs wget



# set MS fonts 
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v
# reinstall if accidently reject the license agreement 
#sudo apt install –reinstall ttf-mscorefonts-installer





# installing solaar 
conda create -n solaar python=3.7
conda activate solaar
conda install -c pdrops pyudev
sudo apt install -y udev python3-pyudev python3-psutil python3-xlib python3-yaml \
                 python3-gi gir1.2-gtk-3.0 python3-dev gir1.2-notify-0.7 \
                 gir1.2-ayatanaappindicator3-0.1 gir1.2-ayatanaappindicator3-0.1 \
                 gir1.2-appindicator3-0.1
cd ~/git && git clone https://github.com/pwr-Solaar/Solaar.git
sudo cp -v ~/git/Solaar/rules.d/42-logitech-unify-permissions.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo apt install solaar 


# download and install latest Discord
sudo apt install gconf-service gconf-service-backend gconf2-common libappindicator1 \
                 libatomic1 libc++1 libc++1-10 libc++abi1-10 libdbusmenu-gtk4 libgconf-2-4
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i ./discord.deb


cp ~/git/bashrc/.bashrc ~
# EOF


sudo apt-get install ubuntu-restricted-extras
