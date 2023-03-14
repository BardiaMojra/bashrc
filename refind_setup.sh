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

echo ' ' && echo ' ' && echo '--->> install refind..' && echo ' ' && echo ' '
echo '--->> download latest refind .deb file:'
echo '--->> https://sourceforge.net/projects/refind/files/' && echo ' ' && echo ' '
wget -P ~/Downloads/ https://sourceforge.net/projects/refind/files/0.14.0.2/refind_0.14.0.2-1_amd64.deb
pause
sudo -u root -H -s dpkg -i ../../Downloads/refind*.deb
sudo -u root -H -s apt install thunar -y
echo '--->> in thunar...' && echo ' ' && echo ' '
echo '--->> go to /boot/efi/EFI/' && echo ' ' && echo ' '
echo '--->> create "IGNORE"' && echo ' ' && echo ' '
echo '--->> mv boot, ubuntu, and tools to IGNORE dir' && echo ' ' && echo ' '
pause
sudo -u root -H -s thunar

# EOF
