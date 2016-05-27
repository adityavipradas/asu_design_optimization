function [] = GRG()

clc;

d = 2;
s1 = 3;
s2 = 4;
k = 1;
dzdd = 1;

while abs(dzdd) > 0.01
    dfdd = (obj(d+0.01, s1, s2) - obj(d, s1, s2))/0.01;
    
    dh1dd = (h1(d+0.01, s1, s2) - h1(d, s1, s2))/0.01;
    dh2dd = (h2(d+0.01, s1, s2) - h2(d, s1, s2))/0.01;
    dhdd = [dh1dd; dh2dd];
    
    dfds1 = (obj(d, s1+0.01, s2) - obj(d, s1, s2))/0.01;
    dfds2 = (obj(d, s1, s2+0.01) - obj(d, s1, s2))/0.01;
    dfds = [dfds1 dfds2];
    
    dh1ds1 = (h1(d, s1+0.001, s2) - h1(d, s1, s2))/0.01;
    dh1ds2 = (h1(d, s1, s2+0.01) - h1(d, s1, s2))/0.01;
    dh2ds1 = (h2(d, s1+0.01, s2) - h2(d, s1, s2))/0.01;
    dh2ds2 = (h2(d, s1, s2+0.01) - h2(d, s1, s2))/0.01;
    dhds = [dh1ds1 dh1ds2; dh2ds1 dh2ds2];
    
    dhds = correctH(dhds);
    
    dzdd = dfdd - dfds * inv(dhds) * dhdd;
    
    d = d - 0.001 * dzdd;
    s = inv(dhds) * dhdd * 0.001 * dzdd;
    s1 = s(1);
    s2 = s(2);
    
    while abs(h1(d, s1, s2)) > 0.01 && abs(h2(d, s1, s2)) > 0.01
        hval = [h1(d, s1, s2); h2(d, s1, s2)];
        s = s - inv(dhds)*hval;
        s1 = s(1);
        s2 = s(2);
    end
    k = k + 1;
end
disp(d);
disp(s1);
disp(s2);
end