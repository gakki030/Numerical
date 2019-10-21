
function y=cos1(x)
n=10;
b=pi/4+(pi/4)*cos((1:2:2*n-1)*pi/(2*n));
yb=cos(b);                     
c=newtdd(b,yb,n);

s=1;                           
x1=mod(x,2*pi);
if 3*pi/2>x1>pi/2
  x1 = abs(pi-x1);
  s = -1;
end
if x1 > 3*pi/2
  x1 = 2*pi-x1;
end
y = s*nest(n-1,c,x1,b);