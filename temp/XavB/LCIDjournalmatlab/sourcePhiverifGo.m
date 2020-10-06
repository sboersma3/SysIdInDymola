%Program to compute the reference signal in LCID - OL or CL- N fixed

clear
close all
wbis=logspace(-3,pi);

M=10;
test=1000;
calcul=1;
ident=1;
newol=1;
newcl=1;
ndata=60;



%chi=chi2inv(0.95,6);
chi=6*Finv(0.95,6,ndata-6);

%error('c')

var_e=0.5;

%modelinit: true system =1 other=0
modelinit=0;

% open-loop or closed-loop

openloop=0;

alphau=1;
alphay=1;

wter=[0.001,0.1,0.39,1.3813,2];
%wter=[wbis,0.393,1.3813];

%wter=[0.001,0.1,0.38,1,1.3813,1.8,2];

constraintsup=0;

pum=25;
pym=2000;

phiumax=pum*ones(1,length(wter));
phiymax=pym*ones(1,length(wter));

powerr=0;  %for CL, you can opt on the power of r or on theone of given in the paper 

cinitcid=1;  %for CL: use of Cinit as Cid or Cgiven

numCgiven=0;
denCgiven=1;
Cgiven=tf(numCgiven,denCgiven,1);


%perfspec

numW1=[0.5165 -0.4632];
denW1=[1 -0.999455];
W1=tf(numW1,denW1,1);

Wl2=W1;
Wr2=tf(1,1,1);
Wl1=tf(0,1,1);
Wr1=tf(0,1,1);

strange=0;


%frequence vector

w=logspace(-3,pi,200);
wbis=logspace(-3,pi);
%wter=[0.001 0.3 0.38 0.4  1];
%wter=[wbis(1),wbis(36),wbis(38),wbis(43)];

%wter=[1,2];
%wter=0.001
%wter=logspace(-3,pi,15)

% true system


numGo=[0 0 0 0.10276 0.18123];
denGo=[1 -1.99185 2.20265 -1.84083 0.89413];

Go=ss(tf(numGo, denGo, 1)); delay=3;
Go=balreal(Go);

numHo=[1 0 0 0 0];

denHo=denGo;
Ho=ss(tf([1 0 0 0 0], denGo, 1));
Ho=balreal(Ho);

thetao=[denGo(2:end), numGo((delay+1):end)]';
na=length(denGo)-1;
nb=length(numGo)-delay;
k=6



% %modele initial
% %**************

if modelinit==1

    
numGi=numGo;
denGi=denGo;
Gi=tf(numGi, denGi, 1); 

numHi=[1 0 0 0 0];
denHi=denGi;

Hi=tf([1 0 0 0 0], denGi, 1);

thetai=[denGi(2:end), numGi((delay+1):end)]';

var_e_i=var_e;

else 


load modelinitial2
numGi=Bhat;
denGi=Ahat;
Gi=tf(numGi, denGi, 1); 

numHi=[1 0 0 0 0];
denHi=denGi;

Hi=tf([1 0 0 0 0], denGi, 1);

thetai=[denGi(2:end), numGi((delay+1):end)]';

var_e_i=0.5265   %var_e;



end;



    
% Design d'un Cinit with Gi
%*************************
[numGmod,denGmod]=tfdata(Gi,'v');
designHinfLandau
Cid=tf(numC,denC,1);
Cid=ss(Cid);
Cid=ssbal(Cid);
Ci=Cid;

if openloop==0 
if cinitcid==1
    %use of Cinit as C for the identification
    Cid=Ci;
else
    Cid=Cgiven;
end;


Sid=inv(1+Cid*Gi);
Sid=ssbal(Sid);
CSid=Cid*Sid;
CSid=ssbal(CSid);
Tid=Gi*CSid;
Tid=ssbal(Tid);
GSid=Gi*Sid;
GSid=ssbal(GSid);


    
end;

%Determination Fu(z,thetainit)

[Afu,Bfu,Cfu,Dfu]=detFu(Gi);

Fu=ss(Afu,Bfu,Cfu,Dfu,1);
Fu=ssbal(Fu);


%Fe

[Afe,Bfe,Cfe,Dfe]=detFe(Hi,na,nb,k);
Fe=ss(Afe,Bfe,Cfe,Dfe,1);
Fe=ssbal(Fe);

