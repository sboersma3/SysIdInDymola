function syshat = OptimalInputDesign(syshat,u,ops)

N   = ops.N;
Nb  = ops.Nb;
Nid = ops.Nid;
ll  = ops.ll;

for kk=1:floor(N/Nb)
    
    syshat{kk*ll*Nb}            = get_Fu_and_Fe(syshat{kk*ll*Nb});
    
    ops.alpha                   = diag(syshat{kk*ll*Nb}.P(syshat{kk*ll*Nb}.CritPar,syshat{kk*ll*Nb}.CritPar));    % upperbound on variance constrained parameter
    
    [PHIopt,vecC,C,P]           = get_optimal_spectrum_input(syshat{kk*ll*Nb},ops);
    
    uopt                        = get_optimal_timeseries_input(u(kk*Nid),syshat{kk*ll*Nb}.h,Nid,ops.w,PHIopt);
    Ai                          = sqrt(PHIopt);
    
    syshat{kk*ll*Nb}.Phat       = P;
    syshat{kk*ll*Nb}.uopt       = uopt;
    syshat{kk*ll*Nb}.Aopt       = Ai;
    
end