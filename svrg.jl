require("derivative.jl")

function svrg(lRate::Float64, data::Array{Float64, 2}, y::Array{Float64, 1})
    n, k = size(data)
    w_0_tilde = rand(k) * 10 # init param
    m = 2 * n # update frequency.
    conv = false

    prev_obj = 0
    
    while !conv
        w_tilde = w_0_tilde
        μ_tilde = zeros(k)

        for i=1:n
            point = vec(data[i, :])
            μ_tilde += takeDerivative(w_tilde, point, y[i])
        end
        μ_tilde /= n
        
        w_0 = w_tilde

        for t=1:m
            i_t = rand(1:n) # random pick
            p = vec(data[i_t, :])
            f1 = takeDerivative(w_0, p, y[i_t]) 
            f2 = takeDerivative(w_tilde, p, y[i_t])
            #println("f1:$f1 f2:$f2 w_0:$w_0 μ_tilde:$μ_tilde")
            w_0 = w_0 - lRate * (f1 - f2  + μ_tilde)
        end

        w_0_tilde = w_0
        
        # objective function
        obj = data * w_0_tilde - y
        obj = sum(obj .* obj) / n
        println(obj) # print the objective function after each iteration

        if abs(prev_obj - obj) < 0.0001 # check convergence
           conv = true
        end

        prev_obj = obj
    end

    println(w_0_tilde)
end
