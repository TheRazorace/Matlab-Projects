clc;
clear all;

[x,c] = ReadGlass(214);


cat1_index = 1;
cat2_index = 1;
cat3_index = 1;
cat4_index = 1;
cat5_index = 1;
cat6_index = 1;
cat7_index = 1;
for i=1:columns(c)
    if c(i) == 1;
        cat1_1(cat1_index) = x(1,i);
        cat1_2(cat1_index) = x(2,i);
        cat1_3(cat1_index) = x(3,i);
        cat1_4(cat1_index) = x(4,i);
        cat1_5(cat1_index) = x(5,i);
        cat1_6(cat1_index) = x(6,i);
        cat1_7(cat1_index) = x(7,i);
        cat1_8(cat1_index) = x(8,i);
        cat1_9(cat1_index) = x(9,i);
        cat1_index = cat1_index + 1;
    
    elseif c(i) == 2;
        cat2_1(cat2_index) = x(1,i);
        cat2_2(cat2_index) = x(2,i);
        cat2_3(cat2_index) = x(3,i);
        cat2_4(cat2_index) = x(4,i);
        cat2_5(cat2_index) = x(5,i);
        cat2_6(cat2_index) = x(6,i);
        cat2_7(cat2_index) = x(7,i);
        cat2_8(cat2_index) = x(8,i);
        cat2_9(cat2_index) = x(9,i);
        cat2_index = cat2_index + 1;
    
    elseif c(i) == 3;
        cat3_1(cat3_index) = x(1,i);
        cat3_2(cat3_index) = x(2,i);
        cat3_3(cat3_index) = x(3,i);
        cat3_4(cat3_index) = x(4,i);
        cat3_5(cat3_index) = x(5,i);
        cat3_6(cat3_index) = x(6,i);
        cat3_7(cat3_index) = x(7,i);
        cat3_8(cat3_index) = x(8,i);
        cat3_9(cat3_index) = x(9,i);
        cat3_index = cat3_index + 1;
        
    elseif c(i) == 4;
        cat4_1(cat4_index) = x(1,i);
        cat4_2(cat4_index) = x(2,i);
        cat4_3(cat4_index) = x(3,i);
        cat4_4(cat4_index) = x(4,i);
        cat4_5(cat4_index) = x(5,i);
        cat4_6(cat4_index) = x(6,i);
        cat4_7(cat4_index) = x(7,i);
        cat4_8(cat4_index) = x(8,i);
        cat4_9(cat4_index) = x(9,i);
        cat4_index = cat4_index + 1;
        
    elseif c(i) == 5;
        cat5_1(cat5_index) = x(1,i);
        cat5_2(cat5_index) = x(2,i);
        cat5_3(cat5_index) = x(3,i);
        cat5_4(cat5_index) = x(4,i);
        cat5_5(cat5_index) = x(5,i);
        cat5_6(cat5_index) = x(6,i);
        cat5_7(cat5_index) = x(7,i);
        cat5_8(cat5_index) = x(8,i);
        cat5_9(cat5_index) = x(9,i);
        cat5_index = cat5_index + 1;
        
     elseif c(i) == 6;
        cat6_1(cat6_index) = x(1,i);
        cat6_2(cat6_index) = x(2,i);
        cat6_3(cat6_index) = x(3,i);
        cat6_4(cat6_index) = x(4,i);
        cat6_5(cat6_index) = x(5,i);
        cat6_6(cat6_index) = x(6,i);
        cat6_7(cat6_index) = x(7,i);
        cat6_8(cat6_index) = x(8,i);
        cat6_9(cat6_index) = x(9,i);
        cat6_index = cat6_index + 1;
        
    else c(i) == 7;
        cat7_1(cat7_index) = x(1,i);
        cat7_2(cat7_index) = x(2,i);
        cat7_3(cat7_index) = x(3,i);
        cat7_4(cat7_index) = x(4,i);
        cat7_5(cat7_index) = x(5,i);
        cat7_6(cat7_index) = x(6,i);
        cat7_7(cat7_index) = x(7,i);
        cat7_8(cat7_index) = x(8,i);
        cat7_9(cat7_index) = x(9,i);
        cat7_index = cat7_index + 1;        
     
    end
