clear;clc;close all;


img=double(imread('linear.tif'));
figure, imagesc(img);colormap('gray');

fout=zeros(384,256);

for i=1:384
    for j=1:256
        fout(i,j)=255.*(((img(i,j)./255)).^(1./2.2));
    end
end

figure, imagesc(fout);colormap('gray');
        