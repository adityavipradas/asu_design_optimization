function [x, f, v, t, s, R2f, R2v, R2t, R2s] = extract(filename)
%PREPARED BY ADITYA VIPRADAS AND SHARAN KISHORE (TEAM 11)
    global bv bf bt bs
    clc;
    %extract
    data = xlsread(filename);
    x = data(:,1:3);
    f = data(:,4);
    t = data(:,5);
    s = data(:,6);
    v = data(:,7);
    %quadratic fit
    X = [x,x.^2,ones(size(x,1),1)]

    %freq regression
    bf = (X'*X)\X'*f;
    
    %vol regression
    bv = (X'*X)\X'*v;
    
    %temp regression
    bt = (X'*X)\X'*t;
    
    %stress regression
    bs = (X'*X)\X'*s;
    
    rf = X*bf-f;
    %R2 value for freq
    R2f = 1-sum(rf.^2)/sum((f - mean(f)).^2);
    
    rv = X*bv-v;
    %R2 value for volume
    R2v = 1-sum(rv.^2)/sum((v - mean(v)).^2);
    
    rt = X*bt-t;
    %R2 value for temp
    R2t = 1-sum(rt.^2)/sum((t - mean(t)).^2);
    
    rs = X*bs-s;
    %R2 value for temp
    R2s = 1-sum(rs.^2)/sum((s - mean(s)).^2);
end