if openloop==0

Fr=Sid*Fu;
Fr=ssbal(Fr);
Febis=Fe-CSid*Hi*Fu;
Febis=ssbal(Febis);

Fu=minreal(Fr);
Fe=minreal(Febis);

end;

%Design Fm-FE

[Fo,vecFm,alpha]=calculFmarx(Fu,Fe,M);
Mbar=ndata*alpha;
Mo=(ndata/var_e_i)*Fo;
vecM=(ndata/var_e_i)*vecFm;

% Cout pour l'optimisation

alphatradeoff=alphau;
betatradeoff=alphay;

if openloop==1
    
[fso,vecfs]=calculFsid(Gi,M);
bbbxy=[fso,vecfs]';


begincout=alphatradeoff*[1;zeros(M,1)]+betatradeoff*bbbxy;
    
else

[fso,vecfs]=calculFsid(Sid,M);
bbbx=[fso,vecfs]';
[fsoy,vecfsy]=calculFsid(GSid,M);
bbbxy=[fsoy,vecfsy]';
    
if powerr==1
begincout=[1;zeros(M,1)];
else
begincout=betatradeoff*bbbxy+alphatradeoff*bbbx;
end;

end;

% Computation of Phi

if calcul==1

    
    if constraintsup==0
corrphiu=optphi(begincout,Mbar,Mo,vecM,M,k,ndata,wter,na,nb,delay,chi,Ci,thetai,Wr1,Wr2,Wl1,Wl2);
else
   corrphiu=optphics(begincout,Mbar,Mo,vecM,M,k,ndata,wter,na,nb,delay,chi,Ci,thetai,Wr1,Wr2,Wl1,Wl2,phiumax,phiymax,var_e_i,Gi,Hi,openloop);
end;
save lastphi corrphiu
 
else load lastphi
    
end;




phiuw=ones(1,length(w))*corrphiu(1); 
for ii=1:M,
   phiuw=phiuw+corrphiu(ii+1)*2*cos(w.*ii);
   
end;

figure(2)
loglog(w,phiuw,'r')

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
%kkkk=1; 
vecerror=[]; kkkinit=1;
for kkkk=kkkinit:test,
    kkkk
    
Sido=inv(1+Cid*Go);
Sido=ssbal(Sido);
CSido=Cid*Sido;
CSido=ssbal(CSido);
Tido=Go*CSido;
Tido=ssbal(Tido);
GSido=Go*Sido;
GSido=ssbal(GSido);
    
   if M==0
   rcl=sqrt(corrphiu)*randn(ndata,1);
   else rcl=inpsignal(M,corrphiu,ndata);
   end;
   
      
     
   ecl=sqrt(var_e)*randn(ndata,1);
	

vv=filter(numHo,denHo,ecl);
[ncs,dcs]=tfdata(CSido,'v');
[ns,ds]=tfdata(Sido,'v');
[nt,dt]=tfdata(Tido,'v');
[ngs,dgs]=tfdata(GSido,'v');
uclr=filter(ns,ds,rcl);
u=uclr-filter(ncs,dcs,vv);
yclr=filter(ngs,dgs,rcl);
y=yclr+filter(ns,ds,vv);
    
    
    


thhat=arx([y,u],[na,nb,delay]);
[thetastar,Ptheta]=th2par(thhat);
[Ahat,Bhat]=th2poly(thhat);
% display('le centre de Dol est: num-den')
 numerateurGhat=Bhat;
 denominateurGhat=Ahat;
Ghat=tf(numerateurGhat,denominateurGhat,1);



% Design d'un C with Gmod
%*************************
[numGmod,denGmod]=tfdata(Ghat,'v');
designHinfLandau;

C=tf(numC,denC,1);
template=abs(frxav(inv(W1),wbis));
So=minreal(ssbal(inv(1+C*Go)));
pSo=max(abs(pole(So)));

if pSo<1
    fso=abs(frxav(So,wbis));
vecerror=[vecerror, max((fso-template)./fso)];

else
    vecerror=[vecerror,2];
    
end;



end;
DATA=ndata
 MAXERROR=max(vecerror)
MEANERROR=mean(vecerror)
STDEV=sqrt(var(vecerror))
TESTERRORMIN5PR=length(find(vecerror<0.05))
TESTOK=length(find(vecerror<0))   

