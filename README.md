
-------------------------------------------------------------------------
-----    Description    ---    Description    ---   Description   -------
-------------------------------------------------------------------------

This is my collections of config files (dotfiles) for VIM, BASH, and TMUX

This replaces my previous repository titled vimrc 

This contains
    .vimrc
    .bashrc
    .tmux.conf
    vim plugin library
    tmux script
    ~/bin files
    Instructions on how to set these up
    A script to make setting up my enviornment easy peazy

This folder will be set up so that when i reboot my computer we check to 
see if .vimrc, .bashrc, .tmux.conf, ~/.vim/bundle, and ~/bin have changed.
If they have changed a terminal should open in this directory asking for a 
git add, git commit, and git push commands. This is to ensure that github
has the most up-to-date dotfiles. 


-------------------------------------------------------------------------
-----    Description    ---    Description    ---   Description   -------
-------------------------------------------------------------------------


-------------------------------------------------------------------------
----    Instructions    ---    Instructions    ---   Instructions   -----
-------------------------------------------------------------------------


need to add ~/bin (or where ever you are saving your BASH scripts) to
your $PATH variable. can use export 

                      export PATH=~/bin:"$PATH"

Run the setupConfigurationFiles.sh script

Need to also get some gnome extensions.

Hide Top Bar - 
https://extensions.gnome.org/extension/545/hide-top-bar/

Sound Input & Output Device Choooser - 
https://extensions.gnome.org/extension/906/sound-output-device-chooser/

Transparent Top Bar - 
https://extensions.gnome.org/extension/3960/transparent-top-bar-adjustable-transparency/

may need to go into settings and gnome tweaks to change your settings 
how you like. Also making a custom keyboard short cut in settings to open
the gnome-terminal --full-screen with CTRL ALT T might be desired.

May need to change the terminal font to DejaVu Sans Mono Book, size 11

-------------------------------------------------------------------------
----    Instructions    ---    Instructions    ---   Instructions   -----
-------------------------------------------------------------------------
