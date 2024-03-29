n=4;
[a,b]=sparsesetup(n);
[x,cout]=jacobi(a,b)
[x1,cout2]=Prejacobi(a,b)
back_error=norm(b-a*x,inf)

function [a,b] = sparsesetup(n)
e = ones(n,1);
n2=n/2;
a = spdiags([e 2*e e],-1:1,n,n);    % Entries of a
b=zeros(n,1);                         % Entries of r.h.s. b
b(1)=1;b(n)=-1;
end


function [x2,cout]=jacobi(A,c)

D=diag(diag(A));
U=D-triu(A);
L=-tril(A,-1);
x1=(rand(1,size(A,1)))';
cout=0;
while 1
 cout=cout+1;
 x2=inv(D)*(U+L)*x1+inv(D)*c;
 t=ones(1,size(A,1));
 t(2:2:size(A,1))=-1;
 t=t';
 t1=x2-x1;
 t2=x2-t;
 if (norm(t1,inf)<10e-3)&&(norm(t2,inf)<10e-3)
 break
end
 x1=x2;
end

end
function [x2,cout]=Prejacobi(A,c)

D=diag(diag(A));
A=D\A;
c=D\c;
U=D-triu(A);
L=-tril(A,-1);
x1=(rand(1,size(A,1)))';
cout=0;
while 1
 cout=cout+1;
 x2=inv(D)*(U+L)*x1+inv(D)*c;
 t=ones(1,size(A,1));
 t(2:2:size(A,1))=-1;
 t=t';
 t1=x2-x1;
 t2=x2-t;
 if (norm(t1,inf)<10e-3)&&(norm(t2,inf)<10e-3)
 break
end
 x1=x2;
end

end



