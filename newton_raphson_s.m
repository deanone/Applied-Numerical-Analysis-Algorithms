clear;
clc;
format long;

%f = inline('x^3 + x^2 + x - 1');
%df = inline('3*x^2 + 2*x + 1');

f = @(x) x^3 + x^2 + x - 1;
df = @(x) 3*x^2 + 2*x + 1;

x0 = 0;
tol = 1e-4;
N = 20;

index = zeros(1, N);
approx_roots = zeros(1, N);
errors = zeros(1, N);
f_vals = zeros(1, N);

for i = 1:N
    x = x0 - f(x0)/df(x0);
    err = abs(x - x0);
    
    index(i) = i;
    approx_roots(i) = x;
    errors(i) = err;
    f_vals(i) = f(x);
    
    fprintf('%3.0f %20.14f %20.14f\n', i, x, err)
    
    if err < tol
        break;
    end
    x0 = x;
end

if abs(x - x0) < tol
    fprintf('Newton-Raphson method converged to x = %f after %d iterations\n', x, i);
else
    fprintf('Newton-Raphson method failed to converge after %d iterations\n', N);
end

f1 = figure('Name', 'Roots');
f2 = figure('Name', 'Errors');
f3 = figure('Name', 'f values');

figure(f1);
plot(index(1:i), approx_roots(1:i));
figure(f2);
plot(index(1:i), errors(1:i));
figure(f3);
plot(index(1:i), f_vals(1:i));