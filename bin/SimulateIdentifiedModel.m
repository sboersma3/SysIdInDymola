function signals = SimulateIdentifiedModel(syshat,signals,ops)

N   = ops.N;
Nb  = ops.Nb;
ll  = ops.ll;
h   = ops.h;

for kk=1:floor(N/Nb)
    t1                   = floor(Nb*(kk-1)*ll/h+1);
    t2                   = floor(Nb*kk*ll/h);
%     signals.xhat(:,t1)	= syshat{kk*ll*Nb}.x0;
%     %signals.xhat(:,t1)	= syshat{kk*ll*Nb}.G.c\(signals.y(t1)-syshat{kk*ll*Nb}.G.d*signals.u(t1));
%     signals.xhatv(:,t1)	= zeros(size(syshat{kk*ll*Nb}.H.a,1),1);
%     for mm=t1:t2
%         
%         signals.xhatv(:,mm+1)   = syshat{kk*ll*Nb}.H.a * signals.xhatv(:,mm) + syshat{kk*ll*Nb}.H.b * signals.e(:,mm) * sqrt(syshat{kk*ll*Nb}.vare);
%         signals.vhat(:,mm)      = syshat{kk*ll*Nb}.H.c * signals.xhatv(:,mm) + syshat{kk*ll*Nb}.H.d * signals.e(:,mm) * sqrt(syshat{kk*ll*Nb}.vare);        
%         
%         signals.xhat(:,mm+1)    = syshat{kk*ll*Nb}.G.a * signals.xhat(:,mm) + syshat{kk*ll*Nb}.G.b * signals.u(:,mm);
%         signals.yhat(:,mm)      = syshat{kk*ll*Nb}.G.c * signals.xhat(:,mm) + syshat{kk*ll*Nb}.G.d * signals.u(:,mm) + signals.vhat(:,mm);
%     end

    [yhat,~,~]           = compare(iddata(signals.y(t1:t2)',signals.u(t1:t2)',h),syshat{kk*ll*Nb}.sys);
    signals.yhat(t1:t2)  = yhat.y;
end


signals.tend = length(signals.yhat);
