%Program to compute the optimal number of data in LCID - OL or CL - Phi fixed

%function ndata=sourceNfct(thetai)


chi=12.6;
Nmin=200;
calcul=1;
ident=1;
newol=1;
newcl=1;

alphau=1;
alphay=1;

var_e=0.5;



% open-loop or closed-loop

openloop=0;


cinitcid=1;  %for CL: use of Cinit as Cid or Cgiven

numCgiven=0;
denCgiven=1;
Cgiven=tf(numCgiven,denCgiven,1);


%Spectrum of the signal of the identification

M=0;

corrphiu=[0];







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
wter=[0.001,0.1,0.38,1.3813,2];
%wter=[1,2];
%wter=0.001
%wter=logspace(-3,pi,15)






% %modele initial
% %**************

 
Ai=[1, thetai(1:4)']
Bi=[0, 0, 0, thetai(5:6)'] 

numGi=Bi;
denGi=Ai;
Gi=tf(numGi, denGi, 1); 

numHi=[1 0 0 0 0];
denHi=denGi;

Hi=tf([1 0 0 0 0], denGi, 1);



na=4;
nb=2;
delay=3;
k=6;



    
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




if max(abs(pole(Sid)))>0.99, error('KO KO !!!' ); end;



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
Mbar=alpha;
% Mo=(1/var_e_i)*Fo;
% vecM=(1/var_e_i)*vecFm;

iscPthetath=(Mbar);
   


Nopt=calculNoptol(Nmin,iscPthetath,k,wter,na,nb,delay,chi,Ci,thetai,Wr1,Wr2,Wl1,Wl2);


ndata=ceil(Nopt);

%calcul de Ptheta theorique (just for fun)

