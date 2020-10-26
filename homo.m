clear;clc;close all;


points=5;
y=[0,0,508,508,254];
x=[0,500,0,500,250];
yd=[153,177,464,434,304];
xd=[187,345,185,343,277];
A=zeros(2*points,9);
for i=1:points
A(2*i-1,:)=[x(i),y(i),1,0,0,0,-x(i)*xd(i),-xd(i)*y(i),-xd(i)];
A(2*i,:)=[0,0,0,x(i),y(i),1,-x(i)*yd(i),-yd(i)*y(i),-yd(i)];
end
[U,S,V]=svd(A);
h=V(:,9);
H=reshape(h,3,3);

H=H';
A=imread('Audrey.jpg');
F=imread('frame.jpg');

##f1=f(:,:,1);
output=imperspectivewarp(A,H);
pos=1;
a(3,254000)=zeros;
for i=1:500
  for j=1:508
    a(:,pos)=[i; j; 1];
    pos=pos+1;
  end
end

out=H*a;
out(1,:)=out(1,:)./out(3,:);
out(2,:)=out(2,:)./out(3,:);
out(3,:)=out(3,:)./out(3,:);

##x=1; y=2;
##pos=1;
##newimage=zeros(500,508);
##for i=1:500
##  for j=1:508
##   newimage(i,j)=f(round(out(x,pos)),round(out(y,pos)));
##   pos=pos+1;
##  end
##end
##
##
##
##

imagesc(F);
hold on;
imagesc([187,347],[153,465],output);
##F(153:465,187:347,:)=output(1:312,1:160,:);
##n=zeros(564,1003,3);
##n=F;
##imshow(F);
