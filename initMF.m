function [u,p]=initMF(Img,Nlabel)
[Nx,Ny,Nz]=size(Img);
u=cell(1,Nlabel);
p=cell(1,Nlabel);
for kk=1:Nlabel
    u{kk}=rand(Nx,Ny);
    p{kk}.pt=zeros(Nx,Ny);
    p{kk}.pb=zeros(Nx,Ny);
    p{kk}.pl=zeros(Nx,Ny);
    p{kk}.pr=zeros(Nx,Ny);
end
    