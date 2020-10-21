function signals = SimulateIdentifiedModel(syshat,signals,ops)

N   = ops.N;
Nb  = ops.Nb;
Nid = ops.Nid;
ll  = ops.ll;
h   = ops.h;

for kk=1:floor(N/Nb)
    t1                   = (kk-1)*Nid+1;
    t2                   = kk*Nid;   
    [yhat,~,~]           = compare(iddata(signals.y(t1:t2)',signals.u(t1:t2)',h),syshat{kk*ll*Nb}.sys);
    signals.yhat(t1:t2)  = yhat.y;
end
