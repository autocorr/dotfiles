#!/usr/bin/env bash

VIMDIR=$HOME/.vim
if [ ! -d "$VIMDIR/autoload" ]; then
	mkdir $VIMDIR/autoload
	mkdir $VIMDIR/bundle
	mkdir $VIMDIR/backups
	mkdir $VIMDIR/swaps
	mkdir $VIMDIR/colors
	cp ./vimrc ~/.vimrc
	cp ./jellybeans.vim $VIMDIR/colors
	cp ./install_plugins.sh $VIMDIR/bundle
	cp ./update_plugins.sh $VIMDIR/bundle
	./install_plugins.sh
else
	echo "autoload directory exists, halting."
fi
