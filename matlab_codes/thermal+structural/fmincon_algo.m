function [xval, freq, vol, temp, lambda] = fmincon_algo(filename, fstar, tstar, N)
    %nf = 2; % number of objective functions
    %N = 50; % number of points for plotting
    global bf bv bt fstart tstart
    
    fstart = fstar;
    tstart = tstar;
    
    [x, f, v, t, R2f, R2v, R2t] = extract(filename);
    
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
    freq = [];
    vol = [];
    
    options.Algorithm = 'interior-point';
    for i=1:N
        for j=1:N
        %nonlinear constraints
        nonlcon = @quadcon;
        [h,fval,exitflag,output,lambda,grad,hessian] = fmincon(obj, h0, A, b, Aeq, beq, lb, ub, nonlcon, options);
        xval{i,j} = h;
        freq(i,j) = fstart;
        temp(i,j) = tstart;
        vol(i,j) = fmincon_obj(h);
        fstart = fstart - 1
        disp(i);
        end
        fstart = fstar;
        tstart = tstart - 10
    end
    %disp(xval{2});
    %disp(freq);
    %plot(-freq, vol);
    %grid on;
end

function [c,ceq] = quadcon(h)
    global bf bt fstart tstart
    c(1) = fmincon_conf(h) - fstart;
    c(2) = fmincon_cont(h) - tstart;
    ceq = [];
end





