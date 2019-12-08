% clear;
% clc;
% format long;

f = @(x) 1 ./ (1 + 2 * x + 3 * x.^2);

a = 0.0;
b = 1.0;
m = 12; % arbitrary selection of the number of points

h = (b - a) / m;

I = f(a) + f(b);

for  i = 1 : 2 : (m - 1)
    x = a + i * h;
    I = I + 4 * f(x);
end

for i = 2 : 2 : (m - 1)
    x = a + i * h;
    I = I + 2 * f(x);
end

I = (h / 3) * I;
QI = integral(f, a, b);
err1 = abs(I - QI);
err2 = norm(I - QI);

fprintf('I: %.15f\n', I);
fprintf('QI: %.15f\n', QI);
fprintf('abs(I - QI): %.15f\n', err1);
fprintf('norm(I - QI): %.15f\n', err2);