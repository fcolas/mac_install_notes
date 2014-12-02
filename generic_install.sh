#!/bin/bash

function print_and_run {
	echo $1
	#$1
}

# first, you need to install Xcode
echo "You need to install Xcode through the app store before anything else."
read -p "Press [ENTER] once it's done..."

# you need to run Xcode once to accept the license
echo "Launch Xcode in order to sign the license agreement."
read -p "Press [ENTER] once it's done..."

# installing brew (package manager)
echo "Installing the Homebrew package manager (brew):"
print_and_run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
# run brew doctor once as requested by the installation
print_and_run 'brew doctor'
# shell completion
print_and_run 'echo "# brew shell completion" >> ~/.profile'
print_and_run 'echo "source `brew --repository`/Library/Contributions/brew_bash_completion.sh" >> ~/.profile'

# install vim and macvim
echo "Install vim and macvim"
print_and_run 'brew install vim macvim'
# set vim as default editor
print_and_run 'echo "# default command line editor" >> ~/.profile'
print_and_run 'echo "export EDITOR=/usr/local/bin/vim" >> ~/.profile'

# install git (with gitk and stuff)
echo "Installing newer git"
print_and_run 'brew install git'

# setting git up
echo "Setting git up with your name and mail"
print_and_run 'git config --global user.name "Francis Colas"'
print_and_run 'git config --global user.email francis.colas@inria.fr'
print_and_run 'git config --global push.default simple'

# completing bash completion
echo "Completing bash completion"
print_and_run 'echo "# bash completion" >> ~/.profile'
print_and_run 'echo "if [ -f $(brew --prefix)/etc/bash_completion ]; then" >> ~/.profile'
print_and_run 'echo "  . $(brew --prefix)/etc/bash_copmletion" >> ~/.profile'
print_and_run 'echo "fi" >> ~/.profile'

# install pip
echo "Installing pip"
print_and_run 'sudo easy_install pip'
print_and_run 'mkdir -p ~/Library/Python/2.7/lib/python/site-packages'
print_and_run 'echo "$(brew --prefix)/lib/python2.7/site-packages" >> ~/Library/Python/2.7/lib/python/site-packages/homebrew.pth'

# install XQuartz
echo "You need to install XQuartz from https://xquartz.macosforge.org"
read -p "Press [ENTER] once it's done..."

# ssh keys
echo "Copy your ssh keys in your .ssh directory"
read -p "Press [ENTER] once it's done..."

# name of computer
echo "Setting name of the computer"
print_and_run 'sudo scutil --set HostName sancho'
echo "Edit your /etc/hosts file to add sancho to the localhost line"
read -p "Press [ENTER] once it's done..."

# LaTeX
echo "Install LaTeX from tug.org/mactex/"
read -p "Press [ENTER] once it's done..."
print_and_run 'echo "# path for latex" >> ~/.profile'
print_and_run 'echo "export PATH=/usr/local/texlive/2014/bin:$PATH" >> ~/.profile'

# iPython
echo "Install iPython"
print_and_run 'pip install ipython'

# install skype
echo "Install skype from www.skype.com"
read -p "Press [ENTER] once it's done..."
