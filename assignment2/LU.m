function [L_matrix,U_matrix] = LU(a,b)
%  2017-11-05  xh_scu
%  inputs:
%         Coefficient_matrix:系数矩阵，为n*n维方阵
%         Load_matrix       :载荷矩阵，为n*1维矩阵
%  outputs：
%         r_matrix:计算结果向量,为n*1为矩阵
 
% 判断输入矩阵维度是否满足要求
[row_coeff,col_coeff] = size(a);
[row_load,~] = size(b');
% 判断输入的维度是否满足要求
if (row_coeff ~= col_coeff) || (row_coeff ~= row_load)
    % 不满足则输出错误提示
    error('输入错误！'); end
% 初始化r_matrix矩阵
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

