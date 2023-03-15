#!/usr/bin/env bash
function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

# sudo apt clean && sudo apt update && apt upgrade -y

echo ' ' && echo ' '
echo ' \---->>> installing docker post-install (group permissions)...'
echo 'for more details see: https://docs.docker.com/engine/install/linux-postinstall/'
echo ' ' && echo ' '

# Create the docker group.
sudo -u root -H -s groupadd docker

# Add your user to the docker group.
# sudo usermod -aG docker $USER
sudo -u root -H -s usermod -aG docker smerx



echo ' ' && echo ' '
echo ' \---->>> Log out and log back in so that your group membership is re-evaluated...'
echo ' ' && echo ' '

# You can also run the following command to activate the changes to groups:
newgrp docker

# Verify that you can run docker commands without sudo.
docker run hello-world


echo "This command downloads a test image and runs it in a container. When the container runs, it prints a message and exits."
echo "If you initially ran Docker CLI commands using sudo before adding your user to the docker group, you may see the following error:"
echo " "
echo "    WARNING: Error loading config file: /home/user/.docker/config.json -"
echo "    stat /home/user/.docker/config.json: permission denied"
echo " "
echo " This error indicates that the permission settings for the ~/.docker/ directory are incorrect, due to having used the sudo command earlier."
echo " To fix this problem, either remove the ~/.docker/ directory (it's recreated automatically, but any custom settings are lost), or change its ownership and permissions using the following commands:"
echo '    sudo chown "$USER":"$USER" /home/"$USER"/docker -R'
echo '    sudo chmod g+rwx "$HOME/docker" -R'


echo ' ' && echo ' '
echo '--->> setup finished'
echo ' ' && echo ' ' && echo ' ' && echo ' '


# EOF
