% calcule phiu asvec Ptheta compris dans le LMI
%
% Xavier Bombois 14/11/03


function phiucorr=optphi(begincout,barM,M0,vecM,M,k,ndata,w,na,nb,delay,size,C,deltastar,Wl1tf,Wl2tf,Wr1tf,Wr2tf)



%freq resp

sizew=length(w);


m=nb;
n=na;

vecX=frxav(C,w);
wwl1=frxav(Wl1tf,w);
wwr1=frxav(Wr1tf,w);
wwl2=frxav(Wl2tf,w);
wwr2=frxav(Wr2tf,w);



vectzn=[];
vectzd=[];

for ii=1:length(w),

zn=[];
zd=[];
puls=w(ii);

for kk=1:n,

zd=[zd,invexpxav(kk,puls)];

end;
zd=[zd,zeros(1,k-n)];
vectzd=[vectzd;zd];

for kk=1:m,

zn=[zn,invexpxav(kk+(delay-1),puls)];

end;
zn=[zeros(1,n),zn];
vectzn=[vectzn;zn];

end;

%*******************************************************************************************************

setlmis([]);





[sigma,nsigma,ssigma]=lmivar(2,[1 1]);

if M>0
[corrvec,ncorrvec,scorrvec]=lmivar(2,[M 1]);  %corresponds to C^T


[QQ,nQQ,sQQ]=lmivar(1,[M 1]);






scoo=[kroprod(scorrvec,eye(k))];
    



[coo,ncoo,scoo]=lmivar(3,scoo);

end;



for iii =1:sizew, eval(['[tau',num2str(iii),',ntau',num2str(iii),']=lmivar(1,[1 1]);']); end;


%************************************ variables utilisées dans lmiterm

if M>0
Bpos=[1;zeros(M-1,1)];
Apos=[zeros(1,M-1),0;eye(M-1),zeros(M-1,1)];
end;


e=0;
Y=1;

dbarm=deltastar'*barM;    
dmo=deltastar'*M0;    
dvecm=deltastar'*vecM;
barmd=barM*deltastar;




%*********************************** contraintes LMI

lmiterm([-1,1,1,sigma],1,1);



if M>0
lmiterm([-2,1,1,QQ],1,1);
lmiterm([-2,1,1,QQ],-Apos',Apos);
lmiterm([-2,1,2,QQ],-Apos',Bpos);
lmiterm([-2,1,2,corrvec],1,1);

lmiterm([-2,2,2,sigma],1,0.5,'s');
lmiterm([-2,2,2,QQ],-Bpos',Bpos);

counter=2;
else counter=1;
end;


    
for iii =1:sizew, 
    
    counter=counter+1;
    
    
    eval(['lmiterm([-counter, 1, 1, tau',num2str(iii),'],1,1);']); 
    
    
    
end;






for jjj =1:sizew, 

% Freq 1
 
counter=counter+1;


 X=vecX(jjj);
 zn=vectzn(jjj,:);
    zd=vectzd(jjj,:);
    Wr1=wwr1(jjj);
    Wl1=wwl1(jjj);
    Wr2=wwr2(jjj);
    Wl2=wwl2(jjj);
    
z1=X*zn+Y*zd;
Q=inv(X'*X*Wr1'*Wr1+Y'*Y*Wr2'*Wr2);

a11=real(zd'*zd*Wl2'*Wl2+zn'*zn*Wl1'*Wl1-Q*z1'*z1);


a12=real(e*Wl1'*Wl1*zn'+zd'*Wl2'*Wl2-Q*z1'*(Y+e*X));


a22=real(e'*Wl1'*Wl1*e+Wl2'*Wl2-Q*(Y+e*X)'*(Y+e*X));

eval(['lmiterm([counter, 1, 1, tau',num2str(jjj),'],a11,1);']);
    
%lmiterm([counter,1,1,tau1],a11,1);


lmiterm([counter,1,1,0],-barM);

lmiterm([counter,1,1,sigma],-M0,1);

if M>0 lmiterm([counter,1,1,coo],-vecM,1); end;

eval(['lmiterm([counter, 1, 2, tau',num2str(jjj),'],a12,1);']);

%lmiterm([counter,1,2,tau1],a12,1);

%lmiterm([counter,1,2,R],1,deltastar);

lmiterm([counter,1,2,0],barmd);

lmiterm([counter,1,2,sigma],M0,deltastar);
if M>0 lmiterm([counter,1,2,coo],vecM,deltastar); end;

eval(['lmiterm([counter, 2, 2, tau',num2str(jjj),'],a22,1);']);


%lmiterm([counter,2,2,tau1],a22,1);
%lmiterm([counter,2,2,R],-deltastar',deltastar);


lmiterm([counter,2,2,0],size-dbarm*deltastar);

lmiterm([counter,2,2,sigma],-dmo,deltastar);
if M>0 lmiterm([counter,2,2,coo],-dvecm,deltastar); end;


end;



kappaopt=getlmis;



%*********************************** détermination du vecteur c


eval(['c = [begincout;zeros(ntau',num2str(sizew),'-M-1,1)];']);







%*********************************** RESOLUTION
% flag=0;
% options=[1e-4,1000,1e9,10,flag];
% [coutopt,xopt]=mincx(kappaopt,c,options);
% 
% xx=xopt;

flag=1;
options=[1e-4,1000,1e12,10,flag];
[coutopt,xopt]=mincx(kappaopt,c,options);
sigmaopt=dec2mat(kappaopt,xopt,1);
if M>0 corrvecopt=dec2mat(kappaopt,xopt,2); 
phiucorr=[sigmaopt;corrvecopt]; 
else phiucorr=sigmaopt; end;
