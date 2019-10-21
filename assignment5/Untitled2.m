   	A=[4,0;3,1];
   	B=[1,2;1,1];
   	C=[2,1;1,-1;2,1];
   	D=[4,8,1;0,2,-2;3,6,7];
   	[q1,r1]=Schmidt(A)
   	[q11,r12]=qr(A,0)
   	
   	[q2,r2]=Schmidt(B)
   	[q22,r22]=qr(B,0)
   	
   	[q3,r3]=Schmidt(C)
   	[q33,r33]=qr(C,0)
   	
   	[q4,r4]=Schmidt(D)
   	[q44,r44]=qr(D,0)
   	
   	function [Q,R]=Schmidt(A)
   	[row,col] = size(A);  
   	R=zeros(row,col);
   	Q=zeros(row,row);
   	for j=1:col
   	y=A(:,j);
   	for i=1:j-1
   	R(i,j)=(Q(:,i))'*A(:,j);
   	y=y-R(i,j)*Q(:,i);
   	end
   	R(j,j)=norm(y,2);
   	Q(:,j)=y/R(j,j);
   	end
   	end