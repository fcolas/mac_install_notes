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

# installing cask
echo "Installing cask"
print_and_run 'brew install caskroom/cask/brew-cask'

# install vim and macvim
echo "Install vim and macvim"
print_and_run 'brew install vim macvim'
# set vim as default editor
print_and_run 'echo "# default command line editor" >> ~/.profile'
print_and_run 'echo "export EDITOR=/usr/local/bin/vim" >> ~/.profile'

# install git (with gitk and stuff)
echo "Installing newer git"
print_and_run 'brew install git'

# completing bash completion
echo "Completing bash completion"
print_and_run 'echo "# bash completion" >> ~/.profile'
print_and_run 'echo "if [ -f $(brew --prefix)/etc/bash_completion ]; then" >> ~/.profile'
print_and_run 'echo "  . $(brew --prefix)/etc/bash_completion" >> ~/.profile'
print_and_run 'echo "fi" >> ~/.profile'

# install pip
echo "Installing pip"
print_and_run 'sudo easy_install pip'
print_and_run 'mkdir -p ~/Library/Python/2.7/lib/python/site-packages'
print_and_run 'echo "$(brew --prefix)/lib/python2.7/site-packages" >> ~/Library/Python/2.7/lib/python/site-packages/homebrew.pth'

# install XQuartz
echo "Installing XQuartz"
print_and_run 'brew cask install xquartz'

# ssh keys
echo "Copy your ssh keys in your .ssh directory"
read -p "Press [ENTER] once it's done..."

# LaTeX
echo "Installing mactex"
print_and_run 'brew cask install mactex'

# iPython
echo "Install iPython"
print_and_run 'pip install ipython'

# install skype
echo "Installing skype"
print_and_run 'brew cask install skype'

# install inkscape
echo "Installing inkscape"
print_and_run 'brew cask install inkscape'

# install gimp
echo "Installing gimp"
print_and_run 'brew cask install gimp'
