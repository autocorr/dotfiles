#!/usr/bin/env python

# path for local packages
import sys
scripts_dir = '/mnt/eld_data/scripts/'
paths = ['besl', 'astroquery', 'py']
paths = [scripts_dir + path for path in paths]
sys.path.extend(paths)

# imports
import besl
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# matplotlib
plt.ion()
