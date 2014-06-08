function rand_multi_normal(number, mean, stdev)
    # number is the number of sample which are needed to generate
    # mean is the mean of distribution whose size is n
    # stdev: standard deviation (covariation matrix)
    # return matrix whose size is n x number
    N = size(mean, 1)
    result = zeros(N, number) # initialize the result
    A = chol(stdev)
    for i = 1:number
        z = randn(N)
        result[:, i] = mean + A*z
    end
    return result
end
