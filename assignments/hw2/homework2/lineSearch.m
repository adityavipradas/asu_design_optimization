% Armijo line search
function a = lineSearch(f,g,H,x,opt)
    t = 0.29; % scale factor on current gradient: [0.01, 0.3]
    b = 0.79; % scale factor on backtracking: [0.1, 0.8]
    a = 1; % maximum step length
    G = feval(g,x);
    
    % Calculate the descent direction D for gradient or newton
    if strcmp(opt.alg,'gradient')
         D = -1*G;
    elseif strcmp(opt.alg,'newton')
%         D = ***;
    end
    
    % terminate if line search takes too long
    count = 0;
    fk = feval(f,x);
    while count<100
        % stop if condition satisfied
        % implement Armijo's criterion here
        p = D;
        falpha = feval(f,(x + a*p));
        oalpha = fk + a*t*G'*p;
        if falpha < oalpha
            break;
        else
            % perform backtracking
            a = b*a;
            count = count + 1;
        end   
    end
end