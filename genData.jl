
function generateData(w::Array{Float64, 1}, numPoints::Int64)
    # w: vector of groundtruth
    # numPoints: number of data points that we want to generate
    n = length(w)
    r = randn(numPoints, n)
    ra = rand(numPoints, n) * 100.0 - 50.0 # uniform random from -50 to 50
    x = r + ra
    y = x * w
    return x, y
end
