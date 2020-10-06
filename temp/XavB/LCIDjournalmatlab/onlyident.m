%Program to compute the optimal number of data in LCID - OL or CL - Phi fixed

clear
close all

ndata=10000;

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


numGo=[0 0.1047 0.0872];
denGo=[1 -1.5578 0.5769];

Go=ss(tf(numGo, denGo, 1)); delay=1;
Go=balreal(Go);

numHo=[1 1.6 0.64];

denHo=denGo;

% numHo=[1 0 0];
% denHo=denGo;

Ho=ss(tf(numHo, denHo, 1));

%thetao=[denGo(2:end), numGo((delay+1):end)]';
% na=length(denGo)-1;
% nb=length(numGo)-delay;
% k=4


%Model initial for the BJ identif

Bi=numGo;
Fi=denGo;
Ci=numHo;
Di=denHo;
varei=var_e;

Mi=IDPOLY([],Bi,Ci,Di,Fi,varei,1);

    
% Design d'un Cinit with Gi
%*************************

numC=[1.8664 -1.3647];
denC=[1 -0.4545 ];

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
%thhat=bj([y,u],Mi);
thhat=bj([y,u],[2,2,2,2,delay]);
%thhat=arx([y,u],[2,2,delay]);
[thetastar,Ptheta]=th2par(thhat);
[Ahat,Bhat,Chat,Dhat,Fhat]=th2poly(thhat);
display('le centre de Dol est: num-den')
numerateurGhat=Bhat
denominateurGhat=Fhat
Ghat=tf(numerateurGhat,denominateurGhat,1);
present(thhat)
tf(Go)

figure(10)
bode(Ghat,'r',Go,'k')


%Determination Fu(z,thetainit)

%[Afu,Bfu,Cfu,Dfu]=detFu(Go);
 
G1=ss(tf([1 0 0],Fhat,1));
ze=ss(tf(0,1,1));

%Fu=[-delayf(1)*Go*inv(Ho)*G1;-delayf(2)*Go*inv(Ho)*G1;ze;ze;ze;ze;delayf(1)*G1*inv(Ho);delayf(2)*G1*inv(Ho)];

%Fu=ss(Afu,Bfu,Cfu,Dfu,1);
%Fu=ssbal(Fu);


% Fu *Ho

Fu1=[delayf(1)*G1;delayf(2)*G1;ze;ze;ze;ze;-delayf(1)*Go*G1;-delayf(2)*Go*G1];
Fu1=ssbal(Fu1);

% %Fe
% 
% [Afe,Bfe,Cfe,Dfe]=detFe(Ho,2,2,4);
% Fe=ss(Afe,Bfe,Cfe,Dfe,1);
% Fe=minreal(ssbal(Fe));
% 
% if openloop==0
% 
% Fr=Sido*Fu;
% Fr=ssbal(Fr);
% Febis=Fe-CSido*Ho*Fu;
% Febis=ssbal(Febis);
% 
% Fu=minreal(Fr);
% Fe=minreal(Febis);

Fe=ssbal(-CSido*Fu1);
%Fe=minreal(Fe);
end;

%Design Fm-FE

[Fo,vecFm,alpha]=calculFmarx(tf(1,1,1),Fe,3);

alpha=[alpha(1:2,1:2),alpha(1:2,7:8);alpha(7:8,1:2),alpha(7:8,7:8)];
Pth=[Ptheta(1:2,1:2),Ptheta(1:2,7:8);Ptheta(7:8,1:2),Ptheta(7:8,7:8)]
Pthest=inv(ndata*alpha)