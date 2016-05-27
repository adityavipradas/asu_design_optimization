function df = objectiveg(x)
    %%% Calculate the gradient of the objective (row vector)
    %%% df(x)/dx = [df/dx1, df/dx2, ..., df/xn]
    global bv
    df = zeros(1,length(x));
    X = [x', x'.^2, ones(1)];
    for i=1:length(x)
        df(1,i) = bv(i) + 2*bv(i+3)*X(i);
    end
end