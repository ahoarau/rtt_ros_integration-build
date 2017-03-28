#!/usr/bin/env sh

latest_tag=$(curl -s https://api.github.com/repos/ahoarau/orocos_toolchain-build/releases | grep tag_name | head -n 1 | cut -d '"' -f 4)

echo "Latest tag : $latest_tag"

cd $HOME

latest_release_url=$(curl -s https://api.github.com/repos/ahoarau/orocos_toolchain-build/releases | grep $latest_tag | grep browser_download_url | cut -d '"' -f 4 | grep $ROS_DISTRO)

echo "Latest URL : $latest_release_url"

cd $HOME/catkin_ws

mkdir -p $HOME/catkin_ws/install

curl -L $latest_release_url | tar xz -C $HOME/catkin_ws/install
# Avoid duplicates
rm -r $HOME/catkin_ws/install/share/industrial_ci

source $HOME/catkin_ws/install/setup.bash

