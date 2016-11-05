%function Test()
close all;clc;clear all;
Img=double(imread('24063.jpg'));
[Nx,Ny,Nz]=size(Img);
if Nz>1
    Img=Img(:,:,1);
end
figure;subplot(2,2,1);imagesc(Img);colormap(gray);
title('Original Image')
pause(0.5);
method='gamma';
Nlabel=3;
theta=SetPara(Img,Nlabel,method);
s=1;alpha=20;dt=.35;
[u,p]=initMF(Img,Nlabel);
Img_Seg=MF2Img(Img,u,Nlabel);
subplot(2,2,2);imagesc(Img_Seg,[min(min(Img_Seg)) max(max(Img_Seg))]);colormap(gray)
title('Initialization of the label');pause(0.5);
iterNum=20;
for kk=1:iterNum
    u=ExpectStep(Img,u,p,theta,s,method);    
    p=GradientStep(u,p,dt);
    p=Proj(p,alpha);
%     if kk>iterNum/3
%        theta=UpdatePara(Img,u);
%     end
    Img_Seg=MF2Img(Img,u,Nlabel);
    subplot(2,2,3);
    imagesc(Img_Seg,[min(min(Img_Seg)) max(max(Img_Seg))]);colormap(gray)
    title(['label after ',num2str(kk),' iterations']);pause(0.5);
end
Img_Seg=MF2Img(Img,u,Nlabel);
subplot(2,2,4);
imagesc(Img_Seg,[min(min(Img_Seg)) max(max(Img_Seg))]);colormap(gray)
title(['Final label,',num2str(kk),' Iterations']);
