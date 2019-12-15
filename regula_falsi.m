function [ x, i, err ] = regula_falsi(f, a, b, N, tol)
    
    x0 = 1;

    for i = 1:N
        
        x = ( f(b) * a - f(a) * b ) / ( f(b) - f(a) );
        
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
        disp( 'Regula Falsi Method: Root not found.' );
    else
        disp( [ 'Regula Falsi Method: x = ' num2str(x) ' iterations = ' num2str(i) ] );
    end
    
%     if abs(x - x0) < tol
%         disp( [ 'Regula Falsi Method: x = ' num2str(x) ' iterations = ' num2str(i) ] );
%     else
%         disp( 'Regula Falsi Method: Root not found.' );
%     end
end