#!/bin/bash


sudo apt update

# installing solaar 
sudo apt install -y udev python3-pyudev python3-psutil python3-xlib python3-yaml \
                 python3-gi gir1.2-gtk-3.0 python3-dev gir1.2-notify-0.7 \
                 gir1.2-ayatanaappindicator3-0.1 gir1.2-ayatanaappindicator3-0.1 \
                 gir1.2-appindicator3-0.1
cd ~/git && git clone https://github.com/pwr-Solaar/Solaar.git
sudo cp -v ~/git/Solaar/rules.d/42-logitech-unify-permissions.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo apt install solaar -y


# EOF

