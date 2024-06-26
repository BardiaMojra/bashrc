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
__conda_setup="$('/home/smerx/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/smerx/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/smerx/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/smerx/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# -------------------------------------------------------------->> 
#alias hibernate="sudo systemctl hibernate"
#alias reboot="sudo systemctl reboot"
alias shellup="sudo -u root -H -s bash " # shellup env_setup.sh
alias mybash="gedit ~/.bashrc &"
alias catbash="cat ~/.bashrc "
alias wifireset="sudo service network-manager restart"
alias ls="ls -AC1p --color=always"
alias lsd='ls -Ahl1p --color=always'
alias open='xdg-open '
alias clr='clear'
alias sb='source ~/.bashrc'
alias web='google-chrome &'
alias webnew='google-chrome --new-window &'
alias qcad='/home/bardi/opt/qcadcam-3.26.2-trial-linux-x86_64/qcad &'

# ----------------------------------------------------------------->> get_script
alias getfnprtr='cp ~/git/cheatsheets/scripts/prt_fname.py .' # get prt_fname.py
alias getfnlint='cp ~/git/cheatsheets/scripts/fname_lint.py .' # get fname_lint.py
alias getfnlint_ext='cp ~/git/cheatsheets/scripts/fname_lint_ext.py .' # get fname_lint_ext.py
alias getget='cp ~/git/cheatsheets/scripts/get.py .' # get get.py

alias uflint='cp ./fname_lint.py ~/git/cheatsheets/scripts/' # update fname_lint.py
alias cheat='cd ~/git/cheatsheets && ls'
alias gbash='cd ~/git/bashrc && ls'
alias condafromfile='conda env create -f '
alias getcondafromfile='cp ~/git/cheatsheets/conda_env_temp.yml .' # get conda_env_temp.yml

# ----------------------------------------------------------------->> grep search
# grep nvidia /etc/modprobe.d/* /lib/modprobe.d/*

# cupsfilter foo.txt > foo.pdf # convert to pdf

#  ----------------------------------------------------------------->> log + load bash
alias loadbash='cp ~/git/bashrc/.bashrc  ~/.bashrc'
alias logbash='cp ~/.bashrc ~/git/bashrc/.bashrc &&\
cp ~/.bashrc ~/git/bashrc/bashrc_archive/$(date +%F).bashrc &&\
cd ~/git/bashrc/ && git status'
alias loghistory='history > ~/git/bashrc/.history &&\
cp  ~/git/bashrc/.history  ~/git/bashrc/history_archive/$(date +%F).history &&\
git status'
alias loggitconfig='cd ~/git/bashrc && cp ~/.gitconfig . && cp ~/.git-credentials . &&\
cp ./.gitconfig ~/git/bashrc/git_archive/$(date +%F).gitconfig &&\
cp ./.git-credentials ~/git/bashrc/git_archive/$(date +%F).git-credentials &&\
git status'
alias showip='ip address show'

alias cleanWS='rm -rf build devel install'
alias soundon='pacmd set-card-profile device_name a2dp_sink'
alias showCards='pacmd list-cards'
alias hybnow='sudo systemctl hibernate' # @link https://askubuntu.com/questions/1240123/how-to-enable-the-hibernate-option-in-ubuntu-20-04

alias EFI_theme='sudo gedit /boot/efi/EFI/refind/themes/darkmini/theme.conf'
alias EFI_config='sudo gedit /boot/efi/EFI/refind/refind.conf'

# ----------------------------------------------------------------->> nvidia gpu
alias gpu_manager_prt="cat /var/log/gpu-manager-switch.log"

# ------------------------------------------------------------------------>> git
alias gitexpress="git add -A && git commit -m 'Updated with gitexpress on $(date +%F).' && git push"
alias ugitexpress="git add -A && git commit -m 'Updated with ugitexpress on $(date +%F).' &&\
  branch_name=$(git symbolic-ref -q HEAD) && branch_name=${branch_name##refs/heads/} &&\
  git push origin ${branch_name:-HEAD} "
alias gitclean_dry-run='git clean -fXn  .'
alias gitclean='git clean -fX  .'
alias gitlog='git log --oneline --graph' # show git log compact
alias gitreset='git reset --mixed HEAD~1'  # undo the last commit and keep changes then git pull, git add [staged file], gitexpress

# git log --oneline --graph     # really cool <<<----------
# git reset --mixed HEAD~1  # undo the last commit and keep changes

#git config --global credential.helper store
#git config --global user.email 'bardia.mojra@gmail.com'
#git config --global user.name 'bardi'
#git config --global user.signingkey ${gtoken}
#git config --global --unset user.signingkey # use --unset to erase
#git config --get remote.origin.url # get current login username URL
#git config --global credential.username 'BardiaMojra' # ----->> personal
#git config --global credential.email 'bardia.mojra@gmail.com'
#git config --global credential.username 'uta-bardia' # ----->> UTARI
#git config --global credential.username 'bardia.mojra@uta.edu'

