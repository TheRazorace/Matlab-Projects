clc;
clear all;

n = 1000;       %������� �����������
x = rand(n,1);  %���������� ����������� ����������� ��������� �� ����� ��� �� ��� �����������
h = 0.1;          %����������� h ��� kernel

f = zeros(3000,1);  %������������ ��� ����������� f ������ 3*1000 ��� 0.001 ��� �� x
position = zeros(3000,1); %������������ ��� ����������� position (�� x ��� f(x)) ������ 3*1000 ��� ���� 0.001

index = 1;
for i=-1:0.001:1.999                         %������� ��� ���� i ��� -1 ��� 2 �� ���� 0.01
    f(index) = 0;                            %������������ ��� f(i) = 0
    position(index) = i;                      %���������� x ��� �������� position
    for j = 1:n                                            
        f(index) = f(index) + gaussian_kernel(i-x(j),h); %����������� ����������� f(x)
    end
    f(index) = f(index) / n;    %�������� ��� ����������� �� ��� ������ ����������� 
    index = index + 1;          %������ index ���� 1 ��� �� ������� ��������
end

%plot ��� �������� �� ��� uniform 
plot(position,f, 'b', position, pdf(makedist('Uniform'),position), 'r')  

%��������� ����������� gaussian kernel
function val = gaussian_kernel(x,h)              
    val = (1/sqrt((2*pi*h))) * exp(-(x.^2)/(2*h));
end

