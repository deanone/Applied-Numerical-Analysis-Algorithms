function [ x, i, err ] = secant( f, x0, x1, N, tol )
    for i = 1:N
        x = x1 - f(x1) * ((x1 - x0) / (f(x1) - f(x0)));
        fprintf('%3.0f %20.14f %20.14f\n', i, x, abs(x - x1))
        err = abs(x - x1);
        if err < tol
            break;
        end
        x0 = x1;
        x1 = x;
    end
    
    if abs(x - x1) < tol
        fprintf('Secant method converged to x = %f after %d iterations\n', x, i);
    else
        fprintf('Secant method failed to converge after %d iterations\n', N);
    end
end