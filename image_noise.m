%  Show the detected noise pixels in BWimages
function f=image_noise(x,t)
f=x;
[m,n]=size(x);
for i=3:m-2
    for j=3:n-2
          if   x(i,j)<t
            f(i,j)=255;
          else f(i,j)=0;
         end
    end
end