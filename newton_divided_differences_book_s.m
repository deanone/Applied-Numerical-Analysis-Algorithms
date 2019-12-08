clear;
clc;
format long;

tic;
n = 4;
x = [0.0 0.2 0.4 0.6 0.8];
Q(1:n+1,1) = [1.00000 1.22140 1.49182 1.82212 2.22554];

for i = 1:n
    for j = 1:i
        Q(i+1,j+1) = (Q(i+1,j) - Q(i,j)) / (x(i+1) - x(i-j+1));
    end
end

disp(Q);
toc;