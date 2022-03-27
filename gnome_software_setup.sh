#!/bin/bash


printf '\n\n\n --->> setting up gnome software center (app store)... \n'
sudo apt clean && sudo apt update && sudo apt upgrade -y
sudo apt autoremove gnome-software && sudo apt install gnome-software
