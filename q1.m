clc; clear; close all;

%q1-- Simple Fourier Transform
load ('C:\Users\MR\Desktop\dip\project 1\DIP1_Data\DIP1.MAT');
I = imread('cameraman.tif');

imagesc(I); colormap('gray');

ffta=fft2(I);
figure, imagesc (log(abs(fftshift(ffta)))), colormap ('gray');
title('Image A FFT2 Magnitude')
   

%q2-- Manually changing Frequency in Fourier Domain to Denoise
imagesc(Cam1b); colormap('gray');
fftb=fft2(Cam1b);
x=fftshift(fftb);
figure, imagesc (abs(x)), colormap ('gray');
title('Distorted')

x(87:89,87:89)=0;  
x(169:171,169:171)=0;

figure, imagesc(abs(ifft2(ifftshift(x)))); colormap ('gray');
title('Original image');


%q3(a)-- Convolution in Spatial Domain.
J=abs(imread('coins.png'));
figure;imagesc(J); colormap('gray');
filter2=1/9*[1,1,1;1,1,1;1,1,1];
filter2=double(filter2);
res=imfilter(J,filter2);
figure, imagesc(res); colormap( 'gray');




%q3(b) --Convolution in Fourier Domain.
J=abs(imread('coins.png'));
filter2=1/9*[1,1,1;1,1,1;1,1,1];
J(256,256)=0;
filter2(256,300)=0;   %fft of coin image results in dimensions 256x300 
                      %Padding done here to ensure equal dimensions.

coinfft=fft2(J);
figure; imagesc(log(abs(fftshift(coinfft)))); colormap('gray');

filter2fft=fft2(filter2);
figure; imagesc(log(abs(fftshift(filter2fft)))); colormap('gray'); title('filter fft');

figure;imagesc(ifft2(filter2fft.*coinfft)); colormap('gray'); title('convolution');