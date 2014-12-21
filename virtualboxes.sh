#!/bin/bash

function print_and_run {
	echo "$ "$1
	$1
}
Off="\033[0m"
Info="\033[1;34m"
Action="\033[0;31m"

# virtualbox application
echo -e $Info"Installing virtualbox"$Off
print_and_run 'brew cask install virtualbox'
echo -e $Action"Launch VirtualBox and create a new network interface (VirtualBox->Preferences->Network->Host-only"$Off

# creating virtual machine with ubuntu
echo -e $Action"Download ubuntu image (14.04.1 server amd64)."$Off
echo -e $Action"Create new virtual machine, add the second network interface as host-only"$Off
echo -e $Action"Run new virtual machine to install ubuntu with OpenSSH."$Off
