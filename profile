# add colours to ls
export CLICOLOR=1

# brew shell completion
if [ -f `brew --repository`/Library/Contributions/brew_bash_completion.sh ]; then
    source `brew --repository`/Library/Contributions/brew_bash_completion.sh
fi

# default command line editor
export EDITOR=/usr/local/bin/vim

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# ROS setup
if [ -f ~/ros_catkin_ws/install_isolated/setup.bash ]; then
    source ~/ros_catkin_ws/install_isolated/setup.bash
fi

# custom prompt
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

# custom aliases
if [ -f ~/.bash_alias ]; then
    source ~/.bash_alias
fi

# C locale
export LC_CTYPE=en_US.UTF-8

# ipython3
if [ -f /usr/local/lib/python3.4/site-packages/IPython/terminal/ipapp.py ]; then
    alias ipython3='python3 /usr/local/lib/python3.4/site-packages/IPython/terminal/ipapp.py'
fi
