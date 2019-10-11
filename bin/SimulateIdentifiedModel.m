function signals = SimulateIdentifiedModel(syshat,signals,ops)

N   = ops.N;
Nb  = ops.Nb;
ll  = ops.ll;
h   = ops.h;

for kk=1:floor(N/Nb)
    t1                   = floor(Nb*(kk-1)*ll/h+1);
    t2                   = floor(Nb*kk*ll/h);
    [yhat,~,~]           = compare(iddata(signals.y(t1:t2)',signals.u(t1:t2)',h),syshat{kk*ll*Nb}.sys);
    signals.yhat(t1:t2)  = yhat.y;
end


signals.tend = length(signals.yhat);
