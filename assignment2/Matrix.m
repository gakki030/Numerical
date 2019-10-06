  
function [ ] = Matrix(n)
matrix_A=zeros(n);
for i=1:n
    for k=1:n
    matrix_A(i,k)=5/(i+2*k-1);
    end
end
x = ones(1,n);
b = matrix_A*(x');
xc = matrix_A\(x');
r = b-matrix_A*xc;
back_error=norm(r,inf)/norm(b,inf);
forward_error=norm(x-xc,inf)/norm(x,inf);
cond=forward_error/back_error;
fprintf('back_error=%d',back_error)
fprintf('forward_error=%d',forward_error)
fprintf('cond=%d',cond)
    