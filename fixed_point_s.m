clear;
clc;
format long;

g = inline('sqrt(exp(x)/3)');

x0 = 1.0;
tol = 1e-5;

N = 50;

for i = 1:N
    x = g(x0);
    fprintf('%3.0f %20.14f %20.14f\n', i, x, abs(x - x0));
    err = abs(x - x0);
    if err < tol
        break;
    end
    x0 = x;
end

if abs(x - x0) < tol
    fprintf('Fixed-point method converged to x = %f after %d iterations\n', x, i);
else
    fprintf('Fixed-point method failed to converge after %d iterations\n', N);
end