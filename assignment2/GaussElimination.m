function [r_matrix] = GaussElimination(a,b)
%  2017-11-05  xh_scu
%  inputs:
%         a:系数矩阵，为n*n维方阵
%         b:载荷矩阵，为n*1维矩阵
%  outputs：
%         r_matrix:计算结果向量,为n*1为矩阵
 
% 判断输入矩阵维度是否满足要求
[row_coeff,col_coeff] = size(a);
[row_load,~] = size(b');
% 初始化r_matrix矩阵
r_matrix = zeros(row_load,1);
% 判断输入的维度是否满足要求
if (row_coeff ~= col_coeff) || (row_coeff ~= row_load)
    % 不满足则输出错误提示
    print('输入错误！');
%消去过程
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
  %回代过程
r_matrix(n) = b(n)/a(n,n);
for k = n-1:-1:1
        sum_temp = 0;
        for j = k+1:n
            sum_temp = sum_temp + a(k,j)*r_matrix(j);
        end
        r_matrix(k) = (b(k) - sum_temp)/a(k,k);
    end
end % 条件判断结束
end