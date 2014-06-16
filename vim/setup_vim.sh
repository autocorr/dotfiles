#!/usr/bin/env bash

VIMDIR=$HOME/.vim
if [ ! -d "$VIMDIR/autoload" ]; then
	mkdir -p $VIMDIR/autoload
	mkdir -p $VIMDIR/bundle
	mkdir -p $VIMDIR/backups
	mkdir -p $VIMDIR/swaps
	mkdir -p $VIMDIR/colors
	cp ./vimrc ~/.vimrc
	cp ./jellybeans.vim $VIMDIR/colors
	cp ./install_plugins.sh $VIMDIR/bundle
	cp ./update_plugins.sh $VIMDIR/bundle
	./install_plugins.sh
else
	echo "autoload directory exists, halting."
fi
