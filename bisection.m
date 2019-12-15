function [ x, i, err ] = bisection(f, a, b, N, tol)
    
    x0 = 0;
    
    for i = 1:1:N
        
        x = (a + b) / 2;
        
        if (f(a) * f(x) < 0)
            b = x;
        else
            a = x;
        end
        
        if abs( x - x0 ) < tol
            break;
        end
        
        err = abs( x - x0 );
        
        x0 = x;
        
    end
    if i == N
        disp( 'Bisection Method: Root not found.' );
    else
        disp( [ 'Bisection Method: x = ' num2str(x) ' iterations = ' num2str(i) ] );
    end
        
%     if abs(x - x0) < tol
%         disp( [ 'Bisection Method: x = ' num2str(x) ' iterations = ' num2str(i) ] );
%     else
%         disp( 'Bisection Method: Root not found.' );
%     end
    
end