#!/usr/bin/env python3
# encoding: utf-8


import os

## Try switching backend to GTK
from matplotlib import pyplot as plt
try:
    plt.switch_backend('agg')
except RuntimeError:
    import warnings
    warnings.warn('Failed to switch `matplotlib` GTK backend.',
                  RuntimeWarning)

## Import aliases
# Numerical
import numpy as np
import pandas as pd
# Astronomy
from astropy import units as u
from astropy import constants as c
from astropy import coordinates
from astropy.io import fits


## Pandas
pd.set_option('max_rows', 50)
pd.set_option('max_columns', 40)

CAT_DIR = os.path.expanduser('~/research/Catalogs/_collected/')


