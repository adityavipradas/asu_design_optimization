function [x, f, v, R2f, R2s, R2t, R2v] = extract(filename)
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
    X = [x,x.^2,ones(size(x,1),1)];
    Xs = [x,x.^2,x.^3,x.^4,x.^5,ones(size(x,1),1)];
    %freq regression
    bf = (X'*X)\X'*f;
    
    %stress regression
    bs = (Xs'*Xs)\Xs'*s;
    
    %temp regression
    bt = (X'*X)\X'*t;
    
    %vol regression
    bv = (X'*X)\X'*v;
    
    rf = X*bf-f;
    %R2 value for freq
    R2f = 1-sum(rf.^2)/sum((f - mean(f)).^2);
    
    rs = Xs*bs-s;
    %R2 value for freq
    R2s = 1-sum(rs.^2)/sum((s - mean(s)).^2);
    
    rt = X*bt-t;
    %R2 value for freq
    R2t = 1-sum(rt.^2)/sum((t - mean(t)).^2);
    
    rv = X*bv-v;
    %R2 value for volume
    R2v = 1-sum(rv.^2)/sum((v - mean(v)).^2);
end