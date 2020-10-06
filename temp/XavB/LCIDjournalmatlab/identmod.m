clear
close all

ndata=500;
var_e=0.5;
var_u=1;

nnn=50;

numGo=[0 0 0 0.10276 0.18123];
denGo=[1 -1.99185 2.20265 -1.84083 0.89413];
Go=ss(tf(numGo, denGo, 1)); delay=3;Go=balreal(Go);
numHo=[1 0 0 0 0];
denHo=denGo;Ho=ss(tf([1 0 0 0 0], denGo, 1));
Ho=balreal(Ho);

thetao=[denGo(2:end), numGo((delay+1):end)]';
na=length(denGo)-1;
nb=length(numGo)-delay;

k=6;



% SIMULATION EN BOUCLE OUVERTE
%*****************************

      uol=sqrt(var_u)*randn(ndata,1);
   
   
   
      
     
   eol=sqrt(var_e)*randn(ndata,1);


y=filter(numGo,denGo,uol)+filter(numHo,denHo,eol);
   




% IDENTIFICATION
% **************

thhat=arx([y,uol],[na,nb,delay]);
[thetastar,Ptheta,varehat]=th2par(thhat);


[Ahat,Bhat]=th2poly(thhat);
display('le centre de Dol est: num-den')
numerateurGhat=Bhat
denominateurGhat=Ahat
Ghat=tf(numerateurGhat,denominateurGhat,1);

 %Ptheta=(inv(varuol)*var_e/ndata)*eye(length(thetao));
   
[UU,SV,VV]=svd(Ptheta);
SVbis=sqrt(SV);
T=UU*SVbis*VV';


vecthi=[];
vectho=[];
vecN=[];
iter=46;
for iix=1:iter,


xi=randn([k,1]);

thetai=thetastar+T*xi;

sourceNfct

iix
vecN=[vecN,ndata];

end;

MAXIMUM=max(vecN)
MINIMUM=min(vecN)
MEANvec=mean(vecN)
STANDARDDEV=std(vecN)