function theta=SetPara(Img,Nlabel,method,varargin)
[Nx,Ny,Nz]=size(Img);
figure(10);set(gcf,'Position',[150 150 650 650]);
if strcmp(method,'gamma')
    imagesc(Img);colormap(gray);
    mu=zeros(1,Nlabel);sigma=zeros(1,Nlabel);look=zeros(1,Nlabel);
    for kk=1:Nlabel
        disp(['Select samples for region ',num2str(kk)]);
        BW=roipoly;
        Samples=Img(BW);
        mu(kk)=mean(Samples);
        sigma(kk)=var(Samples);
        look(kk)=mu.^2/sigma;
        if look(kk)>140;  look(kk)=140; end
    end
    theta={mu,sigma,look};
elseif strcmp(method,'gauss')
    imagesc(Img);colormap(gray);
     mu=zeros(1,Nlabel);sigma=zeros(1,Nlabel);
     for kk=1:Nlabel
        disp(['Select samples for region ',num2str(kk)]);
        BW=roipoly;
        Samples=Img(BW);
        mu(kk)=mean(Samples);
        sigma(kk)=var(Samples);
     end
     theta={mu,sigma};
elseif strcmp(method,'color')
    imagesc(uint8(Img));
    mu=cell(1,Nlabel);sigma=cell(1,Nlabel);
    ImgTemp=reshape(Img,[Nx*Ny Nz]);
    for kk=1:Nlabel
        disp(['Select samples for region ',num2str(kk)]);
        BW=roipoly;
        Samples=ImgTemp(BW==1,:);
        mu{kk}=mean(Samples);
        sigma{kk}=cov(Samples);
     end
     theta={mu,sigma};
elseif strcmp(method,'pol_wis')
    if nargin~=4
        disp('PolData is needed');
    end
    PolData=varargin{1};
    imagesc(uint8(Img));
    mu=cell(1,Nlabel);
    for kk=1:Nlabel
        disp(['Select samples for region ',num2str(kk)]);
        BW=roipoly;
        Samples=PolData(:,BW==1);
        mu{kk}=mean(Samples,2);
        mu{kk}=reshape(mu{kk},[3 3]);
    end
    theta={mu};
end
close ;


