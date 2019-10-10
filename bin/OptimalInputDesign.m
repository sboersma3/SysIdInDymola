function syshat = OptimalInputDesign(syshat,u,ops)

N   = ops.N;
Nb  = ops.Nb;
ll  = ops.ll;
h   = ops.h;

for kk=1:floor(N/Nb)
    
    syshat{kk*ll*Nb}            = get_Fu_and_Fe(syshat{kk*ll*Nb});
    
    ops.alpha                   = diag(syshat{kk*ll*Nb}.P_(syshat{kk*ll*Nb}.CritPar,syshat{kk*ll*Nb}.CritPar));    % upperbound on variance constrained parameter
    
    [PHIopt,vecC,C,P]           = get_optimal_spectrum_input(syshat{kk*ll*Nb},ops);
    
    uopt                        = get_optimal_timeseries_input(u(kk*ll*Nb/h),syshat{kk*ll*Nb}.h,ops.Nid,ops.w,PHIopt);
    Ai                          = sqrt(PHIopt);
    
    syshat{kk*ll*Nb}.P          = P;
    syshat{kk*ll*Nb}.uopt       = uopt;
    syshat{kk*ll*Nb}.Ai         = Ai;
    
end