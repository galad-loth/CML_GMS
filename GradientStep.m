function p=GradientStep(u,p,dt)
[Nx,Ny]=size(u{1});
Nregion=length(u);
for kk=1:Nregion
    dut=zeros(Nx,Ny);dub=dut;dul=dut;dur=dut;
    dut(2:end,:)=diff(u{kk},[],1);
    dub(1:end-1,:)=diff(u{kk},[],1);
    dul(:,2:end)=diff(u{kk},[],2);
    dur(:,1:end-1)=diff(u{kk},[],2);
    p{kk}.pt=p{kk}.pt+dt*dut;
    p{kk}.pb=p{kk}.pb+dt*dub;
    p{kk}.pl=p{kk}.pl+dt*dul;
    p{kk}.pr=p{kk}.pr+dt*dur;
end
    





