% calcule phiu asvec Ptheta compris dans le LMI
%
% Xavier Bombois 14/11/03


function N=calculNoptol(Nmin,Rsc,k,w,na,nb,delay,size,C,deltastar,Wl1tf,Wl2tf,Wr1tf,Wr2tf)



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





[N,nN,sN]=lmivar(2,[1 1]);








for iii =1:sizew, eval(['[tau',num2str(iii),',ntau',num2str(iii),']=lmivar(1,[1 1]);']); end;


%************************************ variables utilisées dans lmiterm



e=0;
Y=1;





%*********************************** contraintes LMI

lmiterm([-1,1,1,N],1,1);
lmiterm([-1,1,1,0],-Nmin);




counter=1;


    
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




lmiterm([counter,1,1,N],-Rsc,1);


eval(['lmiterm([counter, 1, 2, tau',num2str(jjj),'],a12,1);']);

%lmiterm([counter,1,2,tau1],a12,1);

%lmiterm([counter,1,2,R],1,deltastar);



lmiterm([counter,1,2,N],Rsc,deltastar);


eval(['lmiterm([counter, 2, 2, tau',num2str(jjj),'],a22,1);']);


%lmiterm([counter,2,2,tau1],a22,1);
%lmiterm([counter,2,2,R],-deltastar',deltastar);


lmiterm([counter,2,2,0],size);

lmiterm([counter,2,2,N],-deltastar'*Rsc,deltastar);



end;



kappaopt=getlmis;



%*********************************** détermination du vecteur c


eval(['c = [1;zeros(ntau',num2str(sizew),'-1,1)];']);







%*********************************** RESOLUTION
% flag=0;
% options=[1e-4,1000,1e9,10,flag];
% [coutopt,xopt]=mincx(kappaopt,c,options);
% 
% xx=xopt;

flag=0;
options=[1e-4,1000,1e12,10,flag];
[coutopt,xopt]=mincx(kappaopt,c,options);
N=dec2mat(kappaopt,xopt,1);

