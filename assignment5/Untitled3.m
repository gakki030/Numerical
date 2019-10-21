A=[4 0;3 1];
B=[1 2;1 1];
C=[2 1;1 -1;2 1];
D=[4 8 1;0 2 -2;3 6 7];
[Q1,R1]=qr(A)
[q1,r1]=qrhs(A)
[Q2,R2]=qr(B)
[q2,r2]=qrhs(B)
[Q3,R3]=qr(C)
[q3,r3]=qrhs(C)
[Q4,R4]=qr(D)
[q4,r4]=qrhs(D)
function [H,rho]=householder(x,y)
% ��������ԳƵ�Householder����H��ʹHx=rho*y������rho=-sign(x(1))*||x||/||y||
%
% ����˵��
% x��������
% y����������x��y���������ͬ��ά��
%
x=x(:);
y=y(:);
if length(x)~=length(y)
    error('The Column Vectors X and Y Must Have The Same Length!');
end
rho=-sign(x(1))*norm(x)/norm(y);
y=rho*y;
v=(x-y)/norm(x-y);
I=eye(length(x));
H=I-2*v*v';
end

function [Q,R]=qrhs(A)
 
% ����Householder�任��������ֽ�ΪA=QR������QΪ��������RΪ��������
 
%
 
% ����˵��
 
% A����Ҫ����QR�ֽ�ķ���
 
% Q���ֽ�õ�����������
 
% R���ֽ�õ�����������
n=size(A,1);
 
R=A;
 
Q=eye(n);
 
for i=1:n-1
 
 x=R(i:n,i);
 
  y=[1;zeros(n-i,1)];
 
  Ht=householder(x,y);
 
   H=blkdiag(eye(i-1),Ht);
 
  Q=Q*H;
 
   R=H*R;
 
end
end