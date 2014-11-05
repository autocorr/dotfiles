#!/usr/bin/env bash

cp ./zshrc $HOME/.zshrc
git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting
cp ./quetzal.zsh-theme $HOME/.oh-my-zsh/themes/
chsh -s /bin/zsh $USER
