import numpy as np

def ks_loop(x, alpha, D):
    """The implementation of Karplus-Strong algorithm
    y[n] = \alpha y[n - M] + x[n]
    """
    M = np.size(x)

    y = list()
    size_y = M * D

    y = np.zeros((size_y, 1)) # Initialization for y vector
    for i in range(M):
        y[i] = x[i]

    for i in range(M + 1, size_y):
        y[i] = float(alpha * y[index - M])

    return y
