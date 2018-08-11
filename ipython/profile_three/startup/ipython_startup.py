#!/usr/bin/env python3
# encoding: utf-8

from matplotlib import pyplot as plt
try:
    plt.switch_backend('agg')
except RuntimeError:
    import warnings
    warnings.warn('Failed to switch `matplotlib` to GTK backend.',
                  RuntimeWarning)

import numpy as np
import pandas as pd
from astropy import units as u
from astropy import constants as c
from astropy import coordinates
from astropy.io import fits


# pandas
pd.set_option('max_rows', 50)
pd.set_option('max_columns', 40)
