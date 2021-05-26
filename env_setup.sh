#!/bin/bash

sudo apt update
sudo apt upgrade -y

# install basics
sudo apt install wget meld git okular texlive-full -y
#Turn an existing directory into a git repository

# install Google Chrome form PPA lib


# install MS teams 
sudo apt install software-properties-common apt-transport-https -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# set MS fonts 
sudo add-apt-repository multiverse
sudo apt update && sudo apt install ttf-mscorefonts-installer -y
sudo fc-cache -f -v
# reinstall if accidently reject the license agreement 
#sudo apt install –reinstall ttf-mscorefonts-installer


echo "# ----->>> ROS setup <<<-----" >> ~/.bashrc
# install ROS http://wiki.ros.org/noetic/Installation/Ubuntu 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt install ros-noetic-desktop-full
#source /opt/ros/noetic/setup.bash # source ROS bash terminal 
# or 
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
#source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-rosdep # setup ROS dep 
sudo rosdep init 
rosdep update
# i.g. install ROS packages 
#sudo apt install ros-noetic-slam-gmapping
# dont forget to add ROS and Gazebo master IP's
echo 'export ROS_HOSTNAME=localhost' >> ~/.bashrc
echo 'export ROS_MASTER_URI=http://localhost:11311' >> ~/.bashrc


# installing solaar 
conda create -n solaar python=3.7
conda activate solaar
conda install -c pdrops pyudev
sudo apt install -y udev python3-pyudev python3-psutil python3-xlib python3-yaml \
                 python3-gi gir1.2-gtk-3.0 python3-dev gir1.2-notify-0.7 \
                 gir1.2-ayatanaappindicator3-0.1 gir1.2-ayatanaappindicator3-0.1 \
                 gir1.2-appindicator3-0.1
cd ~/git && git clone https://github.com/pwr-Solaar/Solaar.git
sudo cp -v ~/git/Solaar/rules.d/42-logitech-unify-permissions.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo apt install solaar 





# EOF


