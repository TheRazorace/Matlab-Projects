function Rc_best = BestCError(x,c,KN,best)
%#
%#  [Rc,Ru,Rep] = ClassKMDistEucl(x,c,KN)
%#  Pattern Recognition: 
%#      Distance measure:      Euclidian
%#      Prototypes:            K-prototypes K-MEANS
%#      Classification rule:   Minimum Distance
%#
%#  Input
%#      x: Pattern Vectors
%#      c: Classes
%#      KN: Number of protpotypes
%#      best: Table of prototypes
%#  Output
%#      Rc: Correct classification rate using the C-method
%#

NumOfClass = max(c) ;
NumOfPatterns = columns(x) ;
Rep = zeros(NumOfClass,1) ;

%#
%#  C-Error
%#

for j = 1:NumOfPatterns
	k = c(j) ;
	Rep(k) = Rep(k) + 1 ;
end

NoProt = columns(best) ;

Rc_best = zeros(NumOfClass,1) ;
for i = 1:NumOfPatterns
    for j = 1:NoProt
        Dist_best(j) = (x(:,i) - best(:,j))' * ( x(:,i) - best(:,j) ) ;
    end
    Rec_best = ceil(ArgMin(Dist_best)/KN) ;
    if (Rec_best == c(i))
       Rc_best(Rec_best) = Rc_best(Rec_best) + 1 ;
    end
end

