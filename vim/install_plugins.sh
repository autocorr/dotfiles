#!/usr/bin/env bash

BDIR=$HOME/.vim/bundle
wget https://tpo.pe/pathogen.vim -O $HOME/.vim/autoload/pathogen.vim
git clone https://github.com/jiangmiao/auto-pairs $BDIR/auto-pairs
git clone https://github.com/vim-scripts/tComment $BDIR/tComment
git clone https://github.com/kien/ctrlp.vim $BDIR/ctrlp.vim
git clone https://github.com/davidhalter/jedi-vim $BDIR/jedi-vim
git clone https://github.com/scrooloose/syntastic $BDIR/syntastic
git clone https://github.com/bling/vim-airline $BDIR/vim-airline
git clone https://github.com/tpope/vim-fugitive $BDIR/vim-fugitive
git clone https://github.com/jpalardy/vim-slime $BDIR/vim-slime
git clone https://github.com/tpope/vim-surround $BDIR/vim-surround
git clone https://github.com/JuliaLang/julia-vim $BDIR/julia-vim
git clone https://github.com/klen/python-mode.git $BDIR/python-mode
git clone https://github.com/junegunn/vim-easy-align.git $BDIR/vim-easy-align
