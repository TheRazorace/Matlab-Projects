n = 351;
[x,c] = ReadIonosphere(n);
prots = 3;
[Rc,Ru,Prot] = ClassKMDistEucl(x,c,prots);
bad_prots = zeros(34,3);
good_prots = zeros(34,3);
[rows, cols] = size(Prot);
for i=1:rows
    bad_prots(i,1)=Prot(i,1);
    bad_prots(i,2)=Prot(i,2);
    bad_prots(i,3)=Prot(i,3);
    good_prots(i,1) = Prot(i,1 + prots);
    good_prots(i,2) = Prot(i,2 + prots);
    good_prots(i,3) = Prot(i,3 + prots);
end

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

for i=1:bad_counter 
         bad_dist(i,1) = (bad_array(:,i) - bad_prots(:,1))' * ( bad_array(:,i) - bad_prots(:,1) ) ;
         bad_dist(i,2) = (bad_array(:,i) - bad_prots(:,2))' * ( bad_array(:,i) - bad_prots(:,2) ) ;
         bad_dist(i,3) = (bad_array(:,i) - bad_prots(:,3))' * ( bad_array(:,i) - bad_prots(:,3) ) ;
    
         bad_min_dist(i)=min(bad_dist(i,:)); 
end

bad_min1 = 10e7;
for i=1:bad_counter
    if bad_min1 > bad_min_dist(i)
        bad_min1 = bad_min_dist(i);
        bad_min1_pos = i;
    end
end

bad_min2 = 10e7;
for i=1:bad_counter
    if i~=bad_min1_pos
        if bad_min2 > bad_min_dist(i)
            bad_min2 = bad_min_dist(i);
            bad_min2_pos = i;
        end
    end
end
     
bad_min3 = 10e7;
for i=1:bad_counter
    if (i~=bad_min1_pos && i~=bad_min2_pos);
        if bad_min3 > bad_min_dist(i)
            bad_min3 = bad_min_dist(i);
            bad_min3_pos = i;
        end
    end
end

best_of_bad(:,1) = bad_array(:, bad_min1_pos);
best_of_bad(:,2)=bad_array(:, bad_min2_pos);
best_of_bad(:,3)=bad_array(:, bad_min3_pos);


for i=1:good_counter 
         good_dist(i,1) = (good_array(:,i) - good_prots(:,1))' * ( good_array(:,i) - good_prots(:,1) ) ;
         good_dist(i,2) = (good_array(:,i) - good_prots(:,2))' * ( good_array(:,i) - good_prots(:,2) ) ;
         good_dist(i,3) = (good_array(:,i) - good_prots(:,3))' * ( good_array(:,i) - good_prots(:,3) ) ;
    
         good_min_dist(i)=min(good_dist(i,:)); 
end

good_min1 = 10e7;
for i=1:good_counter
    if good_min1 > good_min_dist(i)
        good_min1 = good_min_dist(i);
        good_min1_pos = i;
    end
end

good_min2 = 10e7;
for i=1:good_counter
    if i~=good_min1_pos
        if good_min2 > good_min_dist(i)
            good_min2 = good_min_dist(i);
            good_min2_pos = i;
        end
    end
end
     
good_min3 = 10e7;
for i=1:good_counter
    if (i~=good_min1_pos && i~=good_min2_pos);
        if good_min3 > good_min_dist(i)
            good_min3 = good_min_dist(i);
            good_min3_pos = i;
        end
    end
end

best_of_good(:,1) = good_array(:, good_min1_pos);
best_of_good(:,2)=good_array(:, good_min2_pos);
best_of_good(:,3)=good_array(:, good_min3_pos);

for i=1:3
    best(:,i)=best_of_bad(:,i);
end
for i=4:6
    best(:,i)=best_of_good(:,i-3);   
end

Rc_new = BestCError(x,c,prots,best);
sorted_best = Rc_new(1,1)+ Rc_new(2,1);
Cerror_best = 1 - sorted_best/351



