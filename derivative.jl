
function takeDerivative(param::Array{Float64, 1}, x::Array{Float64, 1}, y::Float64)
    # param: point that we want to calculate derivative
    # point: training data
    # return derivative of function (w' * x_i - y_i)^2
    return 2 * (dot(param, x) - y) * x
end
