#!/usr/bin/env bash
function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

# if [ "$EUID" -ne 0 ]
#   echo ' ' && echo ' '
#   then echo "please run as root..."
#   echo ' ' && echo ' '
#   exit
# fi

sudo apt clean && sudo apt update && apt upgrade -y


## user user stuff
# xhost +SI:localuser:root
# Run root's shell profile, change to root's home dir.
 #sudo -u root -i eval 'echo $SHELL - $USER - $HOME - $PWD'
# Don't run root's shell profile, use current working dir.
# Note the required -H to define $HOME as root`s home dir.
 #sudo -u root -H -s eval 'echo $SHELL - $USER - $HOME - $PWD'



sudo -u root -H -s bash refind_setup.sh
sudo -u root -H -s bash basics_setup.sh
sudo -u root -H -s bash git_setup.sh

#sudo bash msfonts_setup.sh

sudo -u root -H -s bash shell_ext_setup.sh
#sudo -u root -H -s bash vscode_setup.sh
sudo -u root -H -s bash gnome_software_setup.sh
sudo -u root -H -s bash teams_setup.sh
sudo -u root -H -s bash bluetooth_drv_setup.sh
sudo -u root -H -s bash slimbookbattery_setup.sh
sudo -u root -H -s bash solaar_setup.sh
sudo -u root -H -s bash spotify_setup.sh


sudo -u root -H -s cp ./.bashrc ~/.bashrc
sudo -u root -H -s source ~/.bashrc


echo ' ' && echo ' '
echo '--->> install shell extensions...'
echo ' ' && echo ' '
okular shell_ext.pdf &
pause

echo ' ' && echo ' '
echo '--->> setup finished'
echo ' ' && echo ' ' && echo ' ' && echo ' '


# EOF
