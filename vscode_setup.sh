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
echo '--->> install vscode..'
echo ' ' && echo ' '


# install VS Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# EOF
