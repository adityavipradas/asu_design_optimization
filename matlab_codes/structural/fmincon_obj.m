function y1 = fmincon_obj(x)
    global bv
    y1 = 0;
    X = [x, x.^2, ones(1)];
    for i = 1:length(X)
        y1 = y1 + bv(i)*X(i);
    end
end
