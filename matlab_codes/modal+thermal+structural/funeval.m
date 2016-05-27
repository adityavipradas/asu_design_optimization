function [evalf evalv evalt evals] = funeval(filename, x)
    global bf bv bt bs
    [xval, f, v, t, s, R2f, R2v, R2t, R2s] = extract(filename);
    evalf = 0;
    evalv = 0;
    evalt = 0;
    evals = 0;
    X = [x, x.^2, ones(1)];
    for i = 1:length(X)
        evalf = evalf + bf(i)*X(i);
        evalv = evalv + bv(i)*X(i);
        evalt = evalt + bt(i)*X(i);
        evals = evals + bs(i)*X(i);
    end
end
