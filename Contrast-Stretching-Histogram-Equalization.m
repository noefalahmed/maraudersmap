clc;clear;close all;

I=imread('C:\Users\MR\Desktop\BadHist.jpg');
figure,imshow(I); colormap('gray');
figure, imhist(I);
[pixelCounts, grayLevels] = imhist(I, 256);
X=I;

% %contrast stretching on a dimly illuminated image


% I=double(I);
% imintemp=min(I);
% imaxtemp=max(I);
% imin=min(imintemp);
% imax=max(imaxtemp);
% 
% m=255/(imax-imin);
% c=(255-m*imax);
% 
% for i=1:683
%     for j=1:1024
%         I(i,j)=(I(i,j)*m)+c;
%     end
% end
% I=uint8(I);
% figure, imshow(I); colormap('gray');
% figure, imhist(I);



%histogram equalization on a dimly illuminated image

pixelCounts=(pixelCounts/(683*1024));

pf=pixelCounts;

for i=2:256
    pf(i)=pf(i)+pf(i-1);
end

for i=1:256
    pf(i)=pf(i)*255;
    pf(i)=round(pf(i),0);
end

for i=1:683
    for j=1:1024
    X(i,j)=pf(X(i,j)+1);
    end
end

figure, imagesc(X);colormap('gray');
figure, imhist(X);



