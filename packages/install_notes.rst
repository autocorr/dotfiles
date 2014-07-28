Install Notes
=============
System configuration and post-install notes for new systems.


System
------
* `mkdir ~/code`
* Install programs
  - `z dotfiles/packages`
  - `./install_cli.sh`
  - `./install_gui.sh`
  - Other install files
* Copy dots
  - `z dotfiles/`
  - `./dots.py --tohome`
* Caps-lock to control
  - Install `gnome-tweak-tool` (install_gui.sh)
  - Typing -> Caps Lock Behavior

Python
------
* Install packages
  - `z dotfiles/packages`
  - `./install_py.sh`

Julia
-----
* Install Julia
  - `z code`
  - `git clone https://github.com/julialang/julia`
  - `git pull; make clean; make -j 4`

Shell
-----
* Install fasd
  - `git clone https://github.com/clvv/fasd`
  - `cd fasd`
  - `sudo make install`
* Setup zsh
  - `z dotfiles/zsh`
  - `./setup_zsh.sh`

Vim
---
* Install vim plugins
  - `z dotfiles/vim`
  - `./setup_vim.sh`

Themes
------
* Install themes
  - `mkdir ~/.themes ~/.icons ~/.fonts`
  - `z dotfiles/theme`
  - `./install_theme.sh`
* unity-tweak-tool / gnome-tweak-tool
* gnome-terminal
  - Color scheme -> Tango

Mac Specific
------------
* Fan controller
  - `sudo apt-get install macfanctld`
