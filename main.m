%% The two-stage scheme for salt-and-pepper noise removal
%读取四幅图像
image1_original=imread('barbara.bmp');
image2_original=imread('boat.bmp');
image3_original=imread('lena.bmp');
image4_original=imread('zebra.png');

%分别给四幅图像加30%，40%，50%，60%的椒盐噪声
image1_noise=imnoise(image1_original,'salt & pepper',0.3);
image2_noise=imnoise(image2_original,'salt & pepper',0.4);
image3_noise=imnoise(image3_original,'salt & pepper',0.5);
image4_noise=imnoise(image4_original,'salt & pepper',0.6);

%显示四幅噪声图像
figure,imshow(image1_noise);
figure,imshow(image2_noise);
figure,imshow(image3_noise);
figure,imshow(image4_noise);

%调用ENI函数，进行ENI检测
image1_eni=ENI(image1_noise,40);
image2_eni=ENI(image2_noise,40);
image3_eni=ENI(image3_noise,40);
image4_eni=ENI(image4_noise,40);

%调用image_noise函数，显示ENI检测后噪声二值图像
image_eninoise1=image_noise(image1_eni,12);
image_eninoise2=image_noise(image2_eni,12);
image_eninoise3=image_noise(image3_eni,12);
image_eninoise4=image_noise(image4_eni,12);

%显示噪声点二值图像
figure,imshow(image_eninoise1);
figure,imshow(image_eninoise2);
figure,imshow(image_eninoise3);
figure,imshow(image_eninoise4);

%调用imfilter_average函数进行均值滤波
imfilter1a=imfilter_average(image1_noise,image_eninoise1);
imfilter2a=imfilter_average(image2_noise,image_eninoise2);
imfilter3a=imfilter_average(image3_noise,image_eninoise3);
imfilter4a=imfilter_average(image4_noise,image_eninoise4);

%显示均值滤波结果
figure,imshow(imfilter1a);
figure,imshow(imfilter2a);
figure,imshow(imfilter3a);
figure,imshow(imfilter4a);

%调用MSE函数，计算均值滤波MSE
mse_average1=MSE(image1_original,imfilter1a);
mse_average2=MSE(image2_original,imfilter2a);
mse_average3=MSE(image3_original,imfilter3a);
mse_average4=MSE(image4_original,imfilter4a);

%调用imfilter_median函数进行中值滤波
imfilter1m=imfilter_median(image1_noise,image_eninoise1);
imfilter2m=imfilter_median(image2_noise,image_eninoise2);
imfilter3m=imfilter_median(image3_noise,image_eninoise3);
imfilter4m=imfilter_median(image4_noise,image_eninoise4);

%显示中值滤波结果
figure,imshow(imfilter1m);
figure,imshow(imfilter2m);
figure,imshow(imfilter3m);
figure,imshow(imfilter4m);

%计算中值滤波MSE
mse_median1=MSE(image1_original,imfilter1m);
mse_median2=MSE(image2_original,imfilter2m);
mse_median3=MSE(image3_original,imfilter3m);
mse_median4=MSE(image4_original,imfilter4m);

%自适应中值滤波
r1=adpmedian(image1_noise,9);
r2=adpmedian(image2_noise,9);
r3=adpmedian(image3_noise,9);
r4=adpmedian(image4_noise,9);

%显示自适应中值滤波结果
figure,imshow(r1);
figure,imshow(r2);
figure,imshow(r3);
figure,imshow(r4);

%计算自适应中值滤波MSE
mse_adpmed1=MSE(image1_original,r1);
mse_adpmed2=MSE(image2_original,r2);
mse_adpmed3=MSE(image3_original,r3);
mse_adpmed4=MSE(image4_original,r4);


