syms x;
x0=1;%��ʼ��1
x1=2;%��ʼ��2
f=exp(x)+x-7;
delta=1e-8;%����
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
 f=vpa(output,10)%����������� ��sym��ȷ��ʽ��ΪС��
 root=vpa(x2,10)
 


