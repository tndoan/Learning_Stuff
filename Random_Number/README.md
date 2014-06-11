Generate random number by using Julia
===
#rand_mul_normal.jl
It is similar to function ``mvnrnd`` in [MATLAB](http://www.mathworks.com/help/stats/mvnrnd.html). The implementation is followed the instruction from [Wikipeida](http://en.wikipedia.org/wiki/Multivariate_normal_distribution#Drawing_values_from_the_distribution).

Sample code to generate random value

```julia
julia> include("rand_mul_normal.jl")
rand_multi_normal (generic function with 1 method)

julia> result = rand_multi_normal(10000, [2; 3], [1 1.5; 1.5 3])

2x10000 Array{Float64,2}:
3.35064  2.89725  1.42352  2.3993   0.57473  -2.5407   3.31123  4.64985  5.70327  …  2.02263  0.666638  3.05298  -0.717696  3.50809  -0.139212  3.33618
3.39154  3.67322  2.27478  2.85813  2.27422   1.01697  3.31628  3.9268   5.36457     2.50484  1.77308   3.60626   1.42283   3.12098   2.60739   3.22388
```

#rand_GMM.jl

It is try to generate the random value from Gaussian mixture models. The implementation is followed the instruction from [MATLAB forums](http://www.mathworks.com/matlabcentral/newsreader/view_thread/36174)

Sample code to generate the random value:

```julia
include("rand_GMM.jl")
M = 3;
mu = [-5 -5; 0 0; 5 5];
sigma = cat(3, [2 0; 0 1], [2 -.2; -.2 2], [1 .9; .9 1]);
y = rand_GMM(100000, mu, sigma, [1 1 1]);
```

Check the source code to investigate more about the implementation.
