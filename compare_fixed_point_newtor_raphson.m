clear;
clc;
format long;

x0 = 1.0;
tol = 1e-5;
N = 50;

f = @(x) x - sqrt(exp(x)/3);
df = @(x) 1 - (1/2)*(sqrt(exp(x)/3));
g = @(x) sqrt(exp(x)/3);

fprintf('Fixed-point method\n');
[ x_fp, i_fp, err_fp ] = fixed_point( g, x0, N, tol );

fprintf('\n');

fprintf('Newton-Raphson method\n');
[ x_nr, i_nr, err_nr ] = newton_raphson( f, df, x0, N, tol );