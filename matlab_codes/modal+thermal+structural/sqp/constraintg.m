function dg = constraintg(x)
    %%% Calculate the gradient of the constraints
    %%% dg(x)/dx = [dg1/dx1, dg1/dx2, ... , dg1/dxn;
    %%%             dg2/dx1, dg2/dx2, ... , dg2/dxn;
    %%%             ...
    %%%             dgm/dx1, dgm/dx2, ... , dgm/dxn]
    global bf bs bt
    X = [x', x'.^2, ones(1)];
    dg = zeros(9,length(x));
    for i=1:length(x)
        dg(1,i) = -bf(i) - 2*bf(i+3)*X(i);
        dg(8,i) = -bt(i) - 2*bt(i+3)*X(i);
        dg(9,i) = -bs(i) - 2*bs(i+3)*X(i);
    end
    dg(2:7,1:3) = [-1 0 0;1 0 0;0 -1 0;0 1 0;0 0 -1;0 0 1];
end