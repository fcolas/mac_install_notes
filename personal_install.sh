#!/bin/bash

function print_and_run {
	echo $1
	#$1
}

# install owncloud
echo "Install owncloud from http://owncloud.com"
echo "Copnfigure owncloud client"
read -p "Press [ENTER] once it's done..."

# install keepassX
echo "Install KeePassX 2.0 from www.keepassx.org"
echo "Open database in owncloud"
read -p "Press [ENTER] once it's done..."

# install AdBlockPlus
echo "Install AdBlockPlus for Safari (Safari->Safari Extensions)"
read -p "Press [ENTER] once it's done..."

# add colours to ls
echo "Adding colour to ls output"
print_and_run 'echo "# adding colours to ls" >> ~/.profile'
print_and_run 'echo "export CLICOLOR=1" >> ~/.profile'

