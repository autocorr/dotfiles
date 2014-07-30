#!/usr/bin/env bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python3
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install grin ipdb ipython matplotlib nose numexpr numpy pandas pypi-cli scipy scikit-learn astropy aplpy emcee jedi virtualenv sphinx
