#!/usr/bin/env bash

cp -r ./Ambiance-Grey $HOME/.themes
cp -r ./Faenza-Ambiance $HOME/.icons

git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme-gtk/ $HOME/.icons
mv $HOME/.icons/papirus-icon-theme-gtk/Papirus-GTK $HOME/.icons
rm -rf $HOME/.icons/papirus-icon-theme-gtk
