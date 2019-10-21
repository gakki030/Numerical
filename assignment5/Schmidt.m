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
