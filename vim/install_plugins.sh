#!/usr/bin/env bash

BDIR=$HOME/.vim/bundle
gitc () {
	git clone https://github.com/$1/$2.git $BDIR/$2
}

# :: pathogen
wget https://tpo.pe/pathogen.vim -O $HOME/.vim/autoload/pathogen.vim
# -- theme
gitc bling vim-airline
# -- tmux
gitc christoomey vim-tmux-navigator
# -- syntax
gitc scrooloose syntastic
# -- format
gitc jiangmiao auto-pairs
gitc junegunn vim-easy-align
gitc vim-scripts tComment
gitc vimwiki vimwiki
# -- utility
gitc ctrlpvim ctrlp.vim
gitc jpalardy vim-slime
gitc tpope vim-surround
# -- git
gitc tpope vim-fugitive
# -- python
gitc davidhalter jedi-vim
gitc klen python-mode
# -- julia
gitc JuliaLang julia-vim
# -- haskell
gitc bitc vim-hdevtools
gitc eagletmt ghcmod-vim
gitc dag vim2hs
gitc Shougo vimproc.vim  # required for vim2hs
# -- io
gitc andreimaxim vim-io
# -- rust
gitc rust-lang rust.vim
# :: build
cd $BDIR/vimproc.vim
make
cd -
