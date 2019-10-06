syms x;
x0=1;%初始点1
x1=2;%初始点2
f=exp(x)+x-7;
delta=1e-8;%误差精度
Maxint=50;
count=1;
while count<=Maxint
fx=subs(f,x1)-subs(f,x0);
x2=x1-(subs(f,x1)*(x1-x0))/fx;
if abs(x1-x2)<delta
break;
end
x0=x1;
x1=x2;
count=count+1;
end
output=subs(f,x2);
 f=vpa(output,10)%控制输出精度 将sym精确形式变为小数
 root=vpa(x2,10)
 


