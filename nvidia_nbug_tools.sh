

#!/bin/bash

function pause(){
 read -s -n 1 -p "press any key to continue..."
 echo ""
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt clean && sudo apt update && sudo apt upgrade -y

cat nvidia_driver_setup.sh

echo '--->> nvidia nbug tools:'
echo '  \--->> gpu_manager_prt'
