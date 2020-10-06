load resultoptimal

vecrwo=vecrw;
vecradmo=vecradm;

load signalopt

rclo=rcl;
uclro=uclr;
yclro=yclr;


load resultwhite2000

wbis=logspace(-3,pi);
figure(1)
loglog(wbis,vecradm,'r',wbis,vecrw,'k',wbis,vecrwo,'b')
xlabel('\omega')
axis([wbis(1),wbis(end),0.01,100]);







t=1:1000;


figure(2);
SUBPLOT(2,1,1), 
plot(t,[uclro;zeros(size(uclro))],'b');  
axis([1,1000,-15,15]);
SUBPLOT(2,1,2), 
plot(t,uclr,'k'); 
axis([1,1000,-15,15]);


figure(3);
SUBPLOT(2,1,1), 
plot(t,[yclro;zeros(size(uclro))],'b');  
axis([1,1000,-15,15]);
SUBPLOT(2,1,2), 
plot(t,yclr,'k'); 
axis([1,1000,-15,15]);


figure(4);
SUBPLOT(2,1,1), 
plot(t,[rclo;zeros(size(uclro))],'b');  
axis([1,1000,-15,15]);
SUBPLOT(2,1,2), 
plot(t,rcl,'k'); 
axis([1,1000,-15,15]);
