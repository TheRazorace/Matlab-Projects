function a = NoGreatValMat( b,v )
a = 0 ;
[r,c] = size(b);
for i=1:r
  for j = 1:c
     if ( b(i,j) >= v )
        a = a + 1 ;
     end
  end
end
