function [ A_U, x ] = gaussian_elimination( A, b )
    format short;
    [n, m] = size(A);
    if n == m
        n_b = length(b);
        if n_b == n
            
            x = zeros(1, n);
            
            % forward elimination
            for k = 1 : n - 1
                
                % partial pivoting
                if A(k, k) < 1e-4
                    [max_val, max_ind] = max(abs(A(k + 1 : n, k)));
                    A([k (k + max_ind)], :) = A([(k + max_ind) k], :);
                    b([k (k + max_ind)]) = b([(k + max_ind) k]);
                end
                
                disp(['Eliminate variable x_' num2str(k) ':'])
                for i = k + 1 : n
                    r = A(i, k) / A(k, k);
                    for j = k : n
                        A(i, j) = A(i, j) - r * A(k, j);
                    end
                    b(i) = b(i) - r * b(k);
                end
                disp(A);
            end
            
            % backward substitution
            for i = n:-1:1
                disp(['Backward substitute variable x_' num2str(i) ':'])
                sum = 0;
                for j = i + 1 : n
                    sum = sum + A(i, j) * x(j);
                end
                x(i) = (b(i) - sum) / A(i, i);
                disp(x);
            end
            
            A_U = A;
            disp('A in upper triangular form:')
            disp(A_U);
            disp('Solution of the linear system:')
            disp(x);
        else
            fprintf('Not matching dimensions between A and b\n');
        end
    else
        fprintf('A not square\n');
    end
end

