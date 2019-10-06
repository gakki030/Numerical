function [L_matrix,U_matrix] = LU(a)
   	% 判断输入矩阵维度是否满足要求
   	[row_coeff,col_coeff] = size(a);
   	if (row_coeff ~= col_coeff) 
   	error('输入错误！'); 
   	end
   	% 初始化L_matrix矩阵
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
