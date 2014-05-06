import numpy as np

def ks_loop(x, alpha, D):
    """The implementation of Karplus-Strong algorithm
    y[n] = alpha y[n - M] + x[n]
    """
    M = np.size(x)

    y = list()
    size_y = M * D

    y = np.zeros((size_y, 1)) # Initialization for y vector
    for i in range(M): # at this time y[n - something] = 0 so y[n] = x[n]
        y[i] = x[i]

    for i in range(M + 1, size_y): # at this interval, x[n] = 0 
        y[i] = float(alpha * y[i - M]) # so y[n] = alpha y[n - M]

    return y

def ks(x, alpha, D):
    """The implementation of Karplus-Strong algorithm 
    using matrix operator"""

    M = np.size(x)

    a = np.ones((1, D)) * alpha
    b = np.arange(D)
    alphaVector = pow(a, b)

    alphaMatrix = np.eye(D, M)
    for i in range(M):
        alphaMatrix[:, i] = alphaVector

    xMatrix = np.tile(x, (D, 1))

    yMatrix = xMatrix * alphaMatrix
    return yMatrix.flatten()
