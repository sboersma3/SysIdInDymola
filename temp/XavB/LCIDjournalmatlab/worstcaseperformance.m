%calcule le critere general a la frequence OMEGA
%
% Xavier Bombois 06/01/2000

function [wcperf]=worstcaseperformance(e,zn,zd,deltastar,R,X,Y,Wl1,Wl2,Wr1,Wr2)






% calcul de la difference max delatH par LMI
%*************************************

% definition de constantes
%****************************


z1=X*zn+Y*zd;
k=inv(X'*X*Wr1'*Wr1+Y'*Y*Wr2'*Wr2);

a11c=real(zd'*zd*Wl2'*Wl2+zn'*zn*Wl1'*Wl1);
a11g=real(-k*z1'*z1);
a11t=-R;

a12c=real(e*Wl1'*Wl1*zn'+zd'*Wl2'*Wl2);
a12g=real(-k*z1'*(Y+e*X));
a12t=R*deltastar;

a22c=real(e'*Wl1'*Wl1*e+Wl2'*Wl2);
a22g=real(-k*(Y+e*X)'*(Y+e*X));
a22t=1-deltastar'*R*deltastar;

% definition de variable LMI

setlmis([]);
[gamma,ngamma,sgamma]=lmivar(1,[1 0]);
[tau,ntau,stau]=lmivar(1,[1 0]);


% LMI's

lmiterm([-1 1 1 tau],1,1);

lmiterm([-2 1 1 gamma],1,1);

lmiterm([3 1 1 0],a11c);
lmiterm([3 1 1 gamma],a11g,1);
lmiterm([3 1 1 tau],a11t,1); 

lmiterm([3 1 2 0],a12c);
lmiterm([3 1 2 gamma],a12g,1);
lmiterm([3 1 2 tau],a12t,1);

lmiterm([3 2 2 0],a22c);
lmiterm([3 2 2 gamma],a22g,1);
lmiterm([3 2 2 tau],a22t,1);

lmidiff=getlmis;

% cout

cout=[1;0];

%*********************************** RESOLUTION

options=[1e-2,1000,1e12,10,1];
[coutopt,xopt]=mincx(lmidiff,cout,options);
gammaopt=dec2mat(lmidiff,xopt,1);
tauopt=dec2mat(lmidiff,xopt,2);

wcperf=sqrt(gammaopt);
