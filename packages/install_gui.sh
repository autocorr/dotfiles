#!/usr/bin/env bash
sudo apt-get update
sudo apt-get upgrade
echo ":: Installing main GUI packages"
sudo apt-get install firefox gimp saods9 skype steam stellarium thunderbird transmission virtualbox vlc wine xchat
echo ":: Installing auxillary GUI packages"
sudo apt-get install unity-tweak-tool gnome-tweak-tool
echo ":: google-earth, nomachine, pycharm, mendeley"
echo ":: require manual install"
