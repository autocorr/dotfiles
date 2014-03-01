#!/usr/bin/env python
# encoding: utf-8


## Python 3 compatibility
#try:
#    from future import standard_library
#    from future.builtins import *
#except ImportError:
#    import warnings
#    warnings.warn('future not installed, not using PY3 compatibility.')


## Import local modules if pathes incorrectly set
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
    import besl


## Import aliases
import numpy as np
import numexpr as ne
import pandas as pd
import matplotlib.pyplot as plt
from astropy.io import fits
from astropy import wcs
from imp import reload


## Matplotlib
# Turn plot interactivity on by default
plt.ion()

## Pandas
pd.set_option('max_rows', 50)
pd.set_option('max_columns', 40)


