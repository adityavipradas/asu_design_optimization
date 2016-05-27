function [xval, fval] = MOGA(filename)
    global bf bv bt bs
    [x, f, v, t, s, R2f, R2v, R2t, R2s] = extract(filename);
    FitnessFunction = @MOGA_obj; % Function handle to the fitness function
    numberOfVariables = 3; % Number of decision variables
    lb = [66 124 5]; % Lower bound
    ub = [90 150 27]; % Upper bound
    A = []; % No linear inequality constraints
    b = []; % No linear inequality constraints
    Aeq = []; % No linear equality constraints
    beq = []; % No linear equality constraints
    options.PlotFcn = @gaplotpareto;
    options.TolFun = 1e-5;
    options.ParetoFraction = 0.5;
    %options.Generations = 1000;
    %options = optimset(@gamultiobj,'PlotFcn',@gaplotpareto);
    [xval,fval,exitFlag,Output] = gamultiobj(FitnessFunction, ...
        numberOfVariables,A,b,Aeq,beq,lb,ub,options);
    fprintf('The number of points on the Pareto front was: %d\n', size(x,1));
    fprintf('The number of generations was : %d\n', Output.generations);
    %plot(freq, vol);
    %grid on;
end
