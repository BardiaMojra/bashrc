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

echo ' ' && echo ' '
echo '--->> install refind..'
echo ' ' && echo ' '
echo '--->> download latest refind .deb file:'
echo ' ' && echo ' '
echo '--->> https://sourceforge.net/projects/refind/files/'
echo ' ' && echo ' '
pause
echo ' ' && echo ' '
#cd ~/Downloads
sudo dpkg -i ~/Downloads/refind*.deb
sudo apt install thunar -y


# EOF
