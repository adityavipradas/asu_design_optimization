function g = constraint(x)
    %%% Calculate the constraints (column vector)
    %%% g(x) = [g1(x); g2(x); ... ; gm(x)]
    global bf
    disp(bf);
    g = zeros(7,1);
    disp(x);
    X = [x', x'.^2, ones(1)];
    for i = 1:length(X)
        g(1,1) = g(1,1) + bf(i)*X(i); 
    end
    g(1,1) = g(1,1) - 14;
    g(2:7,1) = [-X(1)+66; X(1)-90; -X(2)+124; X(2)-150; -X(3)+5; X(3)-27];
end