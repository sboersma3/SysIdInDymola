function  AverageResults = GetAverages(syshat,signals,ops,AverageResults,mm)

N   = ops.N;
Nb  = ops.Nb;
ll  = ops.ll;

for kk=1:floor(N/Nb)
    
    AverageResults.zeta(:,mm)   = syshat{kk*ll*Nb}.zeta;
    
    if mm>1 % assume first estimation is not an outliner..
        if sum(AverageResults.zeta(:,mm) > 10*mean(AverageResults.zeta(:,1:mm-1),2))>=1 
            AverageResults.zeta(:,mm) = [];
            AverageResults.ind(mm)    = mm;
            break
        end
    end
    
    AverageResults.Ptheta(:,mm) = syshat{kk*ll*Nb}.cov_data;
    AverageResults.rho(:,mm)    = syshat{kk*ll*Nb}.theta0;
    AverageResults.Prho(:,mm)   = diag(syshat{kk*ll*Nb}.P_);
    AverageResults.p(:,mm)      = syshat{kk*ll*Nb}.p;
    [mag,~]                     = bode(syshat{kk*ll*Nb}.Gz,ops.w);
    AverageResults.magG(:,mm)   = squeeze(mag);

    AverageResults.yhat(:,mm)   = signals.yhat;
    
end




