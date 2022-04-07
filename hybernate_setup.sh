#!/bin/bash
# @link https://askubuntu.com/questions/1240123/how-to-enable-the-hibernate-option-in-ubuntu-20-04

sudo apt clean && sudo apt update && sudo apt upgrade -y
printf '\n\n\n --->> assuming SWAP partition available.'
printf '\n\n\n --->> install pm-utils and hibernate ... \n'
sudo apt install pm-utils hibernate
cat /sys/power/state
printf '--->> confirm you see--> freeze mem disk \n'
printf '--->> run "grep swap /etc/fstab" \n'
printf '--->> copy the UUID\n'
# swap was on /dev/nvme0n1p2 during installation
printf 'UUID=0736da4f-f262-4c37-b92a-8625f1b34ede'

printf '--->> run "sudo gedit /etc/default/grub" \n'
printf '--->> change the line that says \n'
printf 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash" \n'
printf '--->> so that it instead says \n'
printf 'GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=0736da4f-f262-4c37-b92a-8625f1b34ede" \n'
printf '--->> be careful not to miss the UUID= part. \n'
printf '--->> save the file and quit the text editor'
printf '--->> run "sudo update-grub" \n'
printf '--->> to test it, run "sudo systemctl hibernate" \n'


# EOF
