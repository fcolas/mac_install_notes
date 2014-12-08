#!/bin/bash

function print_and_run {
	echo $1
	#$1
}

# name of computer
echo "Setting name of the computer"
print_and_run 'sudo scutil --set HostName sancho'
#echo "Edit your /etc/hosts file to add sancho to the localhost line"
#read -p "Press [ENTER] once it's done..."

# setting git up
echo "Setting git up with your name and mail"
print_and_run 'git config --global user.name "Francis Colas"'
print_and_run 'git config --global user.email francis.colas@inria.fr'
print_and_run 'git config --global push.default simple'

# install owncloud
echo "Installing owncloud"
print_and_run 'brew cask install owncloud'
echo "Configure owncloud client"
read -p "Press [ENTER] once it's done..."

# install keepassX
echo "Installing KeePassX"
print_and_run 'brew cask install keepassx'
echo "Open database in owncloud"
read -p "Press [ENTER] once it's done..."

# install AdBlockPlus
echo "Install AdBlockPlus for Safari (Safari->Safari Extensions)"
read -p "Press [ENTER] once it's done..."

# add colours to ls
echo "Adding colour to ls output"
print_and_run 'echo "# adding colours to ls" >> ~/.profile'
print_and_run 'echo "export CLICOLOR=1" >> ~/.profile'

# update to bash 4.x
echo "Installing later bash"
print_and_run 'brew install bash'
echo "Add /usr/local/bin/bash to /etc/shells"
read -p "Press [ENTER] once it's done..."
print_and_run "chsh -s /usr/local/bin/bash"

# install prompt
echo "Setting up prompt"
print_and_run 'cp bash_prompt ~/.bash_prompt'
print_and_run 'echo "# custom prompt" >> ~/.profile'
print_and_run 'echo "source ~/.bash_prompt" >> ~/.profile'

# install aliases
echo "Setting up aliases"
print_and_run 'cp bash_alias ~/.bash_alias'
print_and_run 'echo "# custom aliases" >> ~/.profile'
print_and_run 'echo "source ~/.bash_alias" >> ~/.profile'

# set terminal up
echo "Change default terminal to pro"
echo "Set shell exiting behavior to 'Close if the shell exited cleanly'"
echo "Add home and end keys in keyboard as sending respectively \\033OH and \\033OF"
read -p "Press [ENTER] once it's done..."
