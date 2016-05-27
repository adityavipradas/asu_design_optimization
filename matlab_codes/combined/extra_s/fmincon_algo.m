function [xval, freq, vol, lambda] = fmincon_algo(filename, fstar, N)
    %nf = 2; % number of objective functions
    %N = 50; % number of points for plotting
    global bf bv fstart
    
    fstart = fstar;
    
    [x, f, v, R2f, R2v] = extract(filename);
    
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
    
    h0 = [50 50 20];
    freq = [];
    vol = [];
    
    for i=1:N
        %nonlinear constraints
        nonlcon = @quadcon;
        [h,fval,exitflag,output,lambda,grad,hessian] = fmincon(obj, h0, A, b, Aeq, beq, lb, ub, nonlcon);
        xval{i} = h;
        freq(i) = fmincon_con(h);
        vol(i) = fmincon_obj(h);
        fstart = fstart + 20;
    end
    %disp(xval{2});
    %disp(freq);
    %plot(-freq, vol);
    %grid on;
end

function [c,ceq] = quadcon(h)
    global bf fstart
    c =  fmincon_con(h) - fstart;
    ceq = [];
end





