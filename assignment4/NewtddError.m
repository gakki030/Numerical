
x0=(0.6:0.1:1);
y0=[1.433329 1.632316 1.896481 2.247908 2.718282];
c=newtdd(x0,y0,5);
syms x y;
y=c(1)+c(2)*(x-x0(1))+c(3)*(x-x0(1))*(x-x0(2))...
    +c(3)*(x-x0(1))*(x-x0(2))*(x-x0(3))+c(4)*(x-x0(1))*(x-x0(2))*(x-x0(4));
y=vpa(simplify(y),6);
disp(y)
x1=[0.82,0.98];
y1=zeros(1,length(x1));
r=zeros(1,length(x1));
tmp=ones(1,length(x1));
ff=diff(exp(x^5),5);
t=[-1:0.01:1];
a=zeros(1,length(t));
for i=1:2
    y1(i)=nest(4,c,x1(i),x0);%拟合值
    r(i)=abs(exp(x1(i)^2)-y1(i));
    for j=1:4
    tmp(i)=tmp(i)*(x1(i)-x0(j));
    end
    for k=1:length(t)
        a(k)=subs(ff,t(k));
    end
    tmp(i)=abs(tmp(i)/factorial(5))*max(k);
end 
for i=1:2
fprintf('预测值%d:%d',i,y1(i))
fprintf('误差上界%d:%d',i,tmp(i))
end
t1=[0.5:0.01:1];
t2=[0:0.01:2];
 ans1=nest(4,c,t1,x0);
 ans2=nest(4,c,t2,x0);
hl1 = plot(t2,ans2,'-*r');
ax1 = gca;
set(ax1,'XColor','r','YColor','r')
ax2 = axes('Position',get(ax1,'Position'),...           
    'XAxisLocation','top',...           
    'YAxisLocation','right',...           
    'Color','none',...           
    'XColor','k','YColor','k');
hl2 = line(t1,ans1,'Color','b','Parent',ax2);
hl2.Marker='o';
