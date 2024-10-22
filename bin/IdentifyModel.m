function syshat = IdentifyModel(signals,ops)

N   = ops.N;
Nb  = ops.Nb;
Nid = ops.Nid;
ll  = ops.ll;
h   = ops.h;
na  = ops.na;
nb  = ops.nb;
nc  = ops.nc;
nk  = ops.nk;
u   = signals.u;
y   = signals.y;

optPEM = armaxOptions('Focus','prediction','InitialCondition' ,'auto','EnforceStability',true);

for kk=1:floor(N/Nb)
    t1                          = (kk-1)*Nid+1;
    t2                          = kk*Nid;
    
    syshat{kk*ll*Nb}.sys        = armax(iddata(y(t1:t2)',u(t1:t2)',h),[na nb nc nk],optPEM);
       
    [den,numG,numH,~,~]         = polydata(syshat{kk*ll*Nb}.sys);
    numH                        = [numH zeros(1,length(den)-length(numH))];
    syshat{kk*ll*Nb}.den        = den;
    syshat{kk*ll*Nb}.numG       = numG;
    syshat{kk*ll*Nb}.numH       = numH;
    syshat{kk*ll*Nb}.G          = ss(tf(numG,den,h));
    syshat{kk*ll*Nb}.H          = ss(tf(numH,den,h));
    syshat{kk*ll*Nb}.Delay      = ss(tf(1,[1 0],h)^syshat{kk*ll*Nb}.sys.nk);
    syshat{kk*ll*Nb}.na         = syshat{kk*ll*Nb}.sys.na;
    syshat{kk*ll*Nb}.nb         = syshat{kk*ll*Nb}.sys.nb;
    syshat{kk*ll*Nb}.nc         = syshat{kk*ll*Nb}.sys.nc;
    syshat{kk*ll*Nb}.nk         = syshat{kk*ll*Nb}.sys.nk;
    
    syshat{kk*ll*Nb}.vare       = syshat{kk*ll*Nb}.sys.NoiseVariance;
    syshat{kk*ll*Nb}.h          = syshat{kk*ll*Nb}.G.Ts;
    
    syshat{kk*ll*Nb}.cov_data   = diag(getcov(syshat{kk*ll*Nb}.sys));
    syshat{kk*ll*Nb}.fit        = syshat{kk*ll*Nb}.sys.report.Fit.FitPercent;
    
    % estimated damping ratios and modes
    [~,D]                       = eig(syshat{kk*ll*Nb}.G.a,'vector');
    D                           = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
    syshat{kk*ll*Nb}.p        	= D;                                    % poles
    D                           = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
    syshat{kk*ll*Nb}.zeta       = abs(-real(log(D))./abs(log(D)));      % damping ratios
    syshat{kk*ll*Nb}.zeta(isnan(syshat{kk*ll*Nb}.zeta)) = 1;
    syshat{kk*ll*Nb}.wn         = abs(log(D)/h);                        % natural frequency
    
    syshat{kk*ll*Nb}.nr         = size(D(imag(D)==0),1);
    syshat{kk*ll*Nb}.ni         = size(sort(D(imag(D)~=0)),1)/2;
    
    syshat{kk*ll*Nb}.CritPar    = [];
    for mm=1:syshat{kk*ll*Nb}.ni
        syshat{kk*ll*Nb}.CritPar = [syshat{kk*ll*Nb}.CritPar syshat{kk*ll*Nb}.nr+2*mm];     % element number of parameter vector that has constrained variance
    end
    
    syshat{kk*ll*Nb}            = get_spectrum_input(syshat{kk*ll*Nb},signals,ops,kk);
    syshat{kk*ll*Nb}            = get_covariance_dampingcoeff(syshat{kk*ll*Nb},ops);
    
    
end