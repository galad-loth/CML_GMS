function u=ExpectStep(Img,u,p,theta,s,method,varargin)
Nregion=length(theta{1});
uSum=0;
if strcmp(method,'gamma')
    for kk=1:Nregion
        probgamma=theta{3}(kk)^theta{3}(kk)/theta{1}(kk)...
            /gamma(theta{3}(kk))*(Img/theta{1}(kk)).^(theta{3}(kk)-1)...
            .*exp(-theta{3}(kk)*Img/theta{1}(kk))+1e-6;
        f=-log(probgamma);
        divp=p{kk}.pb+p{kk}.pr-p{kk}.pt-p{kk}.pl;
        u{kk}=exp((-f+divp)/s);
        uSum=uSum+u{kk};
    end
    for ll=1:Nregion
        u{ll}=u{ll}./uSum;
    end
elseif strcmp(method,'gauss')
    for kk=1:Nregion
        f=(Img-theta{1}(kk)).^2./2./theta{2}(kk);
        divp=p{kk}.pb+p{kk}.pr-p{kk}.pt-p{kk}.pl;
        u{kk}=exp((-f+divp)/s);
        uSum=uSum+u{kk};
    end
    for ll=1:Nregion
        u{ll}=u{ll}./uSum;
    end
elseif strcmp(method,'color')
    [Nx,Ny,Nz]=size(Img);
    ImgTemp=reshape(Img,[Nx*Ny Nz]);
    for kk=1:Nregion
        mu=theta{1}{kk};sigma=theta{2}{kk};
        diff=ImgTemp-repmat(mu,[Nx*Ny 1]);
        f=log(det(sigma))./2+sum((diff*inv(sigma)).*diff,2)./2;
        f=reshape(f,[Nx Ny]);
        divp=p{kk}.pb+p{kk}.pr-p{kk}.pt-p{kk}.pl;
        u{kk}=exp((-f+divp)/s);
        uSum=uSum+u{kk};
    end
    for ll=1:Nregion
        u{ll}=u{ll}./uSum;
    end
elseif strcmp(method,'pol_wis')
    PolData=varargin{1};
    [Nx,Ny,Nz]=size(Img);
    for kk=1:Nregion
        mu=theta{1}{kk};
        mu_inv=inv(mu);
        mu_inv=[mu_inv(1,:),mu_inv(2,:),mu_inv(3,:)];
        tra=mu_inv*PolData;
        f=real(log(det(mu))+tra);
        f=reshape(f,[Nx Ny]);
        divp=p{kk}.pb+p{kk}.pr-p{kk}.pt-p{kk}.pl;
        u{kk}=exp((-f+divp)/s);
        uSum=uSum+u{kk};
    end
    for ll=1:Nregion
        u{ll}=u{ll}./uSum;
    end
end
    