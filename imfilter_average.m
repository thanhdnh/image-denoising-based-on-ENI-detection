%The average filter  function
function f=imfilter_average(x,y)
f=double(x);
[m,n]=size(x);

for i=3:m-2
    for j=3:n-2
        if y(i,j)==255
            sum=0;
            for h=-2:2
                for k=-2:2
                    sum=sum+f(i+h,j+k);
                end
            end
            f(i,j)=sum/25;
        end
    end
end
f=uint8(f);
                
            
    