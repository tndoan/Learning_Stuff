clear; clc;

x = load('ex5Logx.dat');
y = load('ex5Logy.dat');

% figure
% 
% % Find the indices for the 2 classes
% pos = find(y); neg = find(y == 0);
% 
% plot(x(pos, 1), x(pos, 2), 'b+')
% hold on
% plot(x(neg, 1), x(neg, 2), 'ro')

u = x(:, 1);
v = x(:, 2);
x = map_feature(u, v);

listOfLambda = [0 1 10];
g = @(z) 1.0 ./ ( 1.0 + exp(-z));

m = length(y); % number of data points
n = length(x(1, :)'); % number of features of training data

for k = 1:1
    lam = listOfLambda(k);
    theta = zeros(n, 1); % init theta
    for i = 1:15 % loop 15 times
        % compute the gradient of J
        h = g(x * theta);
        first_part = (1/m) * sum(repmat((h - y), 1, n) .* x);
        second_part = (lam/m) * ([0 ones(1, n - 1)]' .* theta);
        grad_J = first_part' + second_part;
        
        % compute the Hessian matrix
        H = 0;
        for j=1:m
            H = H + h(j) * (1 - h(j)) * x(j, :)' * x(j, :);   
        end
        H = (1/m) * H + (lam / m) * diag([0 ones(1, n - 1)]);
        
        % update theta
        theta = theta - H \ grad_J;
        
        % calculate the cost function
        J = 0;
        for j = 1:m
            J = J + y(j) * log(h(j)) + (1 - y(j)) * log(1 - h(j));
        end
        J = J * (-1/m) + (lam /(2 * m)) * sum([0 ones(1, n - 1)]' .* (theta.^2));
    end
    norm(theta)
end

% % Define the ranges of the grid
% u = linspace(-1, 1.5, 200);
% v = linspace(-1, 1.5, 200);
% 
% % Initialize space for the values to be plotted
% z = zeros(length(u), length(v));
% 
% % Evaluate z = theta*x over the grid
% for i = 1:length(u)
%     for j = 1:length(v)
%         % Notice the order of j, i here!
%         z(j,i) = map_feature(u(i), v(j))*theta;
%     end
% end
% 
% % Because of the way that contour plotting works
% % in Matlab, we need to transpose z, or
% % else the axis orientation will be flipped!
% z = z'
% % Plot z = 0 by specifying the range [0, 0]
% contour(u,v,z, [0, 0], 'LineWidth', 2)