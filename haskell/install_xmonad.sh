#!/usr/bin/env bash
sudo apt-get install xmonad libghc-xmonad-dev libghc-xmonad-contrib-dev
sudo apt-get install xmobar
mkdir ~/.xmonad
cp ./xmonad.hs ~/.xmonad/xmonad.hs
cp ./xmobarrc ~/.xmobarrc
