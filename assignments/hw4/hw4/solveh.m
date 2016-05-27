function s = solveh(x, h, delh, s_id)

eps = 1e-8;  % Set a tolerance for convergence 
s = x(s_id);    % Save the current state variables

iter = 0;       % Set initial iteration to 0
% Set termination criterion
hnorm = norm(h(x),2); % norm of the constraint vector

    while(hnorm > eps)
        iter = iter+1; % Increase iteration by 1
        
        dhds = delh(x);
        m = dhds(:,2:3); % current dh/ds
        
        % Modify dh/ds when it is singular
        %%% KEEP THIS %%%
        dhds_inv = correctH(m);
        %%%%%%%%%%%%%%%%%
        
        s = s - dhds_inv*h(x); % Use modified dh/ds to calculate new s
        x(s_id) = s;        % Save new s to the current solution
        
        hnorm = norm(h(x),2); % Update termination critetion
    end
end