end

dist1 = zeros(columns(cat1_1));
dist2 = zeros(columns(cat2_1));
dist3 = zeros(columns(cat3_1));
dist5 = zeros(columns(cat5_1));
dist6 = zeros(columns(cat6_1));
dist7 = zeros(columns(cat7_1));

sum = 0;
for i=1:columns(cat1_1)
    for j=1:columns(cat1_1)
        if i~=j;
            sum = sum + (cat1_1(i) - cat1_1(j))^2;
            sum = sum + (cat1_2(i) - cat1_2(j))^2;
            sum = sum + (cat1_3(i) - cat1_3(j))^2;
            sum = sum + (cat1_4(i) - cat1_4(j))^2;
            sum = sum + (cat1_5(i) - cat1_5(j))^2;
            sum = sum + (cat1_6(i) - cat1_6(j))^2;
            sum = sum + (cat1_7(i) - cat1_7(j))^2;
            sum = sum + (cat1_8(i) - cat1_8(j))^2;
            sum = sum + (cat1_9(i) - cat1_9(j))^2;
        end
    end
    dist1(i) = sum;
    sum = 0;
end

sum = 0;
for i=1:columns(cat2_1)
    for j=1:columns(cat2_1)
        if i~=j;
            sum = sum + (cat2_1(i) - cat2_1(j))^2;
            sum = sum + (cat2_2(i) - cat2_2(j))^2;
            sum = sum + (cat2_3(i) - cat2_3(j))^2;
            sum = sum + (cat2_4(i) - cat2_4(j))^2;
            sum = sum + (cat2_5(i) - cat2_5(j))^2;
            sum = sum + (cat2_6(i) - cat2_6(j))^2;
            sum = sum + (cat2_7(i) - cat2_7(j))^2;
            sum = sum + (cat2_8(i) - cat2_8(j))^2;
            sum = sum + (cat2_9(i) - cat2_9(j))^2;
        end
    end
    dist2(i) = sum;
    sum = 0;
end

sum = 0;
for i=1:columns(cat3_1)
    for j=1:columns(cat3_1)
        if i~=j;
            sum = sum + (cat3_1(i) - cat3_1(j))^2;
            sum = sum + (cat3_2(i) - cat3_2(j))^2;
            sum = sum + (cat3_3(i) - cat3_3(j))^2;
            sum = sum + (cat3_4(i) - cat3_4(j))^2;
            sum = sum + (cat3_5(i) - cat3_5(j))^2;
            sum = sum + (cat3_6(i) - cat3_6(j))^2;
            sum = sum + (cat3_7(i) - cat3_7(j))^2;
            sum = sum + (cat3_8(i) - cat3_8(j))^2;
            sum = sum + (cat3_9(i) - cat3_9(j))^2;
        end
    end
    dist3(i) = sum;
    sum = 0;
end

sum = 0;
for i=1:columns(cat5_1)
    for j=1:columns(cat5_1)
        if i~=j;
            sum = sum + (cat5_1(i) - cat5_1(j))^2;
            sum = sum + (cat5_2(i) - cat5_2(j))^2;
            sum = sum + (cat5_3(i) - cat5_3(j))^2;
            sum = sum + (cat5_4(i) - cat5_4(j))^2;
            sum = sum + (cat5_5(i) - cat5_5(j))^2;
            sum = sum + (cat5_6(i) - cat5_6(j))^2;
            sum = sum + (cat5_7(i) - cat5_7(j))^2;
            sum = sum + (cat5_8(i) - cat5_8(j))^2;
            sum = sum + (cat5_9(i) - cat5_9(j))^2;
        end
    end
    dist5(i) = sum;
    sum = 0;
end

