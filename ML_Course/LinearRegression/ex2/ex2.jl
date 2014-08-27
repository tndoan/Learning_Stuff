x = readcsv("ex2x.dat");
y = readcsv("ex2y.dat");

m = length(y); # number of y
x = [ones(m, 1) x]; # add unity column to x 

old_theta = [0.0; 0.0]; # we have only 2 features
new_theta = [5000.0; 5000.0]; # init random value
alpha = 0.07; # learning rate

iter = 1; #interation index

#while sum(abs(new_theta - old_theta)) > 0.01
while iter < 1500
    temp_1 = 0; temp_2 = 0; # cost function for each parameter
    
    if iter != 1
        old_theta = new_theta;
    end
    
    h = x * old_theta;
    diff = (h - y);
    s = sum([diff diff] .* x, 1) * alpha * (1/m);
    new_theta = old_theta - s';
    
    # the following loop could be reduce to 
    #for i=1:m
    #    temp_1 = temp_1 + (h[i] - y[i]) * x[i, 1];
    #    temp_2 = temp_2 + (h[i] - y[i]) * x[i, 2];
    #end
    #new_theta[1] = old_theta[1] - (alpha * temp_1 / m);
    #new_theta[2] = old_theta[2] - (alpha * temp_2 / m);

    if iter == 1
        println(new_theta); # print the result of 1st iteration
    end
    iter = iter + 1;
end

println(iter);
println(new_theta);

# doing prediction
println([1 3.5] * new_theta); # predict the height of 3.5 years old kid
println([1 7] * new_theta); # predict the height of 7 years old kid
