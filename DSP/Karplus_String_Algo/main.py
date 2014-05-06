import numpy as np

def ks_loop(x, alpha, D):
    """The implementation of Karplus-Strong algorithm
    y[n] = \alpha y[n - M] + x[n]
    """
    M = np.size(x)

    result = list() # it is equal to y in introduction
    size_y = M * D

    return result
