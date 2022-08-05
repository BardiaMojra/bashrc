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

# xhost +SI:localuser:root
echo ' ' && echo ' '
echo '--->> install pip3 venv...'
echo '--->> enter venv name:'
echo ' ' && echo ' '
read venvname

sudo apt clean && sudo apt update && sudo apt upgrade -y

sudo apt update
sudo apt-get install unityhub
# to remove
# sudo apt-get remove unityhub

sudo apt-get install build-essential libssl-dev libffi-dev python-dev -y
sudo apt install python3-pip -y
sudo pip3 install virtualenv
# create a new venv
virtualenv -p python3 $venvname
source $venvname/bin/activate

echo ' ' && echo ' '
echo '--->> in-venv py version:'
python --version
echo '--->> in-venv py location:'
which python
echo '--->> to deactivate venv, run "deactivate"'
echo ' ' && echo ' '
# EOF
