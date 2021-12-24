function [Rc,Rep,j] = Perceptron(x1,x2,Lr,MaxRep)
%#
%#  [Rc,Rep] = Perceptron(x,c,Lr)
%#
%#  Input
%#      x1: Pattern Vectors for the first class
%#      x2: Pattern Vectors for the second class
%#      Lr: Learning rate
%#      MaxRep: Maximum repetitions
%#  Output
%#      Rc: Correct classification rate using the C-method
%#      Rep: Pattern vectors on each class
%#


NumOfP1 = columns(x1) ;
NumOfP2 = columns(x2) ;
[x1_rows, x1_col] = size(x1);
[x2_rows, x2_col] = size(x2);
Weights = 2 * rand(x1_rows+1,1) - 1 ;
Rep = [NumOfP1,NumOfP2] ;
TotPat = sum(Rep) ;
Rc = zeros(2,1) ;
if ( x1_rows ~= x2_rows )
	printf( 'Error in vectors x1, x2\n' ) ;
end

%#
%#  C-Error
%#

for j = 1:MaxRep
	if ( rand() > 0.5 )
		k = floor(rand() * NumOfP1 + 1) ; 
		Pat = [x1(:,k);1] ;
		Score = Weights' * Pat ;
		if ( Score < 0 )
			Weights = Weights + Lr * Pat ;
		end
	else
      k = floor(rand() * NumOfP2 + 1) ;
      Pat = [x2(:,k);1] ;
      Score = Weights' * Pat ;
      if ( Score >= 0 )
         Weights = Weights - Lr * Pat ;
      end
	end
	Rc = zeros(2,1) ;
	for i=1:NumOfP1
		if ( Weights' * [x1(:,i);1] >= 0 )
			Rc(1) = Rc(1) + 1 ;
		end
	end
   for i=1:NumOfP2
      if ( Weights' * [x2(:,i);1] < 0 )
         Rc(2) = Rc(2) + 1 ;
      end
   end
    
    %disp(sprintf( '%8d', sum(Rc) )) ;
    %drawnow('update');
	if ( sum(Rc) == TotPat )
		break ;
	end
end

