function g = grad(x)
    %%% Gradient vector. (row vector)
    dfdx = [2*x(1), 2*x(2), 2*x(3)];
    
    g = dfdx;
end