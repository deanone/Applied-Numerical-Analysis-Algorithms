clear;
clc;
format long;

a = 1.0;
b = 2.0;
N = 50;
tol = 1e-4;

f = inline('x^2 - 3');

if (f(a) * f(b) < 0)
    for i = 1:N
        
        p = (a + b) / 2;
        
        fprintf('%3.0f, %20.14f, %20.14f, %20.14f, %20.14f, %20.14f\n', i, a, b, p, f(p), abs(b - a));
        
        if (f(a) * f(p) < 0)
            b = p;
        else
            a = p;
        end
        
        if (abs(b - a) < tol)
            break;
        end
        
    end
else
    fprintf('Bisection method has failed, since no root exists in the interval [%f, %f]', a, b);
end