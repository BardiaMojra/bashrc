#!/bin/bash

echo '\n\n --> installing Google Chrome'
wget -O google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' 
sudo dpkg -i google-chrome.deb
rm google-chrome.deb
