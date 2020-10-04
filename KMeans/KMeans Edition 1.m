clc; 
clear all;

%Φόρτωση δεδομένων
all_data = load("hw3-1data.mat");

%Διαχωρισμός δεδομένων του άξονα x και του άξονα y
data_x = all_data.X(1,:);
data_y = all_data.X(2,:);
data = all_data.X;

%Δημιουργία των πραγματικών ομάδων βάσει της μυστικής πληροφορίας για την
%σύγκριση στο τέλος
for i=1:100
    true_team1_x(i) = data_x(i);
    true_team1_y(i) = data_y(i);
    true_team2_x(i) = data_x(i+100);
    true_team2_y(i) = data_y(i+100);
end

%Αλγόριθμος K-Means
%1. Επιλογή τυχαίων αντιπροσώπων. 
%x στο [-8,6] και y στο [-5,4]
z1x = -8 + (6+8)*rand();
z2x = -8 + (6+8)*rand();
z1y = -5 + (4+5)*rand();
z2y = -5 + (4+5)*rand();


iterations = 0;
while 1
    %2. Δημιουργία ομάδων team1, team2, βάσει της απόστασης από τους
    %αντιπροσώπους
    clearvars team1_x team1_y team2_x team2_y
    team1_index = 1;
    team2_index = 1;
    for i=1:200
       if(euclidian_distance(data_x(i), data_y(i), z1x, z1y) < euclidian_distance(data_x(i), data_y(i), z2x, z2y))
           team1_x(team1_index) = data_x(i);
           team1_y(team1_index) = data_y(i);
           team1_index = team1_index + 1;
       else
          team2_x(team2_index) = data_x(i);
          team2_y(team2_index) = data_y(i);
          team2_index = team2_index + 1;
       end
    
    end

    %3. Δημιουργία νέων αντιπροσώπων χρησιμοποιώντας τον μέσο όρο των
    %σημείων κάθε ομάδας
    [row1, team1_size] = size(team1_x);
    [row2, team2_size] = size(team2_x);

    sumx = 0;
    sumy = 0;
    for i=1:team1_size
        sumx = sumx + team1_x(i);
        sumy = sumy + team1_y(i);
    end
    z1x_new = sumx/team1_size;
    z1y_new = sumy/team1_size;

    sumx = 0;
    sumy = 0;
    for i=1:team2_size
        sumx = sumx + team2_x(i);
        sumy = sumy + team2_y(i);
    end
    z2x_new = sumx/team2_size;
    z2y_new = sumy/team2_size;

    %4. Έλεγχος για σύγκλιση, αλλιώς επανάληψη
    if(abs(z1x_new-z1x)<0.00001 && abs(z1y_new-z1y)<0.00001 && abs(z2x_new-z2x)<0.00001 && abs(z2y_new-z2y)<0.00001)
        break
    else
        z1x = z1x_new;
        z1y = z1y_new;
        z2x = z2x_new;
        z2y = z2y_new;
        iterations = iterations + 1;
    end
end

%Σύγκριση κοινών σημείων με την πραγματική ομάδα 1 
team1_success = 0;
team2_success = 0;
for i=1:100
    for j=1:team1_size
        if(true_team1_x(i) == team1_x(j) && true_team1_y(i) == team1_y(j))
            team1_success = team1_success + 1;
        end
    end
    
    for k=1:team2_size
        if(true_team2_x(i) == team2_x(k) && true_team2_y(i) == team2_y(k))
            team2_success = team2_success + 1;
        end
    end
end

success1 = team1_success + team2_success;

%Σύγκριση κοινών σημείων με την πραγματική ομάδα 2
team1_success = 0;
team2_success = 0;
for i=1:100
    for j=1:team1_size
        if(true_team2_x(i) == team1_x(j) && true_team2_y(i) == team1_y(j))
            team1_success = team1_success + 1;
        end
    end
    
    for k=1:team2_size
        if(true_team1_x(i) == team2_x(k) && true_team1_y(i) == team2_y(k))
            team2_success = team2_success + 1;
        end
    end
end

success2 = team1_success + team2_success;

%Αποθήκευση της μεγαλύτερης επιτυχίας για να γίνει σωστά η αντιστοιχία των
%ομάδων και υπολογισμός σφάλματος
success = max(success1, success2);
error = (200 - success)/200
%iterations

%Γραφήματα
figure(1)
plot(true_team1_x, true_team1_y, '.', true_team2_x, true_team2_y, '.');
title('Πραγματική ομαδοποίηση (μυστική πληροφορία)');
figure(2)
plot(team1_x, team1_y, '.', team2_x, team2_y, '.');
title('Υπολογισμένη ομαδοποίηση');

if success1> success2
    figure(3)
    plot(true_team1_x, true_team1_y, '.b', true_team2_x, true_team2_y,...
        '.r', team1_x, team1_y, 'ob', team2_x, team2_y, 'or');
    title('Σύγκριση');


else
    figure(3)
    plot(true_team1_x, true_team1_y, '.b', true_team2_x, true_team2_y,...
        '.r', team2_x, team2_y, 'ob', team1_x, team1_y, 'or');
    title('Σύγκριση');
end

%Συνάρτηση υπολογισμού ευκλείδειας απόστασης
function dis = euclidian_distance(x1, y1, x2, y2)
    dis = sqrt((x1-x2)^2 + (y1-y2)^2);
end



