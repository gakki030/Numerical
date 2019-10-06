function [r_matrix] = GaussElimination(a,b)
%  2017-11-05  xh_scu
%  inputs:
%         a:ϵ������Ϊn*nά����
%         b:�غɾ���Ϊn*1ά����
%  outputs��
%         r_matrix:����������,Ϊn*1Ϊ����
 
% �ж��������ά���Ƿ�����Ҫ��
[row_coeff,col_coeff] = size(a);
[row_load,~] = size(b');
% ��ʼ��r_matrix����
r_matrix = zeros(row_load,1);
% �ж������ά���Ƿ�����Ҫ��
if (row_coeff ~= col_coeff) || (row_coeff ~= row_load)
    % �����������������ʾ
    print('�������');
%��ȥ����
else
  n=row_coeff;
  for j = 1 : n-1
     if abs(a(j,j))<eps; error('zero pivot encountered'); 
     end
     for i = j+1 : n
         mult = a(i,j)/a(j,j);
        for k = j+1:n
            a(i,k) = a(i,k) - mult*a(j,k);
        end
        b(i) = b(i) - mult*b(j);
     end
  end
  %�ش�����
r_matrix(n) = b(n)/a(n,n);
for k = n-1:-1:1
        sum_temp = 0;
        for j = k+1:n
            sum_temp = sum_temp + a(k,j)*r_matrix(j);
        end
        r_matrix(k) = (b(k) - sum_temp)/a(k,k);
    end
end % �����жϽ���
end