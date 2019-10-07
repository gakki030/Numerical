n=100;
[a,b]=sparsesetup(n);
x1=(rand(1,n))';
[x1,cout1]=seidel(a,b)



function [a,b] = sparsesetup(n)
e = ones(n,1);
n2=n/2;
a = spdiags([e 2*e e],-1:1,n,n);    % Entries of a
b=zeros(n,1);                         % Entries of r.h.s. b
b(1)=1;b(n)=-1;
end
function [x,cout]=seidel(A,b)

D=diag(diag(A));
L = -tril(A,-1);%求A的下三角矩阵,不带对角线
U = -triu(A,1);%求A的上三角矩阵
G = (D-L)\U;
f = (D-L)\b;
x0=(rand(1,size(A,1)))';
x = G*x0+f;
cout=0;  %迭代次数
t=ones(1,size(A,1));
 t(2:2:size(A,1))=-1;
 t=t';
while 1
    x0 = x;
    x = G*x0+f;
    cout = cout+1;
 if (norm(x-x0,inf)<10e-3)&&(norm(x-t,inf)<10e-3)
    break
 end
end

end
