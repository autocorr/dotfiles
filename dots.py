#!/usr/bin/env python
import argparse
import shutil as sh
from os import path


parser = argparse.ArgumentParser(prog='dots', description='Manage dotfiles.')
parser.add_argument('--torepo', action='store_true',
                    help='Copy dots to repo from ~/')
parser.add_argument('--tohome', action='store_true',
                    help='Copy dots to ~/ from repo')
args = parser.parse_args()


dots = ['bashrc',
        'emacs/emacs',
        'gitconfig',
        'tcshrc',
        'tmux.conf',
        'vim/vimrc',
        'vimperatorrc',
        'zsh/zshrc',
        'htoprc',
        ]


def copy_dot(to_repo=True):
    """
    Copy files between the local repo and hidden file in the user folder.

    Parameters
    ----------
    to_repo : bool, True
        True  -> copy from ~/ to repo
        False -> copy from repo to ~/
    """
    for rpath in dots:
        base = path.basename(rpath)
        src = path.expanduser('~/.' + base)
        dst = path.abspath('./' + rpath)
        if to_repo:
            if path.isfile(src):
                sh.copyfile(src, dst)
            else:
                print ':: skipping: {0}'.format(base)
        else:
            sh.copyfile(dst, src)


if __name__ == '__main__':
    if args.torepo & args.tohome:
        print args
        raise ValueError('Ambiguous call.')
    if args.torepo:
        copy_dot(to_repo=True)
    elif args.tohome:
        copy_dot(to_repo=False)
