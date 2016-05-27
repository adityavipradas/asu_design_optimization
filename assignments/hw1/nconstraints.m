%Define nonlinear constraints in nconstraints.m file
function [c, ceq] = nconstraints(x)
    c = -1 * (12*x(1) + 11.9*x(2) + 41.8*x(3) + 52.1*x(4) - 21 - 1.645 ...
        *(0.28*x(1)^2 + 0.19*x(2)^2 + 20.5*x(3)^2 + 0.62*x(4)^2)^(1/2));
    ceq = [];
end