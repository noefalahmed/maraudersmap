
%contructing an Adaptive Mean Filter

close all; clc; clear;
I = imread('cameraman.tif');
% imagesc(I), colormap('gray');
I=double(I)./255.0;

N1=randn(256,256);
N1=0.45.*N1;
vn=var(N1(:));
F1=I+N1;
figure, imagesc(F1);colormap('gray');


x=0;y=0;
Fout(256,256)=0;
local(3,3)=0;
for i=1:256
    for j=1:256
        x=-1;
        for a=1:3
            y=-1;
            for b=1:3
                if(i-1<1||i+1>256||j-1<1||j+1>256)
                    local(a,b)=0;
                
                else
                    local(a,b)=F1(i+x,j+y);
                end
            y=y+1;
            end
            x=x+1;
        end
        
        localmean=mean(local(:));
        localvar=var(local(:));
        
        Fout(i,j)=F1(i,j)-((vn./localvar).*(F1(i,j)-localmean));    
        
    end
end

figure, imagesc(Fout);colormap('gray');