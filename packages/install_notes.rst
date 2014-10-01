Install Notes
=============
System configuration and post-install notes for new systems.


System
------
* ``mkdir ~/code``
* Install programs

  * Software sources; upgrade
  * ``z dotfiles/packages``
  * ``./install_cli.sh``
  * ``./install_gui.sh``
  * ``./install_emus.sh``
  * Other install files

* Copy dots

  * ``z dotfiles/``
  * ``./dots.py --tohome``

* Caps-lock to control

  * Install ``gnome-tweak-tool`` (install_gui.sh)
  * Typing -> Caps Lock Behavior

* Settings -> Screensaver, lock 1 min after screensaver

* Add keyboard shortcuts

  * Settings -> Keyboard -> Shortcuts -> Sound and Media
  * Add shortcuts for mute/volume-up/volume-down


Python
------
* Install packages

  * ``z dotfiles/packages``
  * ``./install_py.sh``


Julia
-----
* Install Julia

  * ``z code``
  * ``git clone https://github.com/julialang/julia``
  * ``git pull; make clean; make -j 4``


Shell
-----
* Install fasd

  * ``git clone https://github.com/clvv/fasd``
  * ``cd fasd``
  * ``sudo make install``

* Setup zsh

  * ``z dotfiles/zsh``
  * ``./setup_zsh.sh``


Vim
---
* Install vim plugins

  * ``z dotfiles/vim``
  * ``./setup_vim.sh``


Themes
------
* Install themes

  * ``mkdir ~/.themes ~/.icons ~/.fonts``
  * ``z dotfiles/theme``
  * ``./install_theme.sh``

* Desktop background
* unity-tweak-tool / gnome-tweak-tool
* gnome-terminal

  * Color scheme -> Tango


Mac Specific
------------
* Fan controller

  * ``sudo apt-get install macfanctld``

* Function keys
 
  * ``echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf``
  * ``sudo update-initramfs -u -k all``


Ubuntu Specific
---------------
* Flickering video with nvidia drivers

  * ``sudo apt-get install compizconfig-settings-manager``
  * Utility -> Workarounds -> "Force synchronization between X and GLX"
  * Utility -> Workarounds -> "Force full screen redraws (buffer swap) on repaint"


