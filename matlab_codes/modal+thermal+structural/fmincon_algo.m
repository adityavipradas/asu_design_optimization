function [xval, lambda] = fmincon_algo(filename, fcon, tcon, scon)
    %nf = 2; % number of objective functions
    %N = 50; % number of points for plotting
    global bf bv bt bs fcon tcon scon
    
    [x, f, v, t, s, R2f, R2v, R2t, R2s] = extract(filename);
    
    %objective function
    obj = @fmincon_obj
    
    %Define the upper and lower bounds
    lb = [66 124 5];
    ub = [90 150 27];
    
    %Define the equality constraints
    Aeq = [];
    beq = [];
    
    %Define the inequality constraints
    A = [];
    b = [];
    
    h0 = [70 130 20];
    
    options.Algorithm = 'interior-point';
    %nonlinear constraints
    nonlcon = @quadcon;
    [h,fval,exitflag,output,lambda,grad,hessian] = ...
        fmincon(obj, h0, A, b, Aeq, beq, lb, ub, nonlcon, options);
    %disp(xval{2});
    %disp(freq);
    %plot(-freq, vol);
    %grid on;
end

function [c,ceq] = quadcon(h)
    global bf bt fcon tcon scon
    c(1) = -1*fmincon_conf(h) + fcon;
    c(2) = fmincon_cont(h) - tcon;
    c(3) = fmincon_cons(h) - scon;
    ceq = [];
end





