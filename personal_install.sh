#!/bin/bash

function print_and_run {
	echo "$ "$1
	$1
}
Off="\033[0m"
Info="\033[1;34m"
Action="\033[0;31m"

# name of computer
echo -e $Info"Setting name of the computer"$Off
print_and_run 'sudo scutil --set HostName sancho'
#echo "Edit your /etc/hosts file to add sancho to the localhost line"
#read -p "Press [ENTER] once it's done..."

# setting git up
echo -e $Info"Setting git up with your name and mail"$Off
print_and_run 'git config --global user.name "Francis Colas"'
print_and_run 'git config --global user.email francis.colas@inria.fr'
print_and_run 'git config --global push.default simple'

# install owncloud
echo -e $Info"Installing owncloud"$Off
print_and_run 'brew cask install owncloud'
echo -e $Action"Configure owncloud client"$Off
read -p "Press [ENTER] once it's done..."

# install keepassX
echo -e $Info"Installing KeePassX"$Off
print_and_run 'brew cask install keepassx'
echo -e $Action"Open database in owncloud"$Off
read -p "Press [ENTER] once it's done..."

# install AdBlockPlus
echo -e $Action"Install AdBlockPlus for Safari (Safari->Safari Extensions)"$Off
read -p "Press [ENTER] once it's done..."

# install Firefox
echo -e $Info"Installing Firefox"$Off
print_and_run 'brew cask install firefox'
echo -e $Action"Install AdBlockPlus for Firefox (Firefox->Tools->Addons)"$Off

# add colours to ls
echo -e $Info"Adding colour to ls output"$Off
print_and_run 'echo "# adding colours to ls" >> ~/.profile'
print_and_run 'echo "export CLICOLOR=1" >> ~/.profile'

# update to bash 4.x
echo -e $Info"Installing later bash"$Off
print_and_run 'brew install bash'
echo -e $Action"Add /usr/local/bin/bash to /etc/shells"$Off
read -p "Press [ENTER] once it's done..."
print_and_run "chsh -s /usr/local/bin/bash"

# install prompt
echo -e $Info"Setting up prompt"$Off
print_and_run 'cp bash_prompt ~/.bash_prompt'
print_and_run 'echo "# custom prompt" >> ~/.profile'
print_and_run 'echo "source ~/.bash_prompt" >> ~/.profile'

# install aliases
echo -e $Info"Setting up aliases"$Off
print_and_run 'cp bash_alias ~/.bash_alias'
print_and_run 'echo "# custom aliases" >> ~/.profile'
print_and_run 'echo "source ~/.bash_alias" >> ~/.profile'

# set terminal up
echo -e $Action"Change default terminal to pro"$Off
echo -e $Action"Set shell exiting behavior to 'Close if the shell exited cleanly'"$Off
echo -e $Action'Add home and end keys in keyboard as sending respectively \\033OH and \\033OF'$Off
read -p "Press [ENTER] once it's done..."

# python3
echo -e $Info"Installing python3"$Off
print_and_run 'brew install python3'
print_and_run 'pip3 install ipython'
print_and_run 'echo "# ipython3" >> ~/.profile'
print_and_run 'echo "alias ipython3='\''python3 /usr/local/lib/python3.4/site-packages/IPython/terminal/ipapp.py'\''" >> ~/.profile'

# vim configuration
echo -e $Info"Configuring Vim"$Off
print_and_run 'git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
print_and_run 'cp vimrc ~/.vimrc'
print_and_run 'vim +PluginInstall +qall'

# open terminal with shortcut
echo -e $Info"Adding shortcut to open new terminal window"$Off
echo -e $Action"Open Automator.app and create a new service"$Off
echo -e $Action"Set service to receive no input, add action to Run Applescript with:"$Off
echo 'on run {input, parameters}
	
	(* Your script goes here *)
	tell application "Terminal"
		activate
		do script ""
	end tell
	
end run'
echo -e $Action"Save service"$Off
echo -e $Action"Add shortcut in System Preferences/Keyboard/Shortcuts/Services/General"$Off
