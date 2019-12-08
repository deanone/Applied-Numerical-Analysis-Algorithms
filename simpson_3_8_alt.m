% clear;
% clc;
% format long;

f = @(x) 1 ./ (1 + 2 * x + 3 * x.^2);

a = 0.0;
b = 1.0;
m = 12; % arbitrary selection of the number of points, a value that can be divided by 3

h = (b - a) / m;

I = f(a) + f(b);

for i = 1 : 3 : (m - 1)
    x1 = a + i * h;
    x2 = a + (i + 1) * h;
    x3 = a + (i + 2) * h;
    I = I + 3 * f(x1) + 3 * f(x2) + 2 * f(x3);
end

I = I - (2 * f(b)); % attention to this point

I = (3 * h / 8) * I;
QI = integral(f, a, b);
err1 = abs(I - QI);
err2 = norm(I - QI);

fprintf('I: %.15f\n', I);
fprintf('QI: %.15f\n', QI);
fprintf('abs(I - QI): %.15f\n', err1);
fprintf('norm(I - QI): %.15f\n', err2);


