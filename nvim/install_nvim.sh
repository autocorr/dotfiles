#!/usr/bin/env bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

pip2 install neovim --user --upgrade
pip3 install neovim --user --upgrade

echo "Run :CheckHealth in neovim"
