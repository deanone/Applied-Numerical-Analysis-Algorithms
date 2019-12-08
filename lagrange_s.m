clear;
clc;
format long;

%ff = inline('exp((x.^2) - 1)');
ff = @(x) exp((x.^2) - 1);

X0 = 1.15;
x = 1:0.1:1.4;
f = [1.00000 1.23368 1.55271 1.99372 2.61170];

n = length(x);
L = ones(1, n);

% the outer loop corresponds to all Lagrange polynomials
for k = 1:n
    % the 2 inner loops correspond to 1 Lagrange polynomial
    for i = 1:(k - 1)
        L(k) = L(k) * ((X0 - x(i)) / (x(k) - x(i)));
    end
    for i = (k + 1):n
        L(k) = L(k) * ((X0 - x(i)) / (x(k) - x(i)));
    end
end

% final Lagrange interpolation polynomial
y = 0;
for k = 1:n
    y = y + f(k) * L(k);
end

y
ff(X0)

disp(['Error at X0 = ', num2str(X0)]);
disp(norm(y - ff(X0)));