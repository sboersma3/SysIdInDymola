%Program to compute the reference signal in LCID - OL or CL- N fixed

clear
close all

chi=12.6;
M=10;

calcul=1;
ident=1;
newol=1;
newcl=1;
ndata=500;

var_e=0.5;

%modelinit: true system =1 other=0
modelinit=0;

% open-loop or closed-loop

openloop=0;

alphau=1;
alphay=1;
wbis=logspace(-3,pi,100);
wter=[0.001,0.1,0.395,1.3813,2];

%wter=[0.001,0.1,0.38,1,1.3813,1.8,2];
wter=wbis;
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

var_e_i=0.5265;   %var_e;



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

Fuold=Fu;
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


%error('c')

% Computation of Phi

if calcul==1
vecradm=[];
    for iii=1:length(wter),
        puls=wter(iii);
        cc=frxav(Ci,puls);
        gmodw=frxav(Gi,puls);
    radm=admS(inv(W1),gmodw,cc,puls);
vecradm=[vecradm,radm];
end;

% vecradm=vecradm(1)*ones(size(vecradm))
% vecradm2=vecradm;    
    corrphiu=optphiold(begincout,Mbar,Mo,vecM,M,k,ndata,wter,na,nb,delay,chi,Ci,thetai,vecradm,Fuold,Ho);

%optphiold%(begincout,Mbar,Mo,vecM,M,k,ndata,wter,na,nb,delay,chi,Ci,thetai,vecradm,Fuold,Ho);

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

if ident==1
    
if openloop==1
    
% SIMULATION EN BOUCLE OUVERTE
%*****************************
if newol==1
   if M==0
      u=sqrt(corrphiu)*randn(ndata,1);
   else u=inpsignal(M,corrphiu,ndata);
   end;
   
      
      %uol=sqrt(varuol)*idinput(ndata,'prbs',[0 1]);
   %uol=stepseries(ndata,80,400,varuol);
   eol=sqrt(var_e)*randn(ndata,1);
	save openloopdata.mat u eol
else 
	load openloopdata.mat
end; 
yu=filter(numGo,denGo,u);
y=yu+filter(numHo,denHo,eol);
   

    
else
if newcl==1
    
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
	save closedloopdata.mat rcl ecl
else 
	load closedloopdata.mat
end; 

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
[Ahat,Bhat]=th2poly(thhat);
display('le centre de Dol est: num-den')
numerateurGhat=Bhat
denominateurGhat=Ahat
Ghat=tf(numerateurGhat,denominateurGhat,1);
figure(10)
bode(Ghat,'r',Go,'k',Gi,'b')

Ghat=Gi; Ptheta=Pthetath;

% Design d'un C with Gmod
%*************************
[numGmod,denGmod]=tfdata(Ghat,'v');
designHinfLandau

C=tf(numC,denC,1);


if strange==0

%CALCUL WCASE PERF
template=abs(frxav(inv(W1),wbis));
Smod=abs(frxav(inv(1+C*Ghat),wbis));

[Afu,Bfu,Cfu,Dfu]=detFu(Ghat);

Fuhat=ss(Afu,Bfu,Cfu,Dfu,1);
Fuhat=ssbal(Fuhat);

Tz=Fuhat*ss(tf([1 0 0 0 0],denominateurGhat,1));

vecrw=[];





vecwc=[]; vecrw=[]; vecradm=[];
for ii=1:length(wbis),
ii


puls=wbis(ii);

TT=frxav(Tz,puls);

T=[real(TT)' ; imag(TT)'];

Pw=T*Ptheta*T';
lmax=max(eig(Pw));

rrw=sqrt(chi*lmax);

cc=frxav(C,puls);
        gmodw=frxav(Ghat,puls);

radm=admS(inv(W1),gmodw,cc,puls);


vecrw=[vecrw,rrw];
vecradm=[vecradm,radm];
end;





figure(4)
loglog(wbis,vecradm,'k:',wbis,vecrw,'k')
xlabel('w')
%axis([wbis(1),wbis(end),1e-2,10])



end;

end;
% if openloop==1
% 
%        
%     [fol,vecol]=calculFsid(Go,M);
% bgo=[fol,vecol]';
% 
%    
%     [fol,vecol]=calculFsid(Gi,M);
% bg=[fol,vecol]';
% 
%   
%     
%     disp('Number of data')
% disp(ndata)
% 
% disp('Power of u(t) THEORETICAL and achieved')
% disp([corrphiu(1),var(u)])
% 
% disp('Power of y(t) due to u(t) theorique, theorique with Go, et pratique')
% disp([bg'*corrphiu,bgo'*corrphiu,var(yu)])
% 
% disp('Power of y(t)  theorique, theorique with Go, et pratique')
% disp([bg'*corrphiu+H2power(Hi)*var_e_i,bgo'*corrphiu+H2power(Ho)*var_e,var(y)])
% 
% else
%     
%  [fclu,vclu]=calculFsid(Sido,M);
% buo=[fclu,vclu]';
% 
% [fcly,vcly]=calculFsid(GSido,M);
% byo=[fcly,vcly]';
% 
 [fclu,vclu]=calculFsid(Sid,M);
 bu=[fclu,vclu]';
