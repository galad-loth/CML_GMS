function theta=UpdatePara(Img,u)
[Nx,Ny]=size(Img);Nlabel=length(u);
theta=cell(1,2);
uu=zeros(Nx,Ny,Nlabel);
for kk=1:Nlabel
    uu(:,:,kk)=u{kk};
end
[umax,label]=max(uu,[],3);
for kk=1:Nlabel
    mu=mean(Img(label==kk));
    sigma=var(Img(label==kk));
    theta{1}(kk)=mu;
    theta{2}(kk)=sigma;
end