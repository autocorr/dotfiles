#!/usr/bin/env python
import shutil as sh
from os import path


dots = [
        'bashrc',
        'emacs',
        'gitconfig',
        'tcshrc',
        'tmux.conf',
        'vim/vimrc',
        'vimperatorrc',
        'zsh/zshrc',
       ]


def copy_dot(rpath):
    """
    Copy file from local repo to hidden file in user folder.
    """
    base = path.basename(rpath)
    src = path.abspath('./' + rpath)
    dst = path.expanduser('~/.' + base)
    sh.copyfile(src, dst)


if __name__ == '__main__':
    for f in dots:
        copy_dot(f)
