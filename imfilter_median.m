%The median filter
function f=imfilter_median(x,y)
f=x;
[m,n]=size(x);
l=zeros(3,3);
for i=1:m-1
    for j=1:n-1
        if y(i,j)==255
            for h=-1:1
                for k=-1:1
                  l(h+2,k+2)=f(i+h,j+k);
                end
            end
             f(i,j)=median(reshape(l,numel(l),1));
        end
    end
end









































      