%clear screen
clc;
%para consists of the a1, a2 and a3 values for water (row1) and 
%1,4 dioxane (row2)
para = [8.07131, 1730.63, 233.426; 7.43155, 1554.679, 240.337];

%define the temperature (deg celsius)
T = 20;

%evaluate the saturation pressures for water and 1,4 dioxane
for i=1:1:2
    psat(i) = 10^(para(i,1) - para(i,2)/(T + para(i,3)));
end

%given data
xdata = [0.0:0.1:1];
ydata = [28.1, 34.4, 36.7, 36.9, 36.8, 36.7, 36.5, 35.4, 32.9, 27.7, 17.5];

%define the function
fun = @(A) xdata.* exp(A(1)*(A(2)*(1-xdata)./(A(1)*xdata + ...
    A(2)*(1-xdata))).^2) * psat(1) + (1-xdata).* exp(A(2)* ...
    (A(1)*xdata./(A(1)*xdata + A(2)*(1-xdata))).^2) * psat(2) - ydata;

%evaluate the A parameters by fitting the data to the described function
%first guess
x0 = [5,5];
options.Algorithm = 'levenberg-marquardt';
A = lsqnonlin(fun,x0,[],[],options);

%display A
disp(A);

%plot data
plot(xdata, ydata, '-or', xdata, fun(A)+ydata, '-b');
title('Curve Fitting');
xlabel('x1');
ylabel('p');
legend('data','curve fit');

