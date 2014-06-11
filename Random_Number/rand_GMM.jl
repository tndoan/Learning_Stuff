function rand_GMM(number, mean, stdev, prob)
    # number: number of sample which is need to be generated
    # mean: M x D matrix. M is the components normal
    # stdev: D by D by M array of covariance matrices for M components normal 
    # prob: M by 1 vector of component mixing probabilities. the sum of Prob does not guarantee to be 1
    # M : number of normal distribution, D : dimension of each normal distribution
    # return the matrix whose size is number by D is the generated data
    (M, d) = size(mean) # get the size of input

    # divide interval [0, 1] by the prob
    interval = [0; cumsum(prob[:]) / sum(prob)]
    # generate number of value from uniform distribution
    r_value = rand(number, 1)

    # do like getting index using histc in Matlab
    # in Matlab we use: [~, index_matrix] = histc(r_value)
    index_matrix = zeros(Int64, number) + size(interval, 1) - 1 # store the bin index
    for i in 1:number
        value = r_value[i]
        for j in 2:size(interval, 1) - 1
            if interval[j - 1] <= value < interval[j]
                index_matrix[i] = j - 1
            end
        end
    end

    # calculate the cholesky matrix
    Rt = zeros(M, d, d)
    for i = 1:M
        Rt[i, :, :] = chol(stdev[:, :, i])
    end

    r_n_value = randn(number, d) # random normal value
    
    # do this because Julia does not allow to put array after repmat
    z = r_n_value
    for i = 2:d
        z = cat(3, z, r_n_value)
    end

    new_Rt = zeros(number, d, d)
    for i = 1:d
        element = Rt[:, :, i]
        new_Rt[:, :, i] = element[index_matrix, :]
    end

    first_part = sum(z.*Rt[index_matrix,:,:],2)
    # eliminate of singleton dimension of first part
    # in Matlab  we use: first_part = squeeze(first_part)
    s = size(first_part)
    i = size(s, 1)
    while i > 0
        if s[i] == 1 # size equal to 1 means singleton
            first_part = squeeze(first_part, i)
        end
        i = i - 1
    end

    second_part = mean[index_matrix, :]
    result = first_part + second_part

    return result
end
