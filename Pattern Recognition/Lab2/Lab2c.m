clc;
clear all;

[x,c] = ReadGlass(214);
[Rc,Ru,Rep, Mean] = ClassMinDistEuclOne(x,c);

disp("�������� �������� ���������")

for i=1:7
    disp(" ")
    disp(sprintf("��������� %d", i))
    disp(sprintf("������ ���������: %.6f", Mean(1,i)))
    disp(sprintf("�������������� �� Na: %.6f", Mean(2,i)))
    disp(sprintf("�������������� �� �g: %.6f", Mean(3,i)))
    disp(sprintf("�������������� �� Al: %.6f", Mean(4,i)))
    disp(sprintf("�������������� �� Si: %.6f", Mean(5,i)))
    disp(sprintf("�������������� �� K: %.6f", Mean(6,i)))
    disp(sprintf("�������������� �� Ca: %.6f", Mean(7,i)))
    disp(sprintf("�������������� �� Ba: %.6f", Mean(8,i)))
    disp(sprintf("�������������� �� Fe: %.6f", Mean(9,i)))
end
    
