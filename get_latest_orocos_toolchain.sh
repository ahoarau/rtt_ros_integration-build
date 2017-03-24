#!/usr/bin/env sh

latest_tag=$(curl -s https://api.github.com/repos/ahoarau/orocos_toolchain-build/tags | grep name | head -n 1 | cut -d '"' -f 4)

echo "Latest tag : $latest_tag"

lastest_release_url=$(curl -s https://api.github.com/repos/ahoarau/orocos_toolchain-build/releases | grep $latest_tag | grep browser_download_url | cut -d '"' -f 4 | grep $ROS_DISTRO)


echo "Latest URL : $latest_release_url"









