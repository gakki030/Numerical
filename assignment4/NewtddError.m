x0=(0.6:0.1:1);
y0=[1.433329 1.632316 1.896481 2.247908 2.718282];
c=newtdd(x0,y0,5);
syms x y;
y=c(1)+c(2)*(x-x0(1))+c(3)*(x-x0(1)).*(x-x0(2))...
    +c(3)*(x-x0(1))*(x-x0(2))*(x-x0(3))+c(4)*(x-x0(1))*(x-x0(2))*(x-x0(4));
%y=vpa(simplify(y),6)
x1=[0.82,0.98];
y1=zeros(1,length(x1));
r=zeros(1,length(x1));
max=ones(1,length(x1));
ff=matlabFunction(diff(exp(x^5),5));
for i=1:2
    y1(i)=nest(4,c,x1(i),x0);
    r(i)=abs(exp(x1(i)^2)-y1(i));
    for j=1:4
    max(i)=max(i)*(x1(j)-x0(j));
    end
    max(i)=abs(max(i)/factorial(5))*max
end
    