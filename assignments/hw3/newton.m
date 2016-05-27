%%%%%%%%%%%%%% Newton's Method Implementation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% By Max Yi Ren and Emrah Bayrak %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function solution = newton(f,g,H,x0,opt)
    % Set initial conditions
     x = x0; % Set current solution to the initial guess
     iter = 0; % Set iteration counter to 0
     solution.x([1,2],1) = x;
    % Calculate the norm of the gradient
     gnorm = norm(g(x),2);

    while gnorm>opt.eps % if not terminated
        iter = iter + 1;
        
        % opt.linesearch switches line search on or off. 
        % You can first set the variable "a" to different constant values and see how it
        % affects the convergence.
        if opt.linesearch
            a = lineSearch1(f,g,H,x,opt);
        else
            a = 0.001;
        end
        
        % Newton's method:
         x = x - a*inv(H(x))*g(x);
        
        % save current step
         solution.x([1,2],iter+1) = x;  
        
        % Update termination criterion:
         gnorm = norm(g(x),2);
    end
    disp(x);
    disp(iter);