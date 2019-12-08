% clear;
% clc;
% format long;

f = @(x) 1 ./ (1 + 2 * x + 3 * x.^2);

a = 0.0;
b = 1.0;
n = 10; % arbitrary selection of the number of points

I = f(a) + f(b);
h = (b - a) / n;

for i = 1 : (n - 1)
    x = a + i * h;
    I = I + 2 * f(x);
end

I = (h / 2) * I;
QI = integral(f, a, b);
err1 = abs(I - QI);
err2 = norm(I - QI);

fprintf('I: %.15f\n', I);
fprintf('QI: %.15f\n', QI);
fprintf('abs(I - QI): %.15f\n', err1);
fprintf('norm(I - QI): %.15f\n', err2);