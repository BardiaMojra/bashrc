#!/usr/bin/env bash
function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

sudo apt clean && sudo apt update && apt upgrade -y



echo ' ' && echo ' '
echo ' \---->>> installing docker...'
echo 'for more details see: https://docs.docker.com/engine/install/ubuntu/'
echo ' ' && echo ' '

# allow apt to use a repo over HTTPS
sudo -u root -H -s apt-get install ca-certificates curl gnupg lsb-release -y

# add GPG key
sudo -u root -H -s mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo -u root -H -s gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# setup repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo -u root -H -s tee /etc/apt/sources.list.d/docker.list > /dev/null

# sudo apt-get update
sudo -u root -H -s  chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update

# install latest docker engine
sudo -u root -H -s  apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


echo ' ' && echo ' '
echo '--->> docker installed.'
echo ' ' && echo ' '

echo ' ' && echo ' '
read -p '--->> test docker? (yes/no)' yn
echo ' ' && echo ' '
case $yn in
	yes ) sudo -u root -H -s  docker run hello-world;;
	no ) echo "--->> docker Hello World not tested...";
		exit;;
	* ) echo invalid response;
		exit 1;;
esac




echo ' ' && echo ' '
echo '--->> for more details on Docker group permissions, see https://docs.docker.com/engine/install/linux-postinstall/'
read -p '--->> setup Docker group permissions (postinstall)? (yes/no)' yn
echo ' ' && echo ' '
case $yn in
	yes ) sudo -u root -H -s  docker_postinstall_setup.sh;;
	no ) echo "--->> post-installation not setup...";
		exit;;
	* ) echo invalid response;
		exit 1;;
esac

echo doing stuff...
# test
sudo -u root -H -s  docker run hello-world


echo ' ' && echo ' '
echo '--->> setup finished'
echo ' ' && echo ' ' && echo ' ' && echo ' '


# EOF
