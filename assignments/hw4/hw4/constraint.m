function h = constraint(x)
    %%%% Constraint vector (column vector)
    h = [x(1)^2/4 + x(2)^2/5 + x(3)^2/25 - 1; ...
        x(1) + x(2) - x(3)];
    
    
    % h = ****;
end
