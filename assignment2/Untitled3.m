A=[1,2;3,1];
b=[5,5];
x=jokebi(A,b);


function x2=jokebi(B,c)

D=diag(diag(B));
U=D-triu(B);
L=D-(triu(B))';
x1=(rand(1,size(B,1)))';
while 1
 x2=inv(D)*(U+L)*x1+inv(D)*c';
 t=x2-x1;
 if norm(t,inf)<10e-6&&norm(t,1)<10e-6&&norm(t,2)<10e-6
 break
end
 x1=x2;
end

end



