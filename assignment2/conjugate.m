n=1000;
[a,b]=matrixetup(n);
x0=ones(n,1);
% spy(a)
[x1,r1,cout1]=gonger(a,b,x0);
[x2,r2,cout2]=jacobi(a,b,x0);
[x3,r3,cout3]=guaseidel(a,b,x0);
t=1:100;
figure();
plot(t,r1,'-o',t,r2,'-x',t,r3,'-s')
semilogy(t,r1,'-o',t,r2,'-x',t,r3,'-s')

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
% function [ x, be, cout ] = CorGrant(A, b ,x0)
%     n=size(A,1);
%     x = x0;
%     r = b - A * x0;
%     d = r;
%     X = ones(length(x), 1);
%     cout = 0;
%     while 1
%         cout = cout + 1;
%         a = (r' * r) / (d' * A * d);
%         x = x + a * d;
%         r2 = r - a * A * d;
%         brt = (r2' * r2) / (r' * r);
%         d = r2 + brt * d;
%         r = r2;
%         be=zeros(1,n);
%         be(cout)=norm(r,'inf');
%         if (norm(r, Inf)<1e-3)
%             break
%         end
%     end
function [x,t,be]=gonger(a,b,x0)
        n=length(b);
        x=zeros(n,1);
        r=b-a*x;
        d=r;
        n=length(b);
        for t=1:100
            G=(norm(r)^2)/(d'*a*d);
            x=x+G*d;
            rr=b-a*x;
            be(t)=norm(x-x0,'inf');
            B=(norm(rr)^2)/(norm(r)^2);
            d=rr+B*d;
            r=rr;
        end
    end


    function [x,be,t]=jacobi(a,b,xc)
        n=length(b);
        d=diag(a);
        r=a-diag(d);
        x=zeros(n,1);
        t=0;
        for t=1:100
            be=zeros(1,n);
            be(t)=norm(x-xc,'inf');
            x=(b-r*x)./d;  
        end
    end
     function [x,be,t] = guaseidel(a,b,xc)
         n=size(a,1);
         x=zeros(n,1);
         D=diag(diag(a));
         L=-tril(a,-1);
         U=-triu(a,1);
         G=(D-L)\U;
         f=(D-L)\b;
         for t=1:100
             be=zeros(1,n);
             be(t)=norm(x-xc,'inf');
             x=G*x+f;
         end
     end