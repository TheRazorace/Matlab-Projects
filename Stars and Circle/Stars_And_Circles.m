clc; 
clear all;

data = load("hw2-2data.mat");      %φόρτωση αρχείου δεδομένων

%χωρισμός περιεχομένων σε διανύσματα (συντεταγμένων x,y)
circles_x = data.circles(:,1).';
circles_y = data.circles(:,2).';
stars_x = data.stars(:,1).';
stars_y = data.stars(:,2).';

%ρύθμιση παραμέτρων h, λ
h = 0.01;
l = 0.1;

%δημιουργία πίνακα Α_ij = Κ(x_i,x_j) διαστάσεων 42Χ42
A = zeros(42,42);
%kernel(circles,circles)
for i=1:21
    for j=1:21
        A(i,j) = gaussian_kernel(circles_x(i), circles_y(i), circles_x(j), circles_y(j), h);
    end
end

%kernel(circles,stars)
for i=1:21
    for j=22:42
        A(i,j) = gaussian_kernel(circles_x(i), circles_y(i), stars_x(j - 21), stars_y(j - 21), h);
    end
end

%kernel(stars,circles)
for i=22:42
    for j=1:21
        A(i,j) = gaussian_kernel(stars_x(i - 21), stars_y(i - 21), circles_x(j), circles_y(j), h);
    end
end

%kernel(stars,stars)
for i=22:42
    for j=22:42
        A(i,j) = gaussian_kernel(stars_x(i-21), stars_y(i-21), stars_x(j-21), stars_y(j-21), h);
    end
end

%δημιουργία διανύσματος των labels μεγέθους 42 
%21 τιμές = -1, 21 τιμές = 1
y = zeros(1,42);
for i=1:21
    y(i) = -1;
end
for i=22:42
    y(i) = 1;
end

%υπολογισμός όλων 42 των συντελεστών
syn = inv(A'*A + l*A) *A*y';

%διαχωρισμός συντελεστών σε 2 διανύσματα α, β
%κάθε διάνυσμα έχει μέγεθος 21
a = zeros(21,1);
b = zeros(21,1);
for i=1:21
    b(i) = syn(i);
end
for i=22:42
    a(i-21) = syn(i);
end
a
b

star_classes = zeros(21,1);
for j=1:21
    star_classes(j) = f(stars_x(j), stars_y(j), a, b, stars_x, stars_y, circles_x, circles_y, h);
end
star_classes

circle_classes = zeros(21,1);
for j=1:21
    circle_classes(j) = f(circles_x(j), circles_y(j), a, b, stars_x, stars_y, circles_x, circles_y, h);
end
circle_classes

%υπολογισμός classifier συνάρτησης
index = 1;
step = 0.001;
for i=-1.2:step:1.2
    for j=-0.3:step:1.4
        if(f(i,j, a, b, stars_x, stars_y, circles_x, circles_y, h) * f(i + step, j, a, b, stars_x, stars_y, circles_x, circles_y, h) < 0)
            classifier_x(index) = i + step/2;
            classifier_y(index) = j;
            index = index + 1;
        end
    end
end

%plot του classifier και των δεδομένων
plot(classifier_x, classifier_y, '.', circles_x, circles_y.', 'o', stars_x, stars_y, '*');
axis([-1.2 1.2 -0.3 1.4])

%συνάρτηση υπολογισμού της φ(Χ)
function class = f(x1, y1, a, b, stars_x, stars_y, circles_x, circles_y, h)
    class = 0;
    for i=1:21
        class = class + (a(i)*gaussian_kernel(x1, y1, stars_x(i), stars_y(i), h));    
        class = class + (b(i)*gaussian_kernel(x1, y1, circles_x(i), circles_y(i), h));
    end
end

%συνάρτηση υπολογισμού του kernel
function val = gaussian_kernel(x1, y1, x2, y2, h)
    val = exp(-(((x1-x2).^2) + ((y1 - y2).^2))/(h));
end


