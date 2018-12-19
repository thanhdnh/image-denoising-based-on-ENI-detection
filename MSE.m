%Evaluate quantitatively the results by MSE
function mse=MSE(x,y)
[m,n]=size(x);
x=im2double(x);
y=im2double(y);
mse=0;
for i=1:m
    for j=1:n
        mse=mse+(x(i,j)-y(i,j))^2;
    end
end
  mse=mse/(m*n);