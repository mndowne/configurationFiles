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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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


####################################################
### Martin Downes added the code below this line ###
####################################################

#This line of code remaps the escape to the CapsLock key
setxkbmap -option caps:swapescape

#This changes my BASH prompt
#PS1="\[\033[1;31m\]\$ \[\033[0m\]\[\033[1;35m\]\W \[\033[0m\]\[\033[1;31m\]>>\[\033[0m\]"
#PS1="\[\033[48;5;222m\033[38;5;1m\]\$\[\033[0m\]\[\033[48;5;238m\033[38;5;222m\]\W\[\033[0m\]\[\033[48;5;1m\033[38;5;238m\]\[\033[0m\]\[\033[38;5;1m\] \[\033[0m\]"
PS1="\[\033[48;5;200m\033[38;5;1m\]\$\[\033[0m\]\[\033[48;5;238m\033[38;5;200m\]\W\[\033[0m\]\[\033[48;5;1m\033[38;5;238m\]\[\033[0m\]\[\033[38;5;1m\] \[\033[0m\]"

#Makes the termanil behave like Vim (vi) 
set -o vi

#This line lets you cd into a folder if without writing full path.
shopt -s autocd

################################
##  FUNCTIONS  ##  FUNCTIONS  ##
################################


change_to_codeProject_dir () {            
    cd ~/Documents/codeProjects/"$1"     
    return 0
}

# sets the auto complete up for change_to_codeProject_dir function
complete -W "$(ls ~/Documents/codeProjects/)" cdl

###############################
###   ALIAS   ###   ALIAS   ###
###############################

alias cdl='change_to_codeProject_dir'

alias bin='cd ~/bin/'
alias jstut='cd ~/Documents/codeProjects/NetNinjaNodeProject/otherProjects/jstut/'

alias bashrc='vim ~/.bashrc'
alias sbrc='source ~/.bashrc && echo -e "--> \033[0;31msource .bashrc\033[0m \n \n.bashrc has been sourced \n "'
alias vimrc='vim ~/.vimrc'
alias tmux.conf='vim ~/.tmux.conf'
alias stm='tmux source-file ~/.tmux.conf && echo -e "--> \033[0;31msource-file .tmux.conf\033[0m \n \n.tmux.conf has been sourced \n "'

alias youtube="youtube-dl --add-metadata -ic"

# specific to a script in ~/bin
alias tm='tmuxboot'



###############################
##   ENVIORNMENT VARIABLES   ##
###############################
if [[ -f $HOME/.enviornmentFile ]]; then
    source $HOME/.enviornmentFile
else
    echo "No .enviornmentFile found please creat one and set important variables"
    echo "check https://github.com/mndowne/configurationFiles for more details"
fi


################################
##   SCRIPTS   ##   SCRIPTS   ##
################################
backUpDotFiles


