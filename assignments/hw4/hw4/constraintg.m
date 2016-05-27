function hx = constraintg(x)
    %%% Gradient of the contraints:
    dhdx = [x(1)/2, 2*x(2)/5, 2*x(3)/25; ...
    1, 1, -1];
    
    
    hx = dhdx;
end