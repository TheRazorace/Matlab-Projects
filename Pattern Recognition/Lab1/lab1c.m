x = 0:0.05:2;
f = tan(1 + exp(x.^2));
g = x.^3 + sin(x.^2)+5;
plot (x,f,x,g);
