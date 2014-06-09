function rand_multi_normal(number, mean, stdev)
    # number is the number of sample which are needed to generate
    # mean is the mean of distribution whose size is n
    # stdev: standard deviation (covariation matrix)
    # return matrix whose size is n x number
    N = size(mean, 1)

    if ndims(stdev) != 2 # check the dimension of covariance matrix
        error("size of covariance matrix must be 2")
    end
    if !(size(stdev, 1) == size(stdev, 2) == N)
        # check the size of co-var matrix and mean vector
        error("size of inputs is inconsistant")
    end

    result = zeros(N, number) # initialize the result
    A = chol(stdev)
    for i = 1:number
        z = randn(N)
        result[:, i] = mean + A*z
    end
    return result
end
