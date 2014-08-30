x = load('ex5Linx.dat');
y = load('ex5Liny.dat');

% plot the data
scatter(x, y)
hold on

m = length(y); % number of data points
x = [ones(m, 1), x, x.^2, x.^3, x.^4, x.^5];

lambda = [0 1 10];
color = ['r-', 'g-', 'b-'];
for i = 1:3
    l = lambda(i);
    v = diag([0; ones(5, 1)]);
    
    theta = inv(x' * x + l * v) * x' * y;
    t = linspace(-1, 1, 100)';
    tt = [ones(100, 1), t, t.^2, t.^3, t.^4, t.^5];
    yy = tt * theta;
    plot(t, yy, color(i));
end