sum = 0;
for i=1:columns(cat6_1)
    for j=1:columns(cat6_1)
        if i~=j;
            sum = sum + (cat6_1(i) - cat6_1(j))^2;
            sum = sum + (cat6_2(i) - cat6_2(j))^2;
            sum = sum + (cat6_3(i) - cat6_3(j))^2;
            sum = sum + (cat6_4(i) - cat6_4(j))^2;
            sum = sum + (cat6_5(i) - cat6_5(j))^2;
            sum = sum + (cat6_6(i) - cat6_6(j))^2;
            sum = sum + (cat6_7(i) - cat6_7(j))^2;
            sum = sum + (cat6_8(i) - cat6_8(j))^2;
            sum = sum + (cat6_9(i) - cat6_9(j))^2;
        end
    end
    dist6(i) = sum;
    sum = 0;
end

sum = 0;
for i=1:columns(cat7_1)
    for j=1:columns(cat7_1)
        if i~=j;
            sum = sum + (cat7_1(i) - cat7_1(j))^2;
            sum = sum + (cat7_2(i) - cat7_2(j))^2;
            sum = sum + (cat7_3(i) - cat7_3(j))^2;
            sum = sum + (cat7_4(i) - cat7_4(j))^2;
            sum = sum + (cat7_5(i) - cat7_5(j))^2;
            sum = sum + (cat7_6(i) - cat7_6(j))^2;
            sum = sum + (cat7_7(i) - cat7_7(j))^2;
            sum = sum + (cat7_8(i) - cat7_8(j))^2;
            sum = sum + (cat7_9(i) - cat7_9(j))^2;
        end
    end
    dist7(i) = sum;
    sum = 0;
end




disp("Παραδείγματα με μικρότερη αθροιστική απόσταση")
disp(" ")
disp("Κατηγορία 1")
disp(sprintf("Βαθμός διάθλασης: %.6f", cat1_1(ArgMin(dist1))))
disp(sprintf("Περιεκτικότητα σε Na.: %.6f", cat1_2(ArgMin(dist1))))
disp(sprintf("Περιεκτικότητα σε Μg.: %.6f", cat1_3(ArgMin(dist1))))
disp(sprintf("Περιεκτικότητα σε Al.: %.6f", cat1_4(ArgMin(dist1))))
disp(sprintf("Περιεκτικότητα σε Si.: %.6f", cat1_5(ArgMin(dist1))))
disp(sprintf("Περιεκτικότητα σε K.: %.6f", cat1_6(ArgMin(dist1))))
disp(sprintf("Περιεκτικότητα σε Ca.: %.6f", cat1_7(ArgMin(dist1))))
disp(sprintf("Περιεκτικότητα σε Ba.: %.6f", cat1_8(ArgMin(dist1))))
disp(sprintf("Περιεκτικότητα σε Fe.: %.6f", cat1_9(ArgMin(dist1))))

disp(" ")
disp("Κατηγορία 2")
disp(sprintf("Βαθμός διάθλασης: %.6f", cat2_1(ArgMin(dist2))))
disp(sprintf("Περιεκτικότητα σε Na: %.6f", cat2_2(ArgMin(dist2))))
disp(sprintf("Περιεκτικότητα σε Μg: %.6f", cat2_3(ArgMin(dist2))))
disp(sprintf("Περιεκτικότητα σε Al: %.6f", cat2_4(ArgMin(dist2))))
disp(sprintf("Περιεκτικότητα σε Si: %.6f", cat2_5(ArgMin(dist2))))
disp(sprintf("Περιεκτικότητα σε K: %.6f", cat2_6(ArgMin(dist2))))
disp(sprintf("Περιεκτικότητα σε Ca: %.6f", cat2_7(ArgMin(dist2))))
disp(sprintf("Περιεκτικότητα σε Ba: %.6f", cat2_8(ArgMin(dist2))))
disp(sprintf("Περιεκτικότητα σε Fe: %.6f", cat2_9(ArgMin(dist2))))

