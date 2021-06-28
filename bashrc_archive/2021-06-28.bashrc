# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi


if [ "$color_prompt" = yes ]; then
    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ '
    export -n PS1 # unexport PS1 so sub-processes will not inherit it
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/smerx/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/smerx/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/smerx/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/smerx/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

# installing solaar 
# sudo apt install udev python3-pyudev python3-psutil python3-xlib python3-yaml \ 
# python3-gi gir1.2-gtk-3.0 python3-dev gir1.2-notify-0.7 \
# gir1.2-ayatanaappindicator3-0.1 gir1.2-ayatanaappindicator3-0.1 \
# gir1.2-appindicator3-0.1
# then do: 
# You can install this rule by copying, as root, rules.d/42-logitech-unify-permissions.rules from Solaar to /etc/udev/rules.d. You will probably also have to tell udev to reload its rule via sudo udevadm control --reload-rules.

# custom commands and aliases 
alias hibernate="sudo systemctl hibernate"
alias reboot="sudo systemctl reboot"
alias mybash="gedit ~/.bashrc &" 
alias wifireset="sudo service network-manager restart"
alias ls="ls -AC1 --color=always"
alias lsd='la -al1 --color=always'
alias open='xdg-open '
alias clr='clear'
alias sb='source ~/.bashrc'
alias web='google-chrome &'
alias webnew='google-chrome --new-window &'
alias qcad='/home/bardi/opt/qcadcam-3.26.2-trial-linux-x86_64/qcad &'
alias gflint='cp ~/git/cheatsheets/scripts/fname_lint.py .' # get fname_lint.py
alias gget='cp ~/git/cheatsheets/scripts/get.py .' # get get.py
alias gconda_envtemp='cp ~/git/cheatsheets/conda_env_temp.yml .' # get conda_env_temp.yml
alias uflint='cp ./fname_lint.py ~/git/cheatsheets/scripts/'
alias cheat='cd ~/git/cheatsheets && ls'
alias condafromfile='conda env create -f environment.yml'
alias logbash='cp ~/.bashrc ~/git/bashrc/.bashrc && cp ~/.bashrc ~/git/bashrc/bashrc_archive/$(date +%F).bashrc && cd ~/git/bashrc/ && git status'
alias loghistory='history > ~/git/bashrc/.history && cp  ~/git/bashrc/.history  ~/git/bashrc/history_archive/$(date +%F).history'
alias showip='ip address show'
# cupsfilter foo.txt > foo.pdf # convert to pdf 
# ROS aliases 
#alias sourceNoetic='source /opt/ros/noetic/setup.bash'
alias cleanWS='rm -rf build devel install'

# setup hibernate on Ubuntu
#https://blog.ivansmirnov.name/how-to-set-up-hibernate-on-ubuntu-20-04/

# --------------- permissions ---------------
# Basic syntax:
#find /path/to/directory -type d -exec chmod 775 {} \; # for directories - d flag
#find /path/to/directory -type f -exec chmod 775 {} \; # for files - f flag
# This changes the permissions on the "directory" directory and all 
# subdirectories within it. 
# Note, this is usually better than "chmod -R 775 /path/to/directory"
# 	which changes the permissions on the subdirectories and *all files*
# Note, here's how permissions work. You specify three decimal digits
#	which specify the read, write, and execute permissions for yourself,
#	the group, and others respectively. The way this works is that each
#	decimal you specify is converted to a three digit binary equivalent
#	where 1 = true (permission granted) and 0 = false. The 
# permission bit field flags
#Decimal		Binary		Permission		Permission meaning
#7			111			rwx				read, write, and execute
#6			110			rw-				read and write
#5			101			r-x				read and execute
#4			100			r--				read only
#3			011			-wx				write and execute
#2			010			-w-				write only
#1			001			--x				execute only
#0			000			---				none




# for Ccache installation
export PATH="/usr/lib/ccache:$PATH"

# --------------- cmake ---------------
export CMAKE_INCLUDE_PATH=/usr/local/include
export CMAKE_LIBRARY_PATH=/usr/local/lib

## --------------- Cuda --------------- 
### Cuda aliases 
alias cudaPD="sudo /usr/bin/nvidia-persistenced --verbose"
alias nvidDriver="cat /proc/driver/nvidia/version"
alias cudaAltDis="update-alternatives --display cuda"
alias cudaAltDisMajor="update-alternatives --display cuda-10"
alias cudaAltUpdate="sudo update-alternate --config cuda"
# Cuda 10.2
export CUDA_HOME=/usr/local/cuda-10.2
# Cuda general 
export PATH=$CUDA_HOME/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=$CUDA_HOME/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}                         

## ----->>> ROS setup <<<-----
#source /opt/ros/melodic/setup.bash
#source /opt/ros/noetic/setup.bash
#export ROS_HOSTNAME=192.168.1.140 # RVL
export ROS_HOSTNAME=192.168.1.14 # home 
#export ROS_HOSTNAME=10.182.162.104 # UTARI
export ROS_MASTER_URI=http://${ROS_HOSTNAME}:11311

#source /home/smerx/Next-Best-View-Grasping/catkin_ws/devel_isolated/setup.bash
#source /home/smerx/Next-Best-View-Grasping/catkin_ws/devel/setup.bash

## --------------- git ---------------
### ----->>> gToken <<<-----
export gtoken_u='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' #QVPose_t01 = uta
export gtoken_p='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' #Cyber-01 - personal

### ----->>> git cheat sheet <<<-----
#git config --global user.email 'bardia.mojra@gmail.com'
#git config --global user.name 'bardi'
#git config --global user.signingkey ${gtoken}
#git config --global --unset user.signingkey # use --unset to erase 
#git config --get remote.origin.url # get current login username URL

#git config --global credential.username 'BardiaMojra' # ----->> personal
#git config --global credential.email 'bardia.mojra@gmail.com'

#git config --global credential.username 'uta-bardia' # ----->> UTARI
#git config --global credential.username 'bardia.mojra@uta.edu'




### create a new repository on the command line
#echo "# catkin_sandbox" >> README.md
#git init
#git add README.md
#git commit -m "first commit"
#git branch -M main
#git remote add origin https://github.com/BardiaMojra/catkin_sandbox.git
#git push -u origin main
# or push an existing repository from the command line
#git remote add origin https://github.com/BardiaMojra/catkin_sandbox.git
#git branch -M main
#git push -u origin main


#experimental  ---> needs $(parse_git_branch)
#export PS1="\[${BOLD}${MAGENTA}\]\u\[$WHITE\]@\[$ORANGE\]\h\[$WHITE\]: [\[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" - \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]] \$ \[$RESET\]"



# EOF
