#!/bin/bash
# @link https://askubuntu.com/questions/1240123/how-to-enable-the-hibernate-option-in-ubuntu-20-04

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
echo ' --->> assuming SWAP partition available.'
echo ' --->> install pm-utils and hibernate ... '
sudo apt install pm-utils hibernate
cat /sys/power/state
echo '--->> confirm you see--> freeze mem disk '
echo '--->> run "grep swap /etc/fstab" '
echo '--->> copy the UUID'
# swap was on /dev/nvme0n1p2 during installation
echo 'UUID=0736da4f-f262-4c37-b92a-8625f1b34ede'

echo '--->> run "sudo gedit /etc/default/grub" '
echo '--->> change the line that says '
echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" '
echo '--->> so that it instead says '
echo 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=0736da4f-f262-4c37-b92a-8625f1b34ede" '
echo '--->> be careful not to miss the UUID= part. '
echo '--->> save the file and quit the text editor'
echo '--->> run "sudo update-grub" '
echo '--->> to test it, run "sudo systemctl hibernate" '


# EOF
