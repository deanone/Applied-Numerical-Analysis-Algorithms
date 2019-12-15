function [ x, i, err ] = newton_raphson( f, df, x0, N, tol )
    for i = 1:N
        x = x0 - f(x0)/df(x0);
        fprintf('%3.0f %20.14f %20.14f\n', i, x, abs(x - x0))
        err = abs(x - x0);
        if err < tol
            break;
        end
        x0 = x;
    end
    
    if abs(x - x0) < tol
        fprintf('Newton-Raphson method converged to x = %f after %d iterations\n', x, i);
    else
        fprintf('Newton-Raphson method failed to converge after %d iterations\n', N);
    end
end