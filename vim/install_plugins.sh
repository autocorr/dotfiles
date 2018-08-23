#!/usr/bin/env bash

BDIR=$HOME/.vim/bundle
gitc () {
	git clone https://github.com/$1/$2.git $BDIR/$2
}

# :: install pathogen
wget https://tpo.pe/pathogen.vim -O $HOME/.vim/autoload/pathogen.vim

# :: install plugins
gitc christoomey vim-tmux-navigator
gitc ctrlpvim ctrlp.vim
gitc davidhalter jedi-vim
gitc jiangmiao auto-pairs
gitc JuliaLang julia-vim
gitc junegunn vim-easy-align
gitc kalekundert/vim-coiled-snake
gitc Konfekt/FastFold
gitc lambdalisue/vim-cython-syntax
gitc nanotech jellybeans.vim
gitc rust-lang rust.vim
gitc tpope vim-fugitive
gitc tpope vim-sensible
gitc tpope vim-surround
gitc tpope vim-vinegar
gitc vim-airline vim-airline
gitc vim-airline vim-airline-themes
gitc vimwiki vimwiki

