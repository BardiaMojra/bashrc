 #!/bin/bash

function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt clean && sudo apt update && sudo apt upgrade -y

# install MS teams
echo ' ' && echo ' ' && echo '--->> installing latest ms teams...' && echo ' ' && echo ' '
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list
sudo apt update
sudo snap install teams-for-linux

## or
# wget -P ~/Downloads/ https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.5.00.10453_amd64.deb
# sudo dpkg -i teams_1.5.00.10453_amd64.deb
# sudo apt --fix-broken install
# EOF
