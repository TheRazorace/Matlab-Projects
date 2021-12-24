clc;
clear all;

[x,c] = ReadGlass(214);
[Rc,Ru,Rep, Mean] = ClassMinDistEuclOne(x,c);

disp("Βέλτιστα εικονικά πρωτότυπα")

for i=1:7
    disp(" ")
    disp(sprintf("Κατηγορία %d", i))
    disp(sprintf("Βαθμός διάθλασης: %.6f", Mean(1,i)))
    disp(sprintf("Περιεκτικότητα σε Na: %.6f", Mean(2,i)))
    disp(sprintf("Περιεκτικότητα σε Μg: %.6f", Mean(3,i)))
    disp(sprintf("Περιεκτικότητα σε Al: %.6f", Mean(4,i)))
    disp(sprintf("Περιεκτικότητα σε Si: %.6f", Mean(5,i)))
    disp(sprintf("Περιεκτικότητα σε K: %.6f", Mean(6,i)))
    disp(sprintf("Περιεκτικότητα σε Ca: %.6f", Mean(7,i)))
    disp(sprintf("Περιεκτικότητα σε Ba: %.6f", Mean(8,i)))
    disp(sprintf("Περιεκτικότητα σε Fe: %.6f", Mean(9,i)))
end
    
