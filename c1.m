%Manually adding Gaussian Noise and Removing it using Image Averaging

close all; clc; clear;
I = imread('cameraman.tif');
%imagesc(I), colormap('gray');
I=double(I)./255.0;
Vari=var(I(:));


N1=randn(256,256);
N1=0.45.*N1;
F1=I+N1;

v=(square(F1-mean(F1(:))))./255;

V=var(F1(:));
figure, imagesc(F1), colormap('gray');

N2=randn(256,256);
N2=0.45.*N2;
F2=I+N2;
V2=var(F2(:));
  
fav=(F1+F2)./2;
mfav=mean(fav(:));
l=0;
for i=1:256
    for j=1:256
        l=l+square(fav(i,j)-mfav);
    end
end

varfav=var(fav(:));
figure, imagesc(fav);colormap('gray');