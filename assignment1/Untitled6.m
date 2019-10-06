%clear all;
a=[-1:-1:-14];
ans1=zeros(1,14);
ans2=zeros(1,14);
ans3=zeros(1,14);
ans4=zeros(1,14);
x=10.^a;
i=1;
while i<=14
%表达式(a)
ans1(i) = (1-sec(x(i)))/(tan(x(i)))^2;
ans2(i) = -1/(sec(x(i))+1);
%表达式(b)
ans3(i) = (1-(1-x(i))^3)/x(i);
ans4(i) = (x(i))^2-3*x(i)+3;
i=i+1;
end