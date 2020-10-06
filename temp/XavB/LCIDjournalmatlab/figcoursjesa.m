load vecradmjesa

load jesawhite 

load jesaflex



wbis=logspace(-3,pi,100);
figure(1)
loglog(wbis,vecradm,'r',wbis,vecrw,'b:',wbis,vecrwwhite,'k--')
xlabel('\omega')
axis([wbis(1),wbis(end),0.01,100]);

