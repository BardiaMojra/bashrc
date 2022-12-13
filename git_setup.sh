#!/bin/bash
# pause function
function pause(){
 read -s -n 1 -p "Press any key to continue..."
 echo ""
}


# xhost +SI:localuser:root

echo '--->> perform step by step...'
echo '--->> git credentials format: https://user:pass@example.com '
pause
echo ' '
echo '--->> setting up git config...'
echo 'store credentials at  ~/.git-credentials'

git config --global credential.helper store
git config --global user.email "bardia.mojra@gmail.com"
git config --global user.name "bardi"
#git init #Turn an existing directory into a git repository
cp ./.git-credentials ~/.git-credentials
cp ./.gitconfig ~/.gitconfig

# EOF
