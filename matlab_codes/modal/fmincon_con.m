function c1 = fmincon_con(x)
%PREPARED BY ADITYA VIPRADAS AND SHARAN KISHORE (TEAM 11)
    global bf
    c1 = 0;
    X = [x, x.^2, ones(1)];
    for i = 1:length(X)
        c1 = c1 + bf(i)*X(i);
    end
end
