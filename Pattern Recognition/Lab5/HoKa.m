function [Rc,Rep,w, i ] = HoKa(x1,x2,Lr,MaxRep)
%#
%#  [Rc,Rep] = HoKa(x1,x2,Lr,MaxRep)
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

[x1_rows, x1_cols] = size(x1);
[x2_rows, x2_cols] = size(x2);
NumOfP1 = x1_cols ;
x1 = [x1;ones(1,NumOfP1)] ;
NumOfP2 = x2_cols ;
x2 = [x2;ones(1,NumOfP2)] ;
Rep = [NumOfP1,NumOfP2] ;
TotPat = sum(Rep) ;
Rc = zeros(2,1) ;

if ( x1_rows ~= x2_rows )
	printf( 'Error in vectors x1, x2\n' ) ;
end

z = [x1,-x2]'; 

[z_rows, z_cols] = size(z);
Nv = z_cols ;
Np = z_rows ;
b = 0.1 * rand( Np, 1 ) ;
piz = inv( z' * z ) * z' ;
w = piz * b ;
b1 = z * w ; 
e = b1 - b ;
i = 0 ;
while( i < MaxRep )
  %printf( 'Step %d\n', i ) ;
  [b1_rows, b1_cols] = size(b1);
  %printf( 'Classification Score: %7.4f%%\n', ( 100 * NoGreatValMat( b1, 0.0 ) ) / ( b1_rows * b1_cols) ) ;
  if ( GreatValMat(b1,0.0) == 1 )
     %printf( 'Linear Separation of classes in %d repetitions\n', i ) ;
     Rc = Rep ;
     return ;
  end
  ea = AbsMat(e) ;
  b = b + Lr * ( e + ea ) ;
  w = piz * b ;
  b1 = z * w ;
  e = b1 - b ;
  i = i+1 ;
end
 %display(sprintf( 'Original Ho-Kasyap not convergence in %d repetitions\n', i )) ;
 [b1_rows, b1_cols] = size(b1);
 %display(sprintf( 'Classification Score: %7.4f%%\n', ( 100 * NoGreatValMat( b1, 0.0 ) ) / ( b1_rows * b1_cols) )) ;
Rc(1) = NoGreatValMat( b1(1:NumOfP1), 0.0 )  ;
Rc(2) = NoGreatValMat( b1(NumOfP1+1:TotPat), 0.0 )  ;
