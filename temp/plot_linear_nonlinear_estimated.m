t1 = 1;
t2 = 1000;
Nb = ops.Nb;
kk = 1;
ll = ops.ll;

signals.xhat(:,t1)	= 0*syshat{kk*ll*Nb}.sys0.c\signals.y(1);
signals.xhatv(:,t1)	= zeros(size(syshat{kk*ll*Nb}.H.a,1),1);

signals.x(:,t1)	    = 0*sys{kk*ll}.Gid.c\signals.y(1);
signals.xv(:,t1)	= zeros(size(sys{kk*ll}.Hid.a,1),1);

for mm=t1:t2
    
    signals.xhatv(:,mm+1)   = syshat{kk*ll*Nb}.H.a * signals.xhatv(:,mm) + syshat{kk*ll*Nb}.H.b * signals.e(:,mm) * sqrt(syshat{kk*ll*Nb}.vare);
    signals.vhat(:,mm)      = syshat{kk*ll*Nb}.H.c * signals.xhatv(:,mm) + syshat{kk*ll*Nb}.H.d * signals.e(:,mm) * sqrt(syshat{kk*ll*Nb}.vare);
    
    signals.xhat(:,mm+1)    = syshat{kk*ll*Nb}.G.a * signals.xhat(:,mm) + syshat{kk*ll*Nb}.G.b * signals.u(:,mm);
    signals.yhat(:,mm)      = syshat{kk*ll*Nb}.G.c * signals.xhat(:,mm) + syshat{kk*ll*Nb}.G.d * signals.u(:,mm) + signals.vhat(:,mm) + signals.y(1);
    
    
    signals.xv(:,mm+1)   = sys{kk*ll}.Hid.a * signals.xv(:,mm) + sys{kk*ll*Nb}.Hid.b * signals.e(:,mm) * sqrt(syshat{kk*ll*Nb}.vare);
    signals.v(:,mm)      = sys{kk*ll}.Hid.c * signals.xv(:,mm) + sys{kk*ll*Nb}.Hid.d * signals.e(:,mm) * sqrt(syshat{kk*ll*Nb}.vare);
    
    signals.x(:,mm+1)    = sys{kk*ll}.Gid.a * signals.x(:,mm) + sys{kk*ll*Nb}.Gid.b * signals.u(:,mm);
    signals.yl(:,mm)     = sys{kk*ll}.Gid.c * signals.x(:,mm) + sys{kk*ll*Nb}.Gid.d * signals.u(:,mm) + signals.v(:,mm) + signals.y(1);
    
    
end

figure(110);clf
plot(signals.yhat,'r--');hold on;
plot(signals.yl,'b');
plot(signals.y,'k--');grid
title('Estimated model (red), linear Dymola model (blue) and nonlinear Dymola model (black)')

