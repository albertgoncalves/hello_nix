#! /usr/bin/env python3

import sys

import numpy  as np
import pandas as pd


def main():
    print('python: {}'.format(sys.version))

    for name, mod in zip(['numpy', 'pandas'], [np, pd]):
        print('{:<6}: {}'.format(name, mod.__version__))


if __name__ == '__main__':
    main()
