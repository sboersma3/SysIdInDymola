%Program to compute the optimal number of data in LCID - OL or CL - Phi fixed

clear
close all

ndata=5000;

var_e=0.5;
var_r=0;
var_u=1;


% open-loop or closed-loop

openloop=0;




%frequence vector

w=logspace(-3,pi,200);
wbis=logspace(-3,pi);
%wter=[0.001 0.3 0.38 0.4  1];
%wter=[wbis(1),wbis(36),wbis(38),wbis(43)];
wter=[0.001,0.1,0.38,1.3813,2];
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

    
% Design d'un Cinit with Gi
%*************************

% Design d'un Cinit with Gi
%*************************
[numGmod,denGmod]=tfdata(Go,'v');
designHinfLandau
Cid=tf(numC,denC,1);
Cid=ss(Cid);
Cid=ssbal(Cid);




% IDENTIF
%**********************


    
if openloop==1
    
% SIMULATION EN BOUCLE OUVERTE
%*****************************

   
   
    
   
       
      u=sqrt(var_u)*randn(ndata,1);
   
   eol=sqrt(var_e)*randn(ndata,1);
	
yu=filter(numGo,denGo,u);
y=yu+filter(numHo,denHo,eol);
   

    
else

    
   Sido=inv(1+Cid*Go);
Sido=ssbal(Sido);
CSido=Cid*Sido;
CSido=ssbal(CSido);
Tido=Go*CSido;
Tido=ssbal(Tido);
GSido=Go*Sido;
GSido=ssbal(GSido);
    


   rcl=sqrt(var_r)*randn(ndata,1);
   
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
    
    
    
end;


thhat=arx([y,u],[na,nb,delay]);
[thetastar,Ptheta]=th2par(thhat);
[Ahat,Bhat,Chat,Dhat,Fhat]=th2poly(thhat);
display('le centre de Dol est: num-den')
numerateurGhat=Bhat
denominateurGhat=Ahat
Ghat=tf(numerateurGhat,denominateurGhat,1);
present(thhat)
tf(Go)

figure(10)
bode(Ghat,'r',Go,'k')


%Determination Fu(z,thetainit)

[Afu,Bfu,Cfu,Dfu]=detFu(Go);

Fu=ss(Afu,Bfu,Cfu,Dfu,1);
Fu=ssbal(Fu);


%Fe

[Afe,Bfe,Cfe,Dfe]=detFe(Ho,na,nb,k);
Fe=ss(Afe,Bfe,Cfe,Dfe,1);
Fe=ssbal(Fe);

if openloop==0

Fr=Sido*Fu;
Fr=ssbal(Fr);
Febis=Fe-CSido*Ho*Fu;
Febis=ssbal(Febis);

Fu=minreal(Fr);
Fe=minreal(Febis);

end;


%Design Fm-FE

[Fo,vecFm,alpha]=calculFmarx(Fu,Fe,3);

Ptheta
Pthest=inv(ndata*alpha)