function Img_Seg=MF2Img(Img,u,Nlabel)
[Nx,Ny,Nz]=size(Img);
uu=zeros(Nx,Ny,Nlabel);
for kk=1:Nlabel
    uu(:,:,kk)=u{kk};
end
[umax,label]=max(uu,[],3);
if Nz==1
    Img_Seg=zeros(Nx,Ny);
    for kk=1:Nlabel
        Img_Seg(label==kk)=mean(Img(label==kk));
    end
else
    colormap=[0 0 0;240 255 255;255 97 0;0 255 127;160 32 240;255 125 64;255 128 0;48 128 20;240 230 140;255 0 255];
    Img_Seg=zeros(Nx*Ny,3);
    for kk=1:Nlabel
        Img_Seg(label==kk,1)=colormap(kk,1);
        Img_Seg(label==kk,2)=colormap(kk,2);
        Img_Seg(label==kk,3)=colormap(kk,3);
    end
    Img_Seg=reshape(Img_Seg,[Nx Ny 3]);
    Img_Seg=uint8(Img_Seg);
end
        
