#!/bin/bash


### local routines
function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "--->> press any key to continue..."
  echo ' ' && echo ' '
}

function checkID(){
  if [ "$EUID" -ne 0 ]
    echo ' ' && echo ' '
    then echo "--->> please run as root..."
    echo ' ' && echo ' '
    exit
  fi
}



#checkID
#sudo apt clean && sudo apt update && apt upgrade -y

# xhost +SI:localuser:root
echo ' ' && echo ' ' && echo '--->> commit all git repos... ' && echo ' '
pause
for i in $(ls -d */)
do
  echo ${i%%/}
done
echo ' ' && echo ' '

for i in $(ls -d */)
do
  echo ${i%%/}
  cd ${i%%/} && $gitexpress && cd $(pwd)/..
  echo $(pwd)
  #echo
done

# EOF
