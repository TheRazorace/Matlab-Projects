clc;
clear all;

A = [ 1 1 1; 2 2 2; 1 1 1];
B = [2 23 1; 4 6 3; 6 -26 5];

E = (A*B') * A' + B - A * B;
F = (A .* B) + 3 * B;

A = [1 2 3 -9 5 6; 2 2 3 5 2 7; 1 4 1 3 1 1]
A = inv(A'*A)*A'