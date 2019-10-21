function [H,rho]=householder(x,y)
% ��������ԳƵ�Householder����H��ʹHx=rho*y������rho=-sign(x(1))*||x||/||y||
%
% ����˵��
% x��������
% y����������x��y���������ͬ��ά��
%
% ʵ��˵��
% x=[3 5 6 8]';
% y=[1 0 0 0]';
% [H,rho]=householder(x,y);
% H*x-rho*y % ��֤Hx=rho*y
% H'*H % ��֤����
%
% ����HouseHolder�任
% 1.H=I-2vv'������||v||=1�����ǳ�HΪ����(HouseHolder)������֤H�Գ�������
% 2.���||x||=||y||����ô����HouseHolder����H=I-2vv������v=��(x-y)/||x-y||��ʹHx=y
% 3.���||x||��||y||����ô����HouseHolder����H��ʹHx=rho*y������rho=-sign(x(1))*||x||/||y||
% 4.Householder���󣬳����ڽ�һ������Aͨ�������任�Խ���
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