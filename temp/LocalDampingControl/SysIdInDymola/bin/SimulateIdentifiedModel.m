function [syshat,signals] = SimulateIdentifiedModel(syshat,signals,ops)

N    = ops.N;
Nb   = ops.Nb;
Nid  = ops.Nid;
Nido = ops.Nido;
ll   = ops.ll;
h    = ops.h;
ho   = ops.ho;

for kk=1:floor(N/Nb)
    t1                    = (kk-1)*Nid+1;
    t2                    = kk*Nid;   
    [yhat,~,~]            = compare(iddata(signals.y(t1:t2)',signals.u(t1:t2)',h),syshat{kk*ll*Nb}.sys);
    signals.yhat(t1:t2)   = yhat.y;
    
    t1                    = (kk-1)*Nido+1;
    t2                    = kk*Nido;     
    [yhato,fit,~]         = compare(iddata(signals.yo(t1:t2)',signals.uo(t1:t2)',ho),d2d(syshat{kk*ll*Nb}.sys,ho));
    signals.yhato(t1:t2)  = yhato.y;
    syshat{kk*ll*Nb}.fito = fit;
end

