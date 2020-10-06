load resultoptimal

vecrwo=vecrw;
vecradmo=vecradm;

load resultwhite

wbis=logspace(-3,pi);
figure(1)
loglog(wbis,vecradm,'r',wbis,vecrw,'k',wbis,vecrwo,'b')
xlabel('\omega')
axis([wbis(1),wbis(end),0.01,100]);


load signalopt

rclo=rcl;
uclro=uclr;
yclro=yclr;

load signalwhite

t=1:500;


figure(2);
SUBPLOT(2,1,1), 
plot(t,uclro,'b');  
axis([1,500,-15,15]);
SUBPLOT(2,1,2), 
plot(t,uclr,'k'); 
axis([1,500,-15,15]);


figure(3);
SUBPLOT(2,1,1), 
plot(t,yclro,'b');  
axis([1,500,-15,15]);
SUBPLOT(2,1,2), 
plot(t,yclr,'k'); 
axis([1,500,-15,15]);


figure(4);
SUBPLOT(2,1,1), 
plot(t,rclo,'b');  
axis([1,500,-15,15]);
SUBPLOT(2,1,2), 
plot(t,rcl,'k'); 
axis([1,500,-15,15]);
