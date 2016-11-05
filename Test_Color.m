close all;clc;clear all;
Img=double(imread('241004.jpg'));
[Nx,Ny,Nz]=size(Img);
figure;subplot(2,2,1);imagesc(uint8(Img));
title('Original Image')
pause(0.5);
method='color';
Nlabel=5;
theta=SetPara(Img,Nlabel,method);
s=10;alpha=30;dt=5;
[u,p]=initMF(Img,Nlabel);
Img_Seg=MF2Img(Img,u,Nlabel);
subplot(2,2,2);imagesc(Img_Seg);
title('Initialization of the label');pause(0.5);
iterNum=10;

for kk=1:iterNum
    u=ExpectStep(Img,u,p,theta,s,method);    
    p=GradientStep(u,p,dt);
    p=Proj(p,alpha);
%     if kk>iterNum/3
%        theta=UpdatePara(Img,u);
%     end
    Img_Seg=MF2Img(Img,u,Nlabel);
    subplot(2,2,3);
    imagesc(Img_Seg);
    title(['label after ',num2str(kk),' iterations']);pause(0.5);
end
Img_Seg=MF2Img(Img,u,Nlabel);
subplot(2,2,4);
imagesc(Img_Seg);
title(['Final label,',num2str(kk),' Iterations']);