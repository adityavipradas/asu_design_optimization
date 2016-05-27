function [] = problem2()
    clc;
    x = [];
    y = [];
    for i = -1:0.1:2
        x(end+1) = i;
        y(end+1) = (1-i)^3;
    end
    plot(x,y);
    grid on;
end