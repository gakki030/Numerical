
n=1000;
[a,b]=matrixetup(n);
xc=ones(n,1);
[x1,cout1,be1]=conjugate(a,b);
dd=diag(diag(a));
a=dd\a;
b=dd\b;
[x2,cout2,be2]=jacobi(a,b,xc);
[x3,cout3,be3]=guaseidel(a,b,xc);
t=1:100;
figure();
plot(t,be1,'-o',t,be2,'-h',t,be3,'-s')
semilogy(t,be1,'-o',t,be2,'-h',t,be3,'-s')
legend('conjugate','Prejacobi','PregaussSeidel');


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

    function [x,t,be]=jacobi(a,c,xc)
        D=diag(diag(a));     
        U=D-triu(a);
        L=-tril(a,-1);
        for t=1:100
            x=inv(D)*(U+L)*xc+inv(D)*c; 
            be(t)=norm(x-xc,'inf');
        end
    end
function [x,t,be] = guaseidel(a,b,xc)
 D=diag(diag(a));
 L = -tril(a,-1);
 U = -triu(a,1);
 G = (D-L)\U;
 f = (D-L)\b;
 x0=(rand(1,size(a,1)))';
 x = G*x0+f;
         for t=1:100
             be(t)=norm(x-xc,'inf');
             x0 = x;
             x = G*x0+f;
         end
     end
    function [x,t,be]=conjugate(a,b)
        n=length(b);
        xc=ones(n,1);
        x=zeros(n,1);
        r=b-a*x;
        d=r;
        for t=1:100
            G=(norm(r)^2)/(d'*a*d);
            x=x+G*d;
            rr=b-a*x;
            be(t)=norm(x-xc,'inf');
            B=(norm(rr)^2)/(norm(r)^2);
            d=rr+B*d;
            r=rr;
        end
    end
