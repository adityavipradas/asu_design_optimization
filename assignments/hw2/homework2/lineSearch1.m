% Armijo line search
function a = lineSearch1(f,g,H,x,opt)
    t = 0.1; % scale factor on current gradient: [0.01, 0.3]
    b = 0.55; % scale factor on backtracking: [0.1, 0.8]
    a = 1; % maximum step length
    G = feval(g,x);
    
    % Calculate the descent direction D for gradient or newton
    if strcmp(opt.alg,'gradient')
         D = -1*G;
    elseif strcmp(opt.alg,'newton')
         D = -1*inv(H(x))*G;
    end
    
    % terminate if line search takes too long
    count = 0;
    while f(x+a*D) > f(x)+t*a*G'*D 
        % stop if condition satisfied
        % implement Armijo's criterion here
        % perform backtracking
        a = b*a;
        count = count + 1;   
    end
    %disp(a);
    %disp(count);
end