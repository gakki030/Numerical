n=1000;
[a,b]=matrixetup(n);
spy(a)
[x1,r1,cout1]=CorGrant(a,b)
[x2,cout2]=PreSeidel(a,b)


function [a,b] = matrixetup(n)
v=(1:1:n);
a=diag(v);
for i=1:n-2
    a(i,i+1)=1/2;a(i+1,i)=1/2;
    a(i,i+2)=1/2;a(i+2,i)=1/2;
end
xe=ones(n,1);                         
b=a*xe;
end
function [ x, r, cout ] = CorGrant(A, b )
    x0=(rand(1,size(A,1)))';
    x = x0;
    r = b - A * x0;
    d = r;
    X = ones(length(x), 1);
    cout = 0;
    while 1
        if norm(r, Inf)<1e-6
            break
        end
        cout = cout + 1;
        
        a = (r' * r) / (d' * A * d);
        x = x + a * d;
        r2 = r - a * A * d;
        brt = (r2' * r2) / (r' * r);
        d = r2 + brt * d;
        
        r = r2;
    end

end
function [x,cout]=PreSeidel(A,b)

D=diag(diag(A));
L = -tril(A,-1);%求A的下三角矩阵,不带对角线
U = -triu(A,1);%求A的上三角矩阵
M = (D-L)/D*(D-U);
A = M\A;
b = M\b;
L = -tril(A,-1);
U = -triu(A,1);
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
function [x2,cout]=Prejacobi(B,c)

D=diag(diag(B));
B=D\B;
c=D\c;
U=D-triu(B);
L=-tril(A,-1);
x1=(rand(1,size(B,1)))';
cout=0;
while 1
 cout=cout+1;
 x2=inv(D)*(U+L)*x1+inv(D)*c;
 t=ones(1,size(B,1));
 t(2:2:size(B,1))=-1;
 t=t';
 t1=x2-x1;
 t2=x2-t;
 if (norm(t1,inf)<10e-3)&&(norm(t2,inf)<10e-3)
 break
end
 x1=x2;
end

end