#!/bin/bash

sudo apt update
sudo apt upgrade -y

# install MS teams 
echo '\n\n installing latest ms teams...\n\n'
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list
sudo apt update
sudo apt install teams

# EOF

