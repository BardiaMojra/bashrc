 #!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt clean && sudo apt update && sudo apt upgrade -y

# install MS teams
echo 'installing latest ms teams...'
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list
sudo apt update
sudo snap install teams

# EOF
