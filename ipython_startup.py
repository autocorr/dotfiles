#!/usr/bin/env python

# path for local packages
try:
    import besl
except ImportError:
    import sys
    import warnings
    scripts_dir = '/mnt/eld_data/scripts/'
    paths = ['besl', 'py']
    paths = [scripts_dir + path for path in paths]
    sys.path.extend(paths)
    warnings.warn('PYTHONPATH set incorrectly')

# imports
from __future__ import division
import besl
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# matplotlib
plt.ion()
