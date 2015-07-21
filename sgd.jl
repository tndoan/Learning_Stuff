require("derivative.jl")

function sgd(lRate::Float64, data::Array{Float64, 2}, y::Array{Float64, 1})
    n, m = size(data)
    w = rand(m) * 100 - 50  # init parameters

    for i=1:n # for each data point
        point = data[i, :]
        dev = takeDerivative(w, vec(point), y[i])
        w = w - lRate * dev
        
        # objective function
        s = data * w - y
        s = sum(s .* s) / n
        println(s) # print the minimum value
    end

    println(w) # print learned parameters
end
