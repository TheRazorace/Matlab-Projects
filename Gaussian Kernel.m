clc;
clear all;

n = 1000;       %αριθμός υλοποιήσεων
x = rand(n,1);  %δημιουργία διανύσματος ομοιόμορφης κατανομής με μήκος ίσο με τις υλοποιήσεις
h = 0.1;          %συντελεστής h του kernel

f = zeros(3000,1);  %αρχικοποίηση του διανύσματος f μήκους 3*1000 για 0.001 για το x
position = zeros(3000,1); %αρχικοποίηση του διανύσματος position (το x της f(x)) μήκους 3*1000 για βήμα 0.001

index = 1;
for i=-1:0.001:1.999                         %βρόγχος για κάθε i από -1 εώς 2 με βήμα 0.01
    f(index) = 0;                            %αρχικοποίηση της f(i) = 0
    position(index) = i;                      %αποθήκευση x στο διάνυσμα position
    for j = 1:n                                            
        f(index) = f(index) + gaussian_kernel(i-x(j),h); %υπολογισμός προσέγγισης f(x)
    end
    f(index) = f(index) / n;    %διαίρεση της προσέγγισης με τον αριθμό υλοποιήσεων 
    index = index + 1;          %αύξηση index κατά 1 για το επόμενο στοιχείο
end

%plot και σύγκριση με την uniform 
plot(position,f, 'b', position, pdf(makedist('Uniform'),position), 'r')  

%συνάρτηση υπολογισμού gaussian kernel
function val = gaussian_kernel(x,h)              
    val = (1/sqrt((2*pi*h))) * exp(-(x.^2)/(2*h));
end