# --------------------------------------------------------------->> git difftool
#git difftool <COMMIT_HASH> file_name
#git difftool <BRANCH_NAME> file_name
#git difftool <COMMIT_HASH_1> <COMMIT_HASH_2> file_name

# ---------------------------------------------------------------->> create repo
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


# ------------------------------------------------------------->> get .gitignore
# /git/cheatsheets/gitignores/
alias gigc='cp ~/git/cheatsheets/gitignores/C.gitignore ./c.gitignore'
#alias gigcpp
alias gigros='cp ~/git/cheatsheets/gitignores/ROS.gitignore ./ros.gitignore'
alias gigpy='cp ~/git/cheatsheets/gitignores/Python.gitignore ./py.gitignore'
#alias gigcmake
#alias giglabview
#alias gigobjc
alias gigunity='cp ~/git/cheatsheets/gitignores/Unity.gitignore ./unity.gitignore'
alias gigtex='cp ~/git/cheatsheets/gitignores/TeX.gitignore ./tex.gitignore'
#alias gigue
#alias gigvs
# /git/cheatsheets/gitignores/global/
#alias gigdiff
#alias giglinux
alias gigmatlab='cp ~/git/cheatsheets/gitignores/global/MATLAB.gitignore ./matlab.gitignore'
alias gigvscode='cp ~/git/cheatsheets/gitignores/global/VisualStudioCode.gitignore ./vscode.gitignore'
#alias gigvenv
#alias gig

# -------------------------------------------------------------->> get proj temp
# /git/cheatsheets/***_proj/
alias gigpyproj='cp -r ~/git/cheatsheets/py_proj/* .'
alias gigmatlabproj='cp -r ~/git/cheatsheets/matlab_proj/* .'
alias gigtexproj='cp -r ~/git/cheatsheets/tex_proj/* .'
#alias gigrosproj

# ---------------------------------------------------------->> matlab vers.
alias matlab21a="/usr/local/MATLAB/R2021a/bin/matlab . &"
alias matlab22a="/usr/local/MATLAB/R2022a/bin/matlab . &"
#alias matlab21a="/usr/local/MATLAB/R2021a/bin/matlab . &"


# --------------- stdout and stderr ---------------
#  python qekf.py > ../out/out.txt 2> ../out/err.log

# ---------------------------------------------------------------->> permissions
# Basic syntax:
# sudo chown -R smerx:smerx opencv-3.4.9/
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
#export PATH="/usr/lib/ccache:$PATH"

# --------------- cmake ---------------
#export CMAKE_INCLUDE_PATH=/usr/local/include
#export CMAKE_LIBRARY_PATH=/usr/local/lib

## --------------- Cuda ---------------
### Cuda aliases
#alias cudaPD="sudo /usr/bin/nvidia-persistenced --verbose"
#alias nvidDriver="cat /proc/driver/nvidia/version"
#alias cudaAltDis="update-alternatives --display cuda"
#alias cudaAltDisMajor="update-alternatives --display cuda-10"
#alias cudaAltUpdate="sudo update-alternate --config cuda"
# Cuda 10.2
#export CUDA_HOME=/usr/local/cuda-10.2
# Cuda general
#export PATH=$CUDA_HOME/bin${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=$CUDA_HOME/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

## ----->>> ROS setup <<<-----
# ROS aliases
#alias sourceNoetic='source /opt/ros/noetic/setup.bash'
#source /opt/ros/melodic/setup.bash
#source /opt/ros/noetic/setup.bash
#export ROS_HOSTNAME=192.168.1.140 # RVL
#export ROS_HOSTNAME=192.168.1.14 # home
#export ROS_HOSTNAME=10.182.162.104 # UTARI
#export ROS_MASTER_URI=http://${ROS_HOSTNAME}:11311

#source /home/smerx/Next-Best-View-Grasping/catkin_ws/devel_isolated/setup.bash
#source /home/smerx/Next-Best-View-Grasping/catkin_ws/devel/setup.bash

## --------------- git ---------------
### ----->>> gToken <<<-----
export gtoken_u='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' #QVPose_t01 = uta
export gtoken_p='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' #Cyber-01 - personal

### ----->>> git cheat sheet <<<------------------------------------ git cheat
#branch_name=$(git symbolic-ref -q HEAD) branch_name=${branch_name##refs/heads/}
#branch_name=$(git symbolic-ref -q HEAD)
#branch_name=${branch_name##refs/heads/}
#branch_name=${branch_name:-HEAD}


#experimental  ---> needs $(parse_git_branch)
#export PS1="\[${BOLD}${MAGENTA}\]\u\[$WHITE\]@\[$ORANGE\]\h\[$WHITE\]: [\[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" - \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]] \$ \[$RESET\]"


## --------->> OpenGV
#export LD_LIBRARY_PATH=/home/smerx/git/opengv/build/lib:$LD_LIBRARY_PATH

## --------->> C#
#export DOTNET_ROOT=/snap/dotnet-sdk/current






# EOF
