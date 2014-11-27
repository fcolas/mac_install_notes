#!/bin/bash

function print_and_run {
	echo $1
	#$1
}

# Some dependencies are in generic
echo "You need to have installed Xcode, brew, pip and Xquartz (cf generic_install)"
read -p "Press [ENTER] once it's done..."

# install ROS (wiki.ros.org/indigo/Installation/OSX/Homebrew/Source)
echo "Installing ros"
print_and_run 'brew install cmake'
print_and_run 'brew tap ros/deps'
print_and_run 'brew tap osrf/simulation'
print_and_run 'brew tap homebrew/versions'
print_and_run 'brew tap homebrew/science'
print_and_run 'sudo pip install -U wstool rosdep rosinstall rosinstall_generator rospkg catkin-pkg Distribute sphinx'
print_and_run 'sudo rosdep init'
print_and_run 'rosdep update'
print_and_run 'mkdir ~/ros_catkin_ws'
print_and_run 'cd ~/ros_catkin_ws'
print_and_run 'rosinstall_generator desktop --rosdistro indigo --deps --wet-only --tar > indigo-desktop-wet.rosinstall'
## using hydro version of rviz since indigo version requires ogre1.8+ but not readily available
print_and_run 'rosinstall_generator rviz --rosdistro hydro --wet-only --tar >> indigo-desktop-wet.rosinstall'
print_and_run 'wstool init -j8 src indigo-desktop-wet.rosinstall'
print_and_run 'rosdep install --from-paths src --ignore-src --rosdistro indigo -y'
echo "Remove tinyxml in src/image_common/image_transport/CMakeLists.txt"
read -p "Press [ENTER] once it's done..."
echo "Remove log4cxx (two times) in src/robot_state_publisher/CMakeLists.txt"
read -p "Press [ENTER] once it's done..."
echo "You may need to check https://github.com/ros-visualization/rviz/pull/825 for rviz to compile."
read -p "Press [ENTER] once it's done..."
print_and_run './src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release'
print_and_run 'source ~/.ros_catkin_ws/install_isolated/setup.bash'
echo "Permanent ROS environment settings"
print_and_run 'echo "# ROS setup" >> ~/.profile'
print_and_run 'echo "source ~/ros_catkin_ws/install_isolated/setup.bash" >> ~/.profile'

