% Armijo line search
function [a, w] = lineSearch(f, df, g, dg, x, s, mu_old, w_old)
    t = 0.3; % scale factor on current gradient: [0.01, 0.3]
    b = 0.8; % scale factor on backtracking: [0.1, 0.8]
    a = 1; % maximum step length
    
    D = s;                  % direction for x
    
    % Calculate weights in the merit function using eaution (7.77)
     w = max(abs(mu_old), 0.5*(w_old + abs(mu_old)));
    % terminate if line search takes too long
    count = 0;
    while count<100
        % Calculate phi(alpha) using merit function in (7.76)
         phi_a = f(x+a*D) + w*abs(min(0,-1*g(x+a*D)));
        
        % Caluclate psi(alpha) in the line search using phi(alpha)
         phi0 = f(x) + w*abs(min(0,-1*g(x)));% phi(0)
         dphi0 = df(x) + w*abs(min(0,-1*dg(x)));% phi'(0)
         psi_a = phi0 + t*a*dphi0;% psi(alpha) = phi(0)+t*alpha*phi'(0)
        
        % stop if condition satisfied
        if phi_a < psi_a
            stop = 1
            if stop;
                break;
            else
                % backtracking
                a = a*b;
                count = count + 1;
            end
        end
    end
end