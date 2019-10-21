function [Q,R]=qrhs(A)
 
% 基于Householder变换，将方阵分解为A=QR，其中Q为正交矩阵，R为上三角阵
 
%
 
% 参数说明
 
% A：需要进行QR分解的方阵
 
% Q：分解得到的正交矩阵
 
% R：分解得到的上三角阵
 
%
 
% 实例说明
 
% A=[-12 3 3;3 1 -2;3 -2 7];
 
% [Q,R]=qr(A) % 调用MATLAB自带的QR分解函数进行验证
 
% [q,r]=qrhs(A) % 调用本函数进行QR分解
 
% q*r-A % 验证 A=QR
 
% q'*q % 验证q的正交性
 
% norm(q) % 验证q的标准化，即二范数等于1
 
% 
 
% 线性代数基础知识
 
% 1.B=P*A*inv(P)，称A与B相似，相似矩阵具有相同的特征值
 
% 2.Q*Q'=I，称Q为正交矩阵，正交矩阵的乘积仍为正交矩阵
 
% 
 
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