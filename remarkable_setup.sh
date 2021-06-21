#!/bin/bash

wget -O remarkable.deb http://remarkableapp.github.io/files/remarkable_1.87_all.deb 
sudo dpkg -i remarkable.deb

# force install missing dependencies
sudo apt-get -f install



# EOF
