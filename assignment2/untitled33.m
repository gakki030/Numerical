n=1000;
v=(1:1:n);
a=diag(v);
for i=1:n-2
    a(i,i+1)=1/2;a(i+1,i)=1/2;
    a(i,i+2)=1/2;a(i+2,i)=1/2;
end
spy(a)