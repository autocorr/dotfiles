#!/usr/bin/env bash

cp ./zshrc $HOME/.zshrc
git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
cp ./quetzal.zsh-theme $HOME/.oh-my-zsh/themes/
chsh -s /bin/zsh $USER
