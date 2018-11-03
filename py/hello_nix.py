#! /usr/bin/env python3

import sys

import numpy  as np
import pandas as pd

def main():
    print('python: {}'.format(sys.version))

    mods = [ 'numpy'
           , 'pandas'
           ]

    for name, mod in zip(mods, [np, pd]):
        print('{:<6}: {}'.format(name, mod.__version__))

if __name__ == '__main__':
    main()

