

function [Afe,Bfe,Cfe,Dfe]=detFe(Hi,na,nb,k)

[Ah,Bh,Ch,Dh]=ssdata(Hi);


nh=size(Ah,1);

Afe=[zeros(1,na),Ch;eye(na-1),zeros(na-1,1+nh);zeros(nh,na),Ah];
Bfe=[1;zeros(na-1,1);Bh];
Cfe=[-eye(na),zeros(na,nh);zeros(nb,na+nh)];
Dfe=zeros(na+nb,1);