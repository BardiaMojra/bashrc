#!/bin/bash

sudo apt update

# download and install latest Discord
printf '\n\n\n --->> Installing latest Discord...\n'
sudo apt install gconf-service gconf-service-backend gconf2-common libappindicator1 \
                 libatomic1 libc++1 libc++1-10 libc++abi1-10 libdbusmenu-gtk4 libgconf-2-4
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i ./discord.deb

printf ' \-->> Discord installation finished...'
