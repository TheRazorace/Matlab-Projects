clc 
clear all

data_file = fopen('data.dat', 'r');
DATA = fscanf(data_file, '%d ',40);
fclose(data_file);
data_counter = 1;
A(5,8) = zeros;
for i = 1:5
    for j = 1:2
        A(i,j) = DATA(data_counter);
        data_counter = data_counter + 1;
    end
end

for i = 1:5
    for j = 3:4
        A(i,j) = DATA(data_counter);
        data_counter = data_counter + 1;
    end
end

for i = 1:5
    for j = 5:6
        A(i,j) = DATA(data_counter);
        data_counter = data_counter + 1;
    end
end

for i = 1:5
    for j = 7:8
        A(i,j) = DATA(data_counter);
        data_counter = data_counter + 1;
    end
end

cat1x(5) = zeros;
cat1y(5) = zeros;
cat2x(5) = zeros;
cat2y(5) = zeros;
cat3x(5) = zeros;
cat3y(5) = zeros;
cat4x(5) = zeros;
cat4y(5) = zeros;

for i = 1:5
    cat1x(i) = A(i,1);
    cat1y(i) = A(i,2);
    cat2x(i) = A(i,3);
    cat2y(i) = A(i,4);
    cat3x(i) = A(i,5);
    cat3y(i) = A(i,6);
    cat4x(i) = A(i,7);
    cat4y(i) = A(i,8);
end

t = -10:0.05:10;
f = 2*t;
plot(cat3x, cat3y,'o', cat4x, cat4y,'o', t, f)
title('Kατηγορίες 3-4');
axis([-10 10 -10 10]);
grid on;


