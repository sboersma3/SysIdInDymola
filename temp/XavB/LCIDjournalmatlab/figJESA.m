load corjesa
load controller



numGo=[0 0 0 0.10276 0.18123];
denGo=[1 -1.99185 2.20265 -1.84083 0.89413];

Go=ss(tf(numGo, denGo, 1)); delay=3;
Go=balreal(Go);

numHo=[1 0 0 0 0];

denHo=denGo;
Ho=ss(tf([1 0 0 0 0], denGo, 1));
Ho=balreal(Ho);


 Sido=inv(1+Cid*Go);
Sido=ssbal(Sido);

GSido=Go*Sido;
GSido=ssbal(GSido);
[ngs,dgs]=tfdata(GSido,'v');

rwhite=sqrt(3.2191)*randn(1000,1);
rcl2=inpsignal(10,corrphiu,500);
rwhite2=sqrt(7.64)*randn(500,1);  


rwhite=[rwhite;ones(100,1)];
rcl=[rcl2;ones(600,1)];
   



yclr=filter(ngs,dgs,rcl);

yclrwh=filter(ngs,dgs,rwhite);

yclrwh2=filter(ngs,dgs,rwhite2);

yclr2=filter(ngs,dgs,rcl2);

    
    





t=1:length(rwhite);





figure(3);
SUBPLOT(2,1,1), 
plot(t,yclr,'b');  
axis([1,length(t),-15,15]);
SUBPLOT(2,1,2), 
plot(t,yclrwh,'k'); 
axis([1,length(t),-15,15]);


figure(4);
SUBPLOT(2,1,1), 
plot(t,rcl,'b');  
axis([1,length(t),-15,15]);
SUBPLOT(2,1,2), 
plot(t,rwhite,'k'); 
axis([1,length(t),-15,15]);


t2=1:length(rwhite2);





figure(1);
SUBPLOT(2,1,1), 
plot(t2,yclr2,'b');  
axis([1,length(t2),-15,15]);
SUBPLOT(2,1,2), 
plot(t2,yclrwh2,'k'); 
axis([1,length(t2),-15,15]);


figure(2);
SUBPLOT(2,1,1), 
plot(t2,rcl2,'b');  
axis([1,length(t2),-15,15]);
SUBPLOT(2,1,2), 
plot(t2,rwhite2,'k'); 
axis([1,length(t2),-15,15]);
