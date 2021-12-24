n = 351;
[x,c] = ReadIonosphere(n);
prots = 3;
%%[Rc,Ru,Prot] = ClassKMDistEucl(x,c,prots);

bad_counter = 0;
good_counter = 0;
for i=1:n;
    if(c(i)==1);
        bad_counter = bad_counter + 1;
    else
        good_counter = good_counter + 1;
    end
end

bad_array = zeros(34, bad_counter);
good_array = zeros(34, good_counter);

bad_index = 1;
good_index = 1;
for i=1:n;
    if(c(i)==1);
        for j=1:34;
            bad_array(j, bad_index) = x(j, i);
        end
        bad_index = bad_index + 1;
    else
        for j=1:34;
            good_array(j, good_index) = x(j, i);   
        end
        good_index = good_index + 1;
    end
end










