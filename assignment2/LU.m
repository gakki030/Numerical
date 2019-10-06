function [L_matrix,U_matrix] = LU(a,b)
%  2017-11-05  xh_scu
%  inputs:
%         Coefficient_matrix:ϵ������Ϊn*nά����
%         Load_matrix       :�غɾ���Ϊn*1ά����
%  outputs��
%         r_matrix:����������,Ϊn*1Ϊ����
 
% �ж��������ά���Ƿ�����Ҫ��
[row_coeff,col_coeff] = size(a);
[row_load,~] = size(b');
% �ж������ά���Ƿ�����Ҫ��
if (row_coeff ~= col_coeff) || (row_coeff ~= row_load)
    % �����������������ʾ
    error('�������'); end
% ��ʼ��r_matrix����
n=row_coeff;
L_matrix = zeros(n,n);            
for i = 1:n;     L_matrix(i,i) = 1;  end   
for j = 1 : n-1
    if abs(a(j,j))<eps
        error('zero pivot encountered');   
    end
    for i = j+1 : n
        mult = a(i,j)/a(j,j);
        L_matrix(i,j) = mult;  
        for k = j:n
            a(i,k) = a(i,k) - mult*a(j,k);
        end
    end
    U_matrix=a;
end

