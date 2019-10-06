clear all;
format long;
f=@(x) 2*x*cos(x)-2*x+sin(x^3);
x=[-0.1:0.2];
root =fzero(f,x)
back_err=abs(f(root))
forward_err=abs(root)
bisect(f,-0.1,0.2,0.5e-10)