%Program to compute the reference signal in LCID - OL or CL- N fixed

clear
close all


M=20;


ndata=500;

relerror=0.01;



wbis=logspace(-3,pi);

wter=wbis;%(1:39);



%frequence vector

w=logspace(-3,pi,200);

%wter=[0.001 0.3 0.38 0.4  1];
%wter=[wbis(1),wbis(36),wbis(38),wbis(43)];

%wter=[1,2];
%wter=0.001
%wter=logspace(-3,pi,15)

% true system

%true system
var_e=1;
numGo=10*[0 0.36];
denGo=[1 -0.7];

Go=ss(tf(numGo, denGo, 1)); delay=1;
Go=balreal(Go);


numHo=[1 -0.9];
denHo=[1 0];

Ho=ss(tf(numHo, denHo, 1));
thetao=[numGo(2),numHo(2),denGo(2)]';

delay=1;
k=3;




% %modele initial
% %**************

Ninit=100;

% u=sqrt(0.1)*randn(ndata,1);
% eol=sqrt(var_e)*randn(ndata,1);
% save openloopdata1.mat u eol

load openloopdata1

uinit=u;


yu=filter(numGo,denGo,u);
y=yu+filter(numHo,denHo,eol);
   

thhati=bj([y,u],[1 1 0 1 1]);
[thetastari,Pthetai]=th2par(thhati);
[Ahati,Bhati,Chati,Dhati,Fhati]=th2poly(thhati);

Gi=tf(Bhati,Fhati,1);
denGi=Fhati;
numHi=Chati;
Hi=tf(Chati,[1 0],1);
var_e_i=thhati.noisevariance;


%Determination Fu(z,thetainit)

Fu=[1;0;-Gi]*tf([1 0],denGi,1)*tf([0 1],numHi,1);
Fe=[0;tf([0 1],numHi,1);0];
    
[Fo,vecFm,alpha]=calculFmarx(Fu,Fe,M);

Mbar=ndata*alpha; %Mbar=Mbar/7.81;
Mo=(ndata/var_e_i)*Fo; %Mo=Mo/7.81;
vecM=(ndata/var_e_i)*vecFm; %vecM=vecM/7.81;


% Cout pour l'optimisation


begincout=[1;zeros(M,1)];



%error('c')

% Computation of Phi


vecradm=[];
    for iii=1:length(wter),
        puls=wter(iii);
        
        gmodw=frxav(Gi,puls);
    radm=abs(gmodw)*relerror;
vecradm=[vecradm,radm];
end;



% vecradm=vecradm(1)*ones(size(vecradm))
% vecradm2=vecradm;    
corrphiu=optphiold_disc1(begincout,Mbar,Mo,vecM,M,k,ndata,wter,2.45,vecradm,Fu,Hi);

%optphiold%(begincout,Mbar,Mo,vecM,M,k,ndata,wter,na,nb,delay,chi,Ci,thetai,vecradm,Fuold,Ho);

phiuw=ones(1,length(w))*corrphiu(1); 
for ii=1:M,
   phiuw=phiuw+corrphiu(ii+1)*2*cos(w.*ii);
   
end;

figure(2)
semilogx(w,phiuw,'r')

%calcul de Ptheta theorique (just for fun)

iPthetath=(Mbar+corrphiu(1)*Mo);
   
if M>0
for ii=1:M,
      iPthetath=iPthetath+(corrphiu(ii+1)*vecM(:,(1+k*(ii-1)):(k*ii)));
   end;
end;
Pthetath=inv(iPthetath);

% IDENTIF
%**********************


    
% SIMULATION EN BOUCLE OUVERTE
%*****************************

   if M==0
      u=sqrt(corrphiu)*randn(ndata,1);
   else u=inpsignal(M,corrphiu,ndata);
   end;
   
      
      %uol=sqrt(varuol)*idinput(ndata,'prbs',[0 1]);
   %uol=stepseries(ndata,80,400,varuol);
   eol=sqrt(var_e)*randn(ndata,1);

yu=filter(numGo,denGo,u);
y=yu+filter(numHo,denHo,eol);
   

thhat=bj([y,u],[1 1 0 1 1]);
[thetastar,Ptheta]=th2par(thhat);
[Ahat,Bhat,Chat,Dhat,Fhat]=th2poly(thhat);

Ghat=tf(Bhat,Fhat,1);
denGhat=Fhat;
numHhat=Chat;
Hhat=tf(Chat,[1 0],1);

figure(10)
bode(Ghat,'r',Go,'k')


Fuhat=[1;0;-Ghat]*tf([1 0],denGhat,1)*tf([0 1],numHhat,1);



Fuhat=ss(Fuhat);
Fuhat=ssbal(Fuhat);

Tz=Fuhat*Hhat;

vecrw=[];





vecgmod=[]; vecrw=[]; vecradm=[];
for ii=1:length(wbis),
ii


puls=wbis(ii);

TT=frxav(Tz,puls);

T=[real(TT)' ; imag(TT)'];

Pw=T*Ptheta*T';
lmax=max(eig(Pw));

rrw=2.45*sqrt(lmax);


        gmodw=frxav(Ghat,puls);

radm=relerror*abs(gmodw);

vecgmod=[vecgmod,abs(gmodw)];
vecrw=[vecrw,rrw];
vecradm=[vecradm,radm];
end;





figure(4)
loglog(wbis,vecradm,'k:',wbis,vecrw,'k',wbis,vecgmod,'r')
xlabel('w')
%axis([wbis(1),wbis(end),1e-2,10])


