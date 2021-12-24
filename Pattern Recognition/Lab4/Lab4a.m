clc;
clear all;

total = 345;
[x,c] = ReadLiver(total);

H_index = 1;   %H -> Healty
U_index = 1;   %U -> Unhealty
for i=1:total
    if(c(i) == 1)
        H(:,H_index) = x(:,i);
        H_index = H_index + 1;
    elseif (c(i) == 2)
        U(:,U_index) = x(:,i);
        U_index = U_index + 1;
    end
end

[Rc,Rep,j] = Perceptron(H,U,0.001,10000);

error = 1 - ((Rc(1) + Rc(2))/total);

max_rep = 10000;
index = 1;
for i=0.05:0.05:1
    position(index) = i;
    [Rc,Rep,Weights] = Perceptron(H,U,i,max_rep);
    correct_table(index) =((Rc(1) + Rc(2))/total);
    index = index + 1;
end
plot(position, correct_table)


