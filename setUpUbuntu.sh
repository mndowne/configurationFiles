#!/bin/bash

# A script that handles setting up a new machine.
# this uses two git hub repos to load configuration 
# files and script files and install needed packages
# https://github.com/mndowne/bin
# https://github.com/mndowne/configurationFiles

#declare constants
WHITE='\033[1;37m'
NOCOLOR='\033[0m'

#declare variable
createEnvFile="n"
yesOrNo="n"

# only run this script from its location. do not place in bin.

echo -e "${WHITE}"
#check that we are running this script from the correct location
if [[ ! -f ./vimrc || ! -f ./bashrc || ! -f ./tmux.conf ]]; then
    echo -e "Could not find config files next to this script."
    echo -e "exiting"
    echo -e "${NOCOLOR}"
    exit 1
fi



# Create EnvFile ?
##################
if [[ ! -f $HOME/.enviornmentFile ]]; then
    echo -e "Did not find an .enviornmentFile in your home directory."
    echo -e "would you like to make an .enviornmentFile now? (y/n)"
    read createEnvFile
    if [[ $createEnvFile == "y" ]]; then
        touch $HOME/.enviornmentFile
        echo -e "Is this the masterdesktop?"
        read yesOrNo
        if [[ $yesOrNno == "y" ]]; then
            cat "export MASTERDESKTOP=\'true\'" >> $HOME/.enviornmentFile
        else
            cat "export MASTERDESKTOP=\'false\'" >> $HOME/.enviornmentFile
        fi
    else
        echo -e "enviornmentFile was not created"
    fi

else
    echo -e ".enviornmentFile already exists in the home directory."
fi



# Update Configs ?
##################
echo -e "Would you like to update and source .bashrc, .vimrc, .tmux.conf? (y/n)"
read yesOrNno
if [[ $yesOrNno == "y" ]]; then
    mkdir -p $HOME/oldConfigs/

    if [[ -f $HOME/.bashrc ]]; then
        echo -e "Backed up old .bashrc to oldConfigs/bashrc"
        mv $HOME/.bashrc $HOME/oldConfigs/bashrc
    fi
    cp ./bashrc $HOME/.bashrc
    if [[ -f $HOME/.tmux.conf ]]; then
        echo -e "Backed up old .tmux.conf to oldConfigs/tmux.conf"
        mv $HOME/.tmux.conf $HOME/oldConfigs/tmux.conf
    fi
    cp ./tmux.conf $HOME/.tmux.conf
    if [[ -f $HOME/.vimrc ]]; then
        echo -e "Backed up old .vimrc to oldConfigs/vimrc"
        mv $HOME/.vimrc $HOME/oldConfigs/vimrc
    fi
    cp ./vimrc $HOME/.vimrc
else
    echo -e "Did not update bashrc, vimrc, and tmux.conf"
fi


# Clone Scripts ?
#################
#
#
#
#
#
#
#
#
#
##################






# VIM Plug-Ins  ?
#################
#
#
#
#
#
#
#
#
#
##################





#Install packages?
##################
echo -e "would you like to apt-get install packages? (y/n)"
echo -e "or enter (list) for a list of packages"
read yesOrNno
if [[ $yesOrNno == "list" ]]; then
    echo -e "list of packages"
    echo -e "list of packages"
    echo -e "list of packages"


    echo -e "would you like to apt-get install packages? (y/n)"
    read yesOrNno
fi
if [[ $yesOrNno == "y" ]]; then
    sudo apt install fzf
    sudo apt install ripgrep
    sudo apt install universal-ctags
    sudo apt install highlight
    sudo apt install tmux
    sudo apt install fonts-powerline
    echo -e "finished installing packages"
fi



#Update Apperance?
##################
echo -e "Would you like to run appearance commands? (y/n)"
read yesOrNno
if [[ $yesOrNno == "y" ]]; then
    
    sudo apt install gnome-tweaks

    sudo apt install gnome-shell-extension

    apt install x11-utils -v

    gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.7

    gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

    gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

    echo -e "finished appearence commands, be sure to add gnome extensions listed in README.md"
fi

echo -e "${NOCOLOR}"
echo "finished with script"

