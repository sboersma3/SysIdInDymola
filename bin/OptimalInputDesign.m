function syshat = OptimalInputDesign(syshat,u,ops)

N   = ops.N;
Nb  = ops.Nb;
Nid = ops.Nid;
ll  = ops.ll;

for kk=1:floor(N/Nb)
    
    syshat{kk*ll*Nb}            = get_Fu_and_Fe(syshat{kk*ll*Nb});
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % three methods to choose the damping coefficients for optimization  
    
    %1) upperbound on variance of lowest damped mode
    [~,temp]                    = min(syshat{kk*ll*Nb}.theta(syshat{kk*ll*Nb}.CritPar));
    ops.alpha                   = diag(syshat{kk*ll*Nb}.P(syshat{kk*ll*Nb}.CritPar(temp),syshat{kk*ll*Nb}.CritPar(temp)));    
    syshat{kk*ll*Nb}.ind        = syshat{kk*ll*Nb}.CritPar(temp);
    
    %2) upperbound on variance of all damping coefficients
    %ops.alpha                   = diag(syshat{kk*ll*Nb}.P(syshat{kk*ll*Nb}.CritPar,syshat{kk*ll*Nb}.CritPar));             
    %syshat{kk*ll*Nb}.ind        = syshat{kk*ll*Nb}.CritPar;
    
    %3) upperbound on variance of lowest damped mode (manually chosen upperbound)
    %[~,temp]                    = min(syshat{kk*ll*Nb}.theta(syshat{kk*ll*Nb}.CritPar));
    %ops.alpha                   = 10e-5;    
    %syshat{kk*ll*Nb}.ind        = syshat{kk*ll*Nb}.CritPar(temp);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    [PHIopt,vecC,C,P]           = get_optimal_spectrum_input(syshat{kk*ll*Nb},ops,kk);
    
    uopt                        = get_optimal_timeseries_input(u(kk*Nid),syshat{kk*ll*Nb}.h,Nid,ops.w,PHIopt);
    Ai                          = sqrt(PHIopt);
    
    syshat{kk*ll*Nb}.Phat       = P;
    syshat{kk*ll*Nb}.uopt       = uopt;
    syshat{kk*ll*Nb}.Aopt       = Ai;
    
end