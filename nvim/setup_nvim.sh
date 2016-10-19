#!/usr/bin/env bash

VIMDIR=$HOME/.config/nvim

if [ ! -d $VIMDIR ]; then
	mkdir -p $VIMDIR
fi

if [ ! -d "$VIMDIR/autoload" ]; then
	curl -fLo $VIMDIR/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p $VIMDIR/backups
	mkdir -p $VIMDIR/swaps
	cp ./init.vim $VIMDIR
	ln -s $VIMDIR $HOME/.nvim
	ln -s $VIMDIR/init.vim $HOME/.nvimrc
else
	echo "autoload directory exists, halting."
fi
