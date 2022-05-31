#!/bin/bash
# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue..."
 echo ""
}
sudo apt clean && sudo apt update && sudo apt upgrade -y

printf '\n\n\n\n \---->>> installing latest conda...\n'
pause
#install latest Conda
wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-Linux-x86_64\.sh\)\">64-Bit (x86) Installer.*@\1@p' | xargs wget

mv Anaconda3*.sh conda3.sh
sudo chmod +x conda3.sh
bash conda3.sh

rm conda3.sh



# EOF
