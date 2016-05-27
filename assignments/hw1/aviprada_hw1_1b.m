%Name: Aditya Vipradas
%ASURITE User ID: aviprada
%ASU ID: 1209435588
%Homework 1 Problem 1.b

%Define nonlinear constraints in nconstraints.m file
function [c, ceq] = nconstraints(x)
    c = -1 * (12*x(1) + 11.9*x(2) + 41.8*x(3) + 52.1*x(4) - 21 - 1.645 ...
        *(0.28*x(1)^2 + 0.19*x(2)^2 + 20.5*x(3)^2 + 0.62*x(4)^2)^(1/2));
    ceq = [];
end

%clear screen
clc;

%Define the objective function
fun2 = @(x)24.55*x(1) + 26.75*x(2) + 39.00*x(3) + 40.50*x(4);

%Define the initial guess
x0 = [1 1 1 1];

%Define the equality constraints
Aeq = [1 1 1 1];
beq = [1];
%Define the inequality constraints
A = [-2.3 -5.6 -11.1 -1.3];
b = [-5];

%Define lower and upper bounds
lb = [0 0 0 0];
ub = [];

nonlcon = @nconstraints;
x = fmincon(fun2, x0, A, b, Aeq, beq, lb, ub, nonlcon);
fx = 24.55*x(1) + 26.75*x(2) + 39.00*x(3) + 40.50*x(4);

str1 = sprintf('The function minimizes at \n x1 = %0.5f',x(1));
str2 = sprintf('x2 = %0.5f \n x3 = %0.5f \n x4 = %0.5f',x(2),x(3),x(4));
disp(str1);
disp(str2);
str3 = sprintf('\n The minimum function value is %0.5f',fx);
disp(str3);


