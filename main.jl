require("genData.jl")
require("sgd.jl")
require("svrg.jl")

w = [1.0; 2.0; 3; 4]
x, y = generateData(w, 100000)

# test stochastic gradient descent
#sgd(0.01, x, y)

# test SVGR
svrg(0.0001, x, y)
