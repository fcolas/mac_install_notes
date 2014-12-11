#!/bin/bash

function print_and_run {
	echo "$ "$1
	$1
}
Off="\033[0m"
Info="\033[1;34m"
Action="\033[0;31m"

# first, you need to install Xcode
echo -e $Action"You need to install Xcode through the app store before anything else."$Off
read -p "Press [ENTER] once it's done..."

# you need to run Xcode once to accept the license
echo -e $Action"Launch Xcode in order to sign the license agreement."$Off
read -p "Press [ENTER] once it's done..."

# installing brew (package manager)
echo -e $Info"Installing the Homebrew package manager (brew)"$Off
print_and_run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
# run brew doctor once as requested by the installation
print_and_run 'brew doctor'
# shell completion
print_and_run 'echo "# brew shell completion" >> ~/.profile'
print_and_run 'echo "source `brew --repository`/Library/Contributions/brew_bash_completion.sh" >> ~/.profile'

# installing cask
echo -e $Info"Installing cask"$Off
print_and_run 'brew install caskroom/cask/brew-cask'

# install vim and macvim
echo -e $Info"Installing vim and macvim"$Off
print_and_run 'brew install vim macvim'
# set vim as default editor
print_and_run 'echo "# default command line editor" >> ~/.profile'
print_and_run 'echo "export EDITOR=/usr/local/bin/vim" >> ~/.profile'

# install git (with gitk and stuff)
echo -e $Info"Installing newer git"$Off
print_and_run 'brew install git'

# completing bash completion
echo -e $Info"Completing bash completion"$Off
print_and_run 'echo "# bash completion" >> ~/.profile'
print_and_run 'echo "if [ -f $(brew --prefix)/etc/bash_completion ]; then" >> ~/.profile'
print_and_run 'echo "  . $(brew --prefix)/etc/bash_completion" >> ~/.profile'
print_and_run 'echo "fi" >> ~/.profile'

# install pip
echo -e $Info"Installing pip"$Off
print_and_run 'sudo easy_install pip'
print_and_run 'mkdir -p ~/Library/Python/2.7/lib/python/site-packages'
print_and_run 'echo "$(brew --prefix)/lib/python2.7/site-packages" >> ~/Library/Python/2.7/lib/python/site-packages/homebrew.pth'

# install XQuartz
echo -e $Info"Installing XQuartz"$Off
print_and_run 'brew cask install xquartz'

# ssh keys
echo -e $Action"Copy your ssh keys in your .ssh directory"$Off
read -p "Press [ENTER] once it's done..."

# LaTeX
echo -e $Info"Installing mactex"$Off
print_and_run 'brew cask install mactex'

# iPython
echo -e $Info"Installing iPython"$Off
print_and_run 'pip install ipython'

# install skype
echo -e $Info"Installing skype"$Off
print_and_run 'brew cask install skype'

# install inkscape
echo -e $Info"Installing inkscape"$Off
print_and_run 'brew cask install inkscape'

# install gimp
echo -e $Info"Installing gimp"$Off
print_and_run 'brew cask install gimp'

# install vlc
echo -e $Info"Installing vlc"$Off
print_and_run 'brew cask install vlc'
