#!/usr/bin/env bash

ICONSDIR=$HOME/.icons
THEMESDIR=$HOME/.themes

cp -r ./Ambiance-Grey $THEMESDIR
cp -r ./Faenza-Ambiance $ICONSDIR

# install Papirus icon set
git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme-gtk/ $ICONSDIR
mv $HOME/.icons/papirus-icon-theme-gtk/Papirus-GTK $ICONSDIR
rm -rf $ICONSDIR/papirus-icon-theme-gtk
