function g = rosenbrockg(x)
    g = [-2*(1-x(1))+200*(x(2)-x(1)^2)*-2*x(1);
         200*(x(2)-x(1)^2)];