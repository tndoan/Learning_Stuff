x = load('ex2x.dat');
y = load('ex2y.dat');

m = length(y); 
x = [ones(m, 1), x];

old_theta = [0; 0];
new_theta = [1; 1];

alpha = 0.07;
iter = 1;

while iter < 1500
    t_1 = 0.0; t_2 = 0.0;
    if iter ~= 1
        old_theta = new_theta;
    end
    h = x * old_theta;
    for i = 1:m
       t_1 = t_1 + (h(i) - y(i)) * x(i, 1);
       t_2 = t_2 + (h(i) - y(i)) * x(i, 2);
    end
    
    new_theta(1) = old_theta(1) - alpha * t_1 / m;
    new_theta(2) = old_theta(2) - alpha * t_2 / m;
    
    if iter == 1
       new_theta
    end
    iter = iter + 1;
end

iter
new_theta

% % Plot the model
% figure % open a new figure window
% plot(x(:, 2), y, 'o');
% ylabel('Height in meters')
% xlabel('Age in years')
% hold on % Plot new data without clearing old plot
% plot(x(:,2), x*new_theta, '-') % remember that x is now a matrix with 2 columns
%                            % and the second column contains the time info
% legend('Training data', 'Linear regression')

% understanding J
J_vals = zeros(100, 100);   % initialize Jvals to 100x100 matrix of 0's
theta0_vals = linspace(-3, 3, 100);
theta1_vals = linspace(-1, 1, 100);
for i = 1:length(theta0_vals)
	  for j = 1:length(theta1_vals)
        t = [theta0_vals(i); theta1_vals(j)];
        J_vals(i,j) = sum((x * t - y) .^ 2) / (2 * m);
    end
end

J_vals = J_vals'
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1')

figure;
% Plot the cost function with 15 contours spaced logarithmically
% between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 2, 15))
xlabel('\theta_0'); ylabel('\theta_1')