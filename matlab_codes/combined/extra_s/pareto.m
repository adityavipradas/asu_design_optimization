function [] = pareto(nf, N)
    global bv bf
    %nf = 2; % number of objective functions
    %N = 50; % number of points for plotting
    
    %clear screen
    clc;
    

    %import xls file
    data = xlsread('modal_doe.xlsx');

    %input matrix
    x = data(:,1:3);

    %natural frequency values
    f = data(:,4);
    
    %volume values
    v = data(:,5);

    %quadratic fit
    X = [x,x.^2,ones(size(x,1),1)];

    %freq regression
    bf = (X'*X)\X'*f;
    
    %vol regression
    bv = (X'*X)\X'*v;
    
    rf = X*bf-f;
    %R2 value for freq
    R2f = 1-sum(rf.^2)/sum((f - mean(f)).^2);

    rv = X*bv-v;
    %R2 value for volume
    R2v = 1-sum(rv.^2)/sum((v - mean(v)).^2);
    
    %Define the upper and lower bounds
    lb = [66 124 5];
    ub = [90 150 27];
    
    %Define the equality constraints
    Aeq = [];
    beq = [];
    
    %Define the inequality constraints
    A = [];
    b = [];
    
    k = 1;
    [min1,minfn1] = fmincon(@(x)pickindex(x,k),[0 0 0],A,b, ...
        Aeq,beq,lb,ub);
    k = 2;
    [min2,minfn2] = fmincon(@(x)pickindex(x,k),[0 0 0],A,b, ...
        Aeq,beq,lb,ub);
    
    goal = [minfn1,minfn2];
    
    
    onen = 1/N;
    xval = zeros(N+1,1);
    fval = zeros(N+1,nf);
    fun = @mult_obj;
    x0 = [0 0 0];
    options = optimset('fgoalattain');
    for r = 0:N
        t = onen*r; % 0 through 1
        weight = [t,1-t];
        [xval(r+1,:),fval(r+1,:)] = fgoalattain(fun,x0,goal,weight,...
            [],[],[],[],lb,ub,[],options)
    end

    figure
    plot(fval(:,1),fval(:,2),'k.');
    xlabel('f_1')
    ylabel('f_2')
    
end

function fn = mult_obj(x)
    global bf bv 
    X1 = [x,x.^2,ones(size(x,1),1)];
    fn(:,1) = X1*bf;
    fn(:,2) = X1*bv;
end

function z = pickindex(x,k)
    z = mult_obj(x); % evaluate both objectives
    z = z(k); %return objective k
end





