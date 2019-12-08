clear;
clc;
format long;

tic;
x = 0.0:0.2:0.8;
n = length(x);
Q = zeros(n);
Q(:, 1) = [1.00000 1.22140 1.49182 1.82212 2.22554];

for j = 2 : n
    for i = j : n
        Q(i, j) = ((Q(i, j - 1) - Q(i - 1, j - 1)) / (x(i) - x(i - j + 1)));
    end
end

disp(Q);
toc;