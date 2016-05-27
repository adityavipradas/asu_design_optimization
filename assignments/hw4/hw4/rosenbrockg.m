function g = rosenbrockg(x)
    %%% Gradient vector. (row vector)
    df/dx = [2*x(1), 2*x(2), 2*x(3)];
    
    g = df/dx;
end