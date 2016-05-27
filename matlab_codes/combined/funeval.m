function [evalf evalv] = funeval(filename, x)
    global bf bv
    [xval, f, v, R2f, R2v] = extract(filename);
    evalf = 0;
    evalv = 0;
    X = [x, x.^2, ones(1)];
    for i = 1:length(X)
        evalf = evalf + bf(i)*X(i);
        evalv = evalv + bv(i)*X(i);
    end
end
