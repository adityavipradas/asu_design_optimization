%Name: Aditya Vipradas
%ASURITE User ID: aviprada
%ASU ID: 1209435588
%Homework 1 Problem 1.a
%clear screen
clc;

%Define the objective function
fun1 = @(x)(x(1)-x(2))^2 + (x(2)+x(3)-2)^2 + (x(4)-1)^2 + (x(5)-1)^2;

%Define the initial guess
x0 = [2 2 2 2 2];

%Define the equality constraints
Aeq = [1 3 0 0 0;0 0 1 1 -2;0 1 0 0 -1];
beq = [0; 0; 0];

%Define the inequality constraints
A = [];
b = [];

%Define the upper and lower bounds
lb = [-10 -10 -10 -10 -10];
ub = [10 10 10 10 10];

x = fmincon(fun1, x0, A, b, Aeq, beq, lb, ub);
fx = (x(1)-x(2))^2 + (x(2)+x(3)-2)^2 + (x(4)-1)^2 + (x(5)-1)^2;

str1 = sprintf('The function minimizes at \n x1 = %0.5f \n x2 = %0.5f \n x3 = %0.5f \n x4 = %0.5f \n x5 = %0.5f', x(1),x(2),x(3), x(4), x(5));
disp(str1);
str2 = sprintf('\n The minimum function value is %0.5f',fx);
disp(str2);

