function y = p1(x)
    
    %FUNCTION FILE

    %para consists of the a1, a2 and a3 values for water (row1) and 
    %1,4 dioxane (row2)
    para = [8.07131, 1730.63, 233.426; 7.43155, 1554.679, 240.337];

    %define the temperature (deg celsius)
    T = 20;

    %evaluate the saturation pressures for water and 1,4 dioxane
    for i=1:1:2
        psat(i) = 10^(para(i,1) - para(i,2)/(T + para(i,3)));
    end

    %data
    xdata = [0.0:0.1:1];
    ydata = [28.1, 34.4, 36.7, 36.9, 36.8, 36.7, 36.5, 35.4, 32.9, ...
        27.7, 17.5];
    
    y = 0;
    
    %function
    for i = 1:1:length(xdata)
        x1 = xdata(i);
        x2 = 1 - x1;
        yval = ydata(i);
        
        y = y + (x1 * exp(x(1)*(x(2)*x2/(x(1)*x1 + ...
        x(2)*x2))^2) * psat(1) + x2 * exp(x(2)* ...
        (x(1)*x1/(x(1)*x1 + x(2)*x2))^2) * psat(2) - yval)^2;
    end
    