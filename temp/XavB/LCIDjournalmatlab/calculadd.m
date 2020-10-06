% calcule la worst case chordal distance
%
% Xavier Bombois 06/01/2000


function kappa=calcuwccd(z2,z1,thetastar,R,x,flag)

%ici z2=zn , z1=zd, thetastar=deltahat e=0, x=Gmod(jw)
%******************************************************


% définition des variables utilisées (pas LMI)

%*************************************** fréquence


k=length(thetastar);






%************************************  variables LMI

setlmis([]);
[gamma,ngamma,sgamma]=lmivar(2,[1 1]);
[tau,ntau,stau]=lmivar(2,[1 1]);



%************************************ variables utilisées dans lmiterm
%const=1+x'*x;
const=1;
a11bis=real(-z1'*z1);
a11=real(z2'*z2-z2'*x*z1-z1'*x'*z2+z1'*x'*x*z1);

a22=-1+(thetastar'*R*thetastar);
a22bis=x'*x;
a12=real(z1');
a12bis=real(z1'*x'*x-z2'*x);

%*********************************** contraintes LMI

lmiterm([-1,1,1,tau],1,1);
lmiterm([2,1,1,0],a11);
lmiterm([2,1,1,gamma],1,a11bis);
lmiterm([2,1,1,tau],1,-R);
lmiterm([2,1,2,gamma],-1,a12);
lmiterm([2,1,2,0],a12bis);
lmiterm([2,1,2,tau],1,R*thetastar);
lmiterm([2,2,2,gamma],-1,1);
lmiterm([2,2,2,tau],1,-a22);
lmiterm([2,2,2,0],a22bis);

kappaopt=getlmis;


%*********************************** détermination du vecteur c

% les variables sont gamma,tau



c = [1;0];



%*********************************** RESOLUTION

options=[1e-2,1000,1e12,10,flag];
[coutopt,xopt]=mincx(kappaopt,c,options);
gammaopt=dec2mat(kappaopt,xopt,1);
tauopt=dec2mat(kappaopt,xopt,2);

kappa=sqrt(gammaopt);

