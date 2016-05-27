function c2 = fmincon_cont(x)
    global bt
    c2 = 0;
    X = [x, x.^2, ones(1)];
    for i = 1:length(X)
        c2 = c2 + bt(i)*X(i);
    end
end