disp(" ")
disp("Κατηγορία 3")
disp(sprintf("Βαθμός διάθλασης: %.6f", cat3_1(ArgMin(dist3))))
disp(sprintf("Περιεκτικότητα σε Na: %.6f", cat3_2(ArgMin(dist3))))
disp(sprintf("Περιεκτικότητα σε Μg: %.6f", cat3_3(ArgMin(dist3))))
disp(sprintf("Περιεκτικότητα σε Al: %.6f", cat3_4(ArgMin(dist3))))
disp(sprintf("Περιεκτικότητα σε Si: %.6f", cat3_5(ArgMin(dist3))))
disp(sprintf("Περιεκτικότητα σε K: %.6f", cat3_6(ArgMin(dist3))))
disp(sprintf("Περιεκτικότητα σε Ca: %.6f", cat3_7(ArgMin(dist3))))
disp(sprintf("Περιεκτικότητα σε Ba: %.6f", cat3_8(ArgMin(dist3))))
disp(sprintf("Περιεκτικότητα σε Fe: %.6f", cat3_9(ArgMin(dist3))))

disp(" ")
disp("Κατηγορία 4")
disp("Δεν υπάρχουν δείγματα")

disp(" ")
disp("Κατηγορία 5")
disp(sprintf("Βαθμός διάθλασης: %.6f", cat5_1(ArgMin(dist5))))
disp(sprintf("Περιεκτικότητα σε Na: %.6f", cat5_2(ArgMin(dist5))))
disp(sprintf("Περιεκτικότητα σε Μg: %.6f", cat5_3(ArgMin(dist5))))
disp(sprintf("Περιεκτικότητα σε Al: %.6f", cat5_4(ArgMin(dist5))))
disp(sprintf("Περιεκτικότητα σε Si: %.6f", cat5_5(ArgMin(dist5))))
disp(sprintf("Περιεκτικότητα σε K: %.6f", cat5_6(ArgMin(dist5))))
disp(sprintf("Περιεκτικότητα σε Ca: %.6f", cat5_7(ArgMin(dist5))))
disp(sprintf("Περιεκτικότητα σε Ba: %.6f", cat5_8(ArgMin(dist5))))
disp(sprintf("Περιεκτικότητα σε Fe: %.6f", cat5_9(ArgMin(dist5))))

disp(" ")
disp("Κατηγορία 6")
disp(sprintf("Βαθμός διάθλασης: %.6f", cat6_1(ArgMin(dist6))))
disp(sprintf("Περιεκτικότητα σε Na: %.6f", cat6_2(ArgMin(dist6))))
disp(sprintf("Περιεκτικότητα σε Μg: %.6f", cat6_3(ArgMin(dist6))))
disp(sprintf("Περιεκτικότητα σε Al: %.6f", cat6_4(ArgMin(dist6))))
disp(sprintf("Περιεκτικότητα σε Si: %.6f", cat6_5(ArgMin(dist6))))
disp(sprintf("Περιεκτικότητα σε K: %.6f", cat6_6(ArgMin(dist6))))
disp(sprintf("Περιεκτικότητα σε Ca: %.6f", cat6_7(ArgMin(dist6))))
disp(sprintf("Περιεκτικότητα σε Ba: %.6f", cat6_8(ArgMin(dist6))))
disp(sprintf("Περιεκτικότητα σε Fe: %.6f", cat6_9(ArgMin(dist6))))

disp(" ")
disp("Κατηγορία 7")
disp(sprintf("Βαθμός διάθλασης: %.6f", cat7_1(ArgMin(dist7))))
disp(sprintf("Περιεκτικότητα σε Na: %.6f", cat7_2(ArgMin(dist7))))
disp(sprintf("Περιεκτικότητα σε Μg: %.6f", cat7_3(ArgMin(dist7))))
disp(sprintf("Περιεκτικότητα σε Al: %.6f", cat7_4(ArgMin(dist7))))
disp(sprintf("Περιεκτικότητα σε Si: %.6f", cat7_5(ArgMin(dist7))))
disp(sprintf("Περιεκτικότητα σε K: %.6f", cat7_6(ArgMin(dist7))))
disp(sprintf("Περιεκτικότητα σε Ca: %.6f", cat7_7(ArgMin(dist7))))
disp(sprintf("Περιεκτικότητα σε Ba: %.6f", cat7_8(ArgMin(dist7))))
disp(sprintf("Περιεκτικότητα σε Fe: %.6f", cat7_9(ArgMin(dist7))))
        
        
    
