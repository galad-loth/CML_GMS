function  p=Proj(p,alpha)
[Nx,Ny]=size(p{1}.pt);Nregion=length(p);
for kk=1:Nregion
    lp=p{kk}.pt.^2+p{kk}.pb.^2+p{kk}.pl.^2+p{kk}.pr.^2;
    lp([1 Nx],2:end-1)=lp([1 Nx],2:end-1)*2/3;
    lp(2:end-1,[1 Ny])=lp(2:end-1,[1 Ny])*2/3;
    lp(2:end-1,2:end-1)=lp(2:end-1,2:end-1)/2;
    lp=sqrt(lp);
    lp1=lp;
    lp1(lp<alpha)=1;
    lp1(lp>=alpha)=alpha./lp1(lp>=alpha);
    qt=lp1;qb=qt;ql=qt;qr=qt;
    qt(2:end,:)=(lp1(2:end,:)+lp1(1:end-1,:))/2;
    qb(1:end-1,:)=qt(2:end,:);
    ql(:,2:end)=(lp1(:,2:end)+lp1(:,1:end-1))/2;
    qr(:,1:end-1)=ql(:,2:end);
    p{kk}.pt=p{kk}.pt.*qt;
    p{kk}.pb=p{kk}.pb.*qb;
    p{kk}.pl=p{kk}.pl.*ql;
    p{kk}.pr=p{kk}.pr.*qr;
end
