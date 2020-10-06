%calcule le critere general a la frequence OMEGA
%
% Xavier Bombois 06/01/2000

function [wcperf,tauopt,gopt]=worstcaseperformance(e,zn,zd,deltastar,R,X,Y,Wl1,Wl2,Wr1,Wr2)


ll=length(zn);



% calcul de la difference max delatH par LMI
%*************************************

% definition de constantes
%****************************


z1=X*zn+Y*zd;
k=(X'*X*Wr1'*Wr1+Y'*Y*Wr2'*Wr2);

a11c=k*(zd'*zd*Wl2'*Wl2+zn'*zn*Wl1'*Wl1); ba11c=big(a11c);
a11g=(-z1'*z1); ba11g=big(a11g);
a11t=-R; ba11t=big(a11t);

a12c=k*(e*Wl1'*Wl1*zn'+zd'*Wl2'*Wl2); ba12c=big(a12c);
a12g=(-z1'*(Y+e*X)); ba12g=big(a12g);
a12t=R*deltastar; ba12t=big(a12t);

a22c=k*(e'*Wl1'*Wl1*e+Wl2'*Wl2); ba22c=big(a22c);
a22g=(-(Y+e*X)'*(Y+e*X)); ba22g=big(a22g);
a22t=1-deltastar'*R*deltastar; ba22t=big(a22t);

% definition de variable LMI

setlmis([]);
[gamma,ngamma,sgamma]=lmivar(1,[1 0]);
[tau,ntau,stau]=lmivar(1,[1 0]);
[g,ng,sg]=lmivar(2,[ll,1]);

sbigG=[zeros(ll,1),sg;-sg,zeros(ll,1)];

[bigG,nbigG,sbigG]=lmivar(3,sbigG);

% LMI's

lmiterm([-1 1 1 tau],1,1);

lmiterm([-2 1 1 gamma],1,1);

lmiterm([3 1 1 0],ba11c);
lmiterm([3 1 1 gamma],ba11g,1);
lmiterm([3 1 1 tau],ba11t,1); 

lmiterm([3 1 2 0],ba12c);
lmiterm([3 1 2 gamma],ba12g,1);
lmiterm([3 1 2 tau],ba12t,1);
lmiterm([3 1 2 bigG],1,1);

lmiterm([3 2 2 0],ba22c);
lmiterm([3 2 2 gamma],ba22g,1);
lmiterm([3 2 2 tau],ba22t,1);

lmidiff=getlmis;

% cout

cout=[1;0;zeros(ll,1)];

%*********************************** RESOLUTION

options=[1e-2,1000,1e12,10,1];
[coutopt,xopt]=mincx(lmidiff,cout,options);
gammaopt=dec2mat(lmidiff,xopt,1);
tauopt=dec2mat(lmidiff,xopt,2);
gopt=dec2mat(lmidiff,xopt,3);
wcperf=sqrt(gammaopt);
