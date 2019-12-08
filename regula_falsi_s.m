clear;
clc;
format long;

a = 0.0;
b = 1.0;
N = 50;
tol = 1e-6;

f = inline('2*x^3+4*x^2-3*x-1');

c_old = 0;

if (f(a) * f(b) < 0)
    for i = 1:N
        
        c = (a * f(b) - b * f(a)) / (f(b) - f(a));
        
        fprintf('%3.0f, %20.14f, %20.14f, %20.14f, %20.14f, %20.14f\n', i, a, b, c, f(c), abs(b - a));
        
        if (f(a) * f(c) < 0)
            b = c;
        else
            a = c;
        end
        
        if (abs(c - c_old) < tol)
            break;
        end
        
        c_old = c;
    end
else
    fprintf('Regula falsi method has failed, since no root exists ',...
    'in the interval [%f, %f]', a, b);
end