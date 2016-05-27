function y = MOGA_obj(x)
%PREPARED BY ADITYA VIPRADAS AND SHARAN KISHORE (TEAM 11)
    global bf bv bt bs;
    y = zeros(4,1);
    %[x, bf, bv, f, v, R2f, R2v] = extract(filename);
    X = [x, x.^2, ones(1)];
    for i = 1:length(X)
        y(1) = y(1) + bv(i)*X(i);
        y(2) = y(2) + bf(i)*X(i);
        y(3) = y(3) + bt(i)*X(i);
        y(4) = y(4) + bs(i)*X(i);
    end
    y(2) = -y(2);
end
