#!/usr/bin/env bash
sudo apt-get update -y
sudo apt-get upgrade -y
echo ":: Installing main GUI packages"
sudo apt-get install -y firefox gimp saods9 skype steam stellarium thunderbird transmission virtualbox vlc wine xchat
echo ":: Installing auxillary GUI packages"
sudo apt-get install -y unity-tweak-tool gnome-tweak-tool
sudo apt-get install -y google-chrome-beta
echo ":: google-earth, pycharm, acroread"
echo ":: require manual install"
