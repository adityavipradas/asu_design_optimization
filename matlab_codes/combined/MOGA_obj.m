function y = MOGA_obj(x)
    global bf bs bt bv;
    y = zeros(4,1);
    %[x, bf, bv, f, v, R2f, R2v] = extract(filename);
    X = [x, x.^2, ones(1)];
    Xs = [x, x.^2, x.^3, x.^4, x.^5, ones(1)];
    for i = 1:length(X)
        y(1) = y(1) + bv(i)*X(i);
        y(2) = -y(2) - bf(i)*X(i);
        y(3) = y(3) + bt(i)*X(i);
    end
    for i = 1:length(Xs)
        y(4) = y(4) + bs(i)*Xs(i); 
    end
end