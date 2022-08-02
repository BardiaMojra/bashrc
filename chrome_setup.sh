
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
printf '--->> installing Google Chrome...'
pause
wget -O google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
sudo dpkg -i google-chrome.deb
rm google-chrome.deb
