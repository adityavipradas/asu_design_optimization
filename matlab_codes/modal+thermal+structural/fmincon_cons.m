function c3 = fmincon_cons(x)
    global bs
    c3 = 0;
    X = [x, x.^2, ones(1)];
    for i = 1:length(X)
        c3 = c3 + bs(i)*X(i);
    end
end
