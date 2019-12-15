x = [1 2 3 4 5];
y = [6 5 7 10 9];

n = length(x);

% 1. Linear model (w.r.t the independent variables)
X = [ones(n, 1) x'];

% Solve linear least squares (linear w.r.t the parameters)
b = inv((X' * X)) * X' * y';

% Use solution (i.e., parameter estimates) to make predictions
y_hat_lin = X * b;

% 2. Quadratic model (w.r.t the independent variables)
X = [ones(n, 1) x' (x.^2)'];

% Solve linear least squares (linear w.r.t parameters)
b = inv((X' * X)) * X' * y';

% Use solution (i.e., parameter estimates) to make predictions
y_hat_quad = X * b;

% 3. Qubic model (w.r.t the independent variables)
X = [ones(n, 1) x' (x.^2)' (x.^3)'];

% Solve linear least squares (linear w.r.t parameters)
b = inv((X' * X)) * X' * y';

% Use solution (i.e., parameter estimates) to make predictions
y_hat_cub = X * b;

plot(x, y, 'o');
hold on;
plot(x, y_hat_lin);
hold on;
plot(x, y_hat_quad);
hold on;
plot(x, y_hat_cub);
axis([0 6 0 15]);
xlabel('x');
ylabel('y');
legend('data', 'linear', 'quadratic', 'cubic');
title('Data fitting with least squares');