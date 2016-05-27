% Armijo line search
function a = lineSearch(f,g,delh,x,d_id, s_id)
    %disp(x);
    t = 0.1; % scale factor on current gradient: [0.01, 0.3]
    b = 0.55; % scale factor on backtracking: [0.1, 0.8]
    a = 1; % maximum step length
    
    G = g(x);   % gradient vector of all variables 
    %disp(G);
    D = zeros(length(x),1);   % A zero direction vector for state and decision variables
    
    Dd = -1*G(1,1);                  % Direction for decision variables
    Ds = (-1*G(1,2:3))';                  % Direction for state variables
    %disp(Dd);
    %disp(Ds);
    D([d_id, s_id]) = [Dd;Ds];   % Save the directions to direction vector      
    %disp(D);
    % terminate if line search takes too long
    count = 0;
    while f(x+a*D) > f(x)+t*a*G*D || count > 10
        % stop if condition satisfied
        % implement Armijo's criterion here
        % perform backtracking
        a = b*a;
        count = count + 1;   
    end
    disp(a);
end
