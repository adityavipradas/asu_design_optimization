function g = p1gfd(x)
        
    %GRADIENT FILE

    g = [0;0];
    %function gradient
    g(1) = (p1([x(1)+0.01, x(2)])-p1(x))/0.01;
    g(2) = (p1([x(1), x(2)+0.01])-p1(x))/0.01;