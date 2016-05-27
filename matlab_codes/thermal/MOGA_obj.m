function y = MOGA_obj(x)
    global bf bv;
    y = zeros(2,1);
    %[x, bf, bv, f, v, R2f, R2v] = extract(filename);
    X = [x, x.^2, ones(1)];
    for i = 1:length(X)
        y(1) = y(1) + bv(i)*X(i);
        y(2) = y(2) + bf(i)*X(i);
    end
end