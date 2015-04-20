#!/bin/bash

function print_and_run {
	echo "$ "$1
	bash -c "$1"
}
Off="\033[0m"
Info="\033[1;34m"
Action="\033[0;31m"

# Some dependencies are in generic
echo -e $Action"You need to have installed Xcode, brew, pip and Xquartz (cf generic_install) and use python from the system and NOT from brew."$Off
read -p "Press [ENTER] once it's done..."

# install ROS (wiki.ros.org/indigo/Installation/OSX/Homebrew/Source)
# setting up tools
echo -e $Info"Installing tools"$Off
print_and_run 'brew install cmake'
print_and_run 'brew tap ros/deps'
print_and_run 'brew tap osrf/simulation'
print_and_run 'brew tap homebrew/versions'
print_and_run 'brew tap homebrew/science'
print_and_run 'sudo pip install -U wstool rosdep rosinstall rosinstall_generator rospkg catkin-pkg Distribute sphinx'
print_and_run 'sudo rosdep init'
print_and_run 'rosdep update'
# create workspace
echo -e $Info"Getting code"$Off
print_and_run 'mkdir ~/ros_catkin_ws'
print_and_run 'cd ~/ros_catkin_ws'
# create list of packages
print_and_run 'rosinstall_generator desktop --rosdistro indigo --deps --wet-only --tar > indigo-desktop-wet.rosinstall'
## using hydro version of rviz since indigo version requires ogre1.8+ but not readily available
print_and_run 'rosinstall_generator rviz --rosdistro hydro --wet-only --tar >> indigo-desktop-wet.rosinstall'
# getting source
print_and_run 'wstool init -j8 src indigo-desktop-wet.rosinstall'
# installing dependency
echo -e $Info"Installing dependencies"$Off
print_and_run 'rosdep install -r --from-paths src --ignore-src --rosdistro indigo -y'
# prepare compilation
echo -e $Action"Remove tinyxml in src/image_common/image_transport/CMakeLists.txt"$Off
read -p "Press [ENTER] once it's done..."
echo -e $Action"You may need to check https://github.com/ros-visualization/rviz/pull/825 for rviz to compile."$Off
read -p "Press [ENTER] once it's done..."
# actual compilation
echo -e $Info"Compilation"$Off
print_and_run './src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release'
# environment settings
print_and_run 'source ~/.ros_catkin_ws/install_isolated/setup.bash'
echo -e $Info"Permanent ROS environment settings"$Off
print_and_run 'echo "# ROS setup" >> ~/.profile'
print_and_run 'echo "source ~/ros_catkin_ws/install_isolated/setup.bash" >> ~/.profile'
print_and_run 'echo "export LC_CTYPE=en_US.UTF-8" >> ~/.profile'

