% calcule phiu asvec Ptheta compris dans le LMI
%
% Xavier Bombois 14/11/03


function phiucorr=optphi(begincout,Mbar,M0,vecM,M,k,ndata,w,size,vecradm,Fu,Ho)



%freq resp

sizew=length(w);



%vecX=frxav(C,w);

Tz=Fu*Ho;


vectzn=[];
vectzd=[];

for ii=1:length(w),

zn=[];
zd=[];
puls=w(ii);


zd=[0,0,invexpxav(1,puls)];
vectzd=[vectzd;zd];

zn=[invexpxav(1,puls),0,0];
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


%************************************ variables utilisées dans lmiterm

if M>0
Bpos=[1;zeros(M-1,1)];
Apos=[zeros(1,M-1),0;eye(M-1),zeros(M-1,1)];
end;


e=0;
Y=1;





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








for jjj =1:sizew, 

% Freq 1
 
counter=counter+1;

puls=w(jjj);

TT=frxav(Tz,puls);

T=[real(TT)' ; imag(TT)'];

radm=vecradm(jjj);

constante=((radm*radm)/(size*size))*eye(2);

lmiterm([-counter,1,1,0],constante);
lmiterm([-counter,1,2,0],T);
lmiterm([-counter,2,2,0],Mbar);


lmiterm([-counter,2,2,sigma],M0,1);
if M>0 lmiterm([-counter,2,2,coo],vecM,1); end;

% constante=-((size*size)/(radm*radm))*T'*T;
% 
% lmiterm([-counter,1,1,0],constante);
% lmiterm([-counter,1,1,0],Mbar);
% 
% 
% lmiterm([-counter,1,1,sigma],M0,1);
% if M>0 lmiterm([-counter,1,1,coo],vecM,1); end;


end;




kappaopt=getlmis;



%*********************************** détermination du vecteur c

if M>0
c = [begincout;zeros(nQQ-M-1,1)];
else
c=begincout;
end;




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
