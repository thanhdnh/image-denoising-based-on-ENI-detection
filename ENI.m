 % ENI detection function
function eni=ENI(x,t)
x=double(x);
[m,n]=size(x);
y=zeros(5,5);
eni=zeros(m,n);
% threshold1=30;
for i=3:m-2
    for j=3:n-2
        
        for h=-2:2
            for k=-2:2
                y(3+h,3+k)=abs(x(i+h,j+k)-x(i,j));
                if y(3+h,3+k)>t
                    y(3+h,3+k)=0;
                else  y(3+h,3+k)=1;
                end   
                eni(i,j)=eni(i,j)+y(3+h,3+k);
            end
        end  
    end
end