% 
 [fcly,vcly]=calculFsid(GSid,M);
 by=[fcly,vcly]';
%     
% disp('Number of data')
% disp(ndata)
% 
% disp('Power of r(t) THEORETICAL and achieved')
% disp([corrphiu(1),var(rcl)])
% 
% disp('Power of u(t) theoretical, theo with Go and achieved')
% disp([bu'*corrphiu+H2power(CSid*Hi)*var_e_i,buo'*corrphiu+H2power(CSido*Ho)*var_e,var(u)])
% 
% disp('Power of u(t) due to r(t) theorique et pratique')
% disp([bu'*corrphiu,buo'*corrphiu,var(uclr)])
% 
% disp('Power of y(t) theoretical and achieved')
% disp([by'*corrphiu+H2power(Sid*Hi)*var_e_i,byo'*corrphiu+H2power(Sido*Ho)*var_e,var(y)])
% 
% disp('Power of y(t) due to r(t) theorique et pratique')
% disp([by'*corrphiu,byo'*corrphiu,var(yclr)])
% 
 disp('Jr')
 disp([by'*corrphiu+bu'*corrphiu])
% 
% end;
% 
% end;
% 
% 
% 
% 
% if openloop==0
% 
% 
% 
% vecs=abs(frxav(Sid,w)).^2;
% vecgs=abs(frxav(GSid,w)).^2;
% veccsh=abs(frxav(CSid*Hi,w)).^2;
% vecsh=abs(frxav(Sid*Hi,w)).^2;
% 
% vecconstpouru=veccsh*var_e_i;
% vecconstpoury=vecsh*var_e_i;
% 
% vecso=abs(frxav(Sido,w)).^2;
% vecgso=abs(frxav(GSido,w)).^2;
% veccsho=abs(frxav(CSido*Ho,w)).^2;
% vecsho=abs(frxav(Sido*Ho,w)).^2;
% 
% vecconstpouruo=veccsho*var_e;
% vecconstpouryo=vecsho*var_e;
%     
% 
% phiu=vecs.*phiuw+vecconstpouru; phiur=vecs.*phiuw;
% phiuo=vecso.*phiuw+vecconstpouru; phiuro=vecso.*phiuw;
% phiy=vecgs.*phiuw+vecconstpoury; phiyr=vecgs.*phiuw;
% phiyo=vecgso.*phiuw+vecconstpouryo; phiyro=vecgso.*phiuw;
%     
% 
% 
% else
% 
% 
% vecg=abs(frxav(Gi,w)).^2;
% vech=abs(frxav(Hi,w)).^2;
% vecconstpoury=vech*var_e_i;
% 
% vecgo=abs(frxav(Go,w)).^2;
% vecho=abs(frxav(Ho,w)).^2;
% vecconstpouryo=vecho*var_e;
% 
% 
%     
% 
% phiu=phiuw; phiur=phiu;
% phiuo=phiu; phiuro=phiu;
% phiy=vecg.*phiuw+vecconstpoury; phiyr=vecg.*phiuw;
% phiyo=vecgo.*phiuw+vecconstpouryo; phiyro=vecgo.*phiuw;
%     
% 
% end;
%     
%     
% if constraintsup==1
%     
%     figure(100)
%     if openloop==0
%     loglog(w,phiu,'r',w,phiuo,'r--',w,pum*ones(size(w)),'k',w,phiur,'b',w,phiuro,'b--',w,vecconstpouru,'g',w,vecconstpouruo,'g--')
% else loglog(w,phiu,'r',w,phiuo,'r--',w,pum*ones(size(w)),'k',w,phiur,'b',w,phiuro,'b--'); end;
%     figure(101)
%     
%     loglog(w,phiy,'r',w,phiyo,'r--',w,pym*ones(size(w)),'k',w,phiyr,'b',w,phiyro,'b--',w,vecconstpoury,'g',w,vecconstpouryo,'g--')
%     
% else
%     
%     
%     figure(100)
%     if openloop==0
%     loglog(w,phiu,'r',w,phiuo,'r--',w,phiur,'b',w,phiuro,'b--',w,vecconstpouru,'g',w,vecconstpouruo,'g--')
% else loglog(w,phiu,'r',w,phiuo,'r--',w,phiur,'b',w,phiuro,'b--'); end;
%     figure(101)
%     
%     loglog(w,phiy,'r',w,phiyo,'r--',w,phiyr,'b',w,phiyro,'b--',w,vecconstpoury,'g',w,vecconstpouryo,'g--')
% end;
%    
% 
end;