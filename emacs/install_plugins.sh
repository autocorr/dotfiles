#!/usr/bin/env bash

EDIR=$HOME/.emacs.d
wget https://raw.githubusercontent.com/JuliaLang/julia/master/contrib/julia-mode.el -O $EDIR/julia-mode.el
git clone https://github.com/gabrielelanaro/emacs-for-python $EDIR/emacs-for-python
