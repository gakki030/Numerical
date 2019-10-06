clear all;
format long;
f=@(x) (cos(x))^2-x+6;
ans=bisect(f,0,10,0.5*10^(-6))
