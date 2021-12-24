clc;
clear;

n = 768;
[x,c] = ReadDiabetes(n);

H_index = 1;   %H -> Healty
U_index = 1;   %U -> Unhealty
for i=1:n
    if(c(i) == 1)
        H(:,H_index) = x(:,i);
        H_index = H_index + 1;
    elseif (c(i) == 2)
        U(:,U_index) = x(:,i);
        U_index = U_index + 1;
    end
end

Lr = 0.1;
MaxRep = 1000;
[Rc, Rep, w] = HoKa(H,U,Lr,MaxRep);
w;

Cerror = 1 - ((Rc(1) + Rc(2)) / n);

index = 1;
for i=0.05:0.05:1
    position(index) = i;
    [Rc, Rep, w, i] = HoKa(H,U,i,MaxRep);
    correct_table(index) = i;
    index = index + 1;
end
plot(position, correct_table)


