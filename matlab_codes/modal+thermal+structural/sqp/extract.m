function [x, f, v, t, s, R2f, R2v] = extract(filename)
    global bv bf bs bt
    clc;
    %extract
    data = xlsread(filename);
    x = data(:,1:3);
    f = data(:,4);
    s = data(:,5);
    t = data(:,6);
    v = data(:,7);
    %quadratic fit
    X = [x,x.^2,ones(size(x,1),1)]

    %freq regression
    bf = (X'*X)\X'*f;
    
    %vol regression
    bv = (X'*X)\X'*v;
    
    bt = (X'*X)\X'*t;
    bs = (X'*X)\X'*s;
    
    rf = X*bf-f;
    %R2 value for freq
    R2f = 1-sum(rf.^2)/sum((f - mean(f)).^2);
    
    rv = X*bv-v;
    %R2 value for volume
    R2v = 1-sum(rv.^2)/sum((v - mean(v)).^2);
end