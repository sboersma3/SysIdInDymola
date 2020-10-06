 

close all
clear
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

ndata=500;
wbis=logspace(-3,pi);

%%% exp1

load data_disc1_comp
%u1=sqrt(1.7014)*randn(ndata,1);
  
      
      %uol=sqrt(varuol)*idinput(ndata,'prbs',[0 1]);
   %uol=stepseries(ndata,80,400,varuol);
   %eol=sqrt(var_e)*randn(ndata,1);

yu=filter(numGo,denGo,u1);
y=yu+filter(numHo,denHo,eol);
   

thhat1=bj([y,u1],[1 1 0 1 1]);
[thetastar1,Ptheta1]=th2par(thhat1);
[Ahat,Bhat,Chat,Dhat,Fhat]=th2poly(thhat1);

Ghat1=tf(Bhat,Fhat,1);
denGhat1=Fhat;
numHhat1=Chat;
Hhat1=tf(Chat,[1 0],1);



Fuhat=[1;0;-Ghat1]*tf([1 0],denGhat1,1)*tf([0 1],numHhat1,1);



Fuhat=ss(Fuhat);
Fuhat=ssbal(Fuhat);

Tz=Fuhat*Hhat1;







vecgmod1=[]; vecrw1=[]; 
for ii=1:length(wbis),
ii


puls=wbis(ii);

TT=frxav(Tz,puls);

T=[real(TT)' ; imag(TT)'];

Pw=T*Ptheta1*T';
lmax=max(eig(Pw));

rrw=2.45*sqrt(lmax);


        gmodw=frxav(Ghat1,puls);



vecgmod1=[vecgmod1,abs(gmodw)];
vecrw1=[vecrw1,rrw];

end;


figure(2)
loglog(wbis,vecrw1,'k',wbis,vecgmod1,'r')
xlabel('w')
%axis([wbis(1),wbis(end),1e-2,10])


%error('c')
%%% exp2

t=(0:ndata-1);
u2=0.75*cos(0.15*t);
  
      
      %uol=sqrt(varuol)*idinput(ndata,'prbs',[0 1]);
   %uol=stepseries(ndata,80,400,varuol);
   %eol=sqrt(var_e)*randn(ndata,1);

yu=filter(numGo,denGo,u2');
y=yu+filter(numHo,denHo,eol);
   

thhat2=bj([y,u2'],[1 1 0 1 1]);
[thetastar2,Ptheta2]=th2par(thhat2);
[Ahat,Bhat,Chat,Dhat,Fhat]=th2poly(thhat2);

Ghat2=tf(Bhat,Fhat,1);
denGhat2=Fhat;
numHhat2=Chat;
Hhat2=tf(Chat,[1 0],1);



Fuhat=[1;0;-Ghat2]*tf([1 0],denGhat2,1)*tf([0 1],numHhat2,1);



Fuhat=ss(Fuhat);
Fuhat=ssbal(Fuhat);

Tz=Fuhat*Hhat2;







vecgmod2=[]; vecrw2=[]; 
for ii=1:length(wbis),
ii


puls=wbis(ii);

TT=frxav(Tz,puls);

T=[real(TT)' ; imag(TT)'];

Pw=T*Ptheta2*T';
lmax=max(eig(Pw));

rrw=2.45*sqrt(lmax);


        gmodw=frxav(Ghat2,puls);



vecgmod2=[vecgmod2,abs(gmodw)];
vecrw2=[vecrw2,rrw];

end;

figure(1)
subplot(2,1,1), plot(t,u1);
axis([1,500,-4,4]); ylabel('u_1(t)')
subplot(2,1,2), plot(t,u2); ylabel('u_2(t)'); xlabel('time')
axis([0,500,-4,4]);

figure(4)
semilogx(wbis,vecrw1/2.45,'r-.', wbis,vecrw2/2.45,'b')
xlabel('\omega')
%axis([wbis(1),wbis(end),0.015,0.065])



