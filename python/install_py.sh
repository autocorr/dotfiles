#!/usr/bin/env bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python3 python3-dev python-dev
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
# dependencies for matplotlib
sudo apt-get install libagg-dev libjpeg8-dev libfreetype6-dev libgpng12-dev
sudo pip install grin ipdb ipython matplotlib nose numexpr numpy pandas pypi-cli scipy scikit-learn astropy aplpy emcee jedi virtualenv sphinx
