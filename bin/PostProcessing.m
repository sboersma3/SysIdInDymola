function results = PostProcessing(sys,syshat,signals,ops)

N       = ops.N;
Nb      = ops.Nb;
ll      = ops.ll;
h       = ops.h;

tend    = signals.tend;

zetahat = []; wnhat = [];
for kk=1:floor(N/Nb)
    zetahat = [zetahat repmat(syshat{kk*ll*Nb}.zeta,1,Nb*ll/h)];
    wnhat   = [wnhat repmat(syshat{kk*ll*Nb}.wn,1,Nb*ll/h)];
end
zeta    = repmat(sys{1*ll}.zeta,1,ll/h); 
wn      = repmat(sys{1*ll}.wn,1,ll/h);
for kk=1:N-1
    zeta    = [zeta repmat(sys{kk*ll}.zeta,1,ll/h)];
    wn      = [wn repmat(sys{kk*ll}.wn,1,ll/h)]; 
end

% for only the identified modes at the beginning of each batch
for kk=1:floor(N/Nb)
    [zeta_1,ind]        = sort(zeta(:,(kk-1)*ll*Nb/h+1));
    wn_1                = wn(ind,(kk-1)*ll*Nb/h+1);
    ind                 = find(zeta_1 > .8); % take out first order and high damped modes
    zeta_1(ind)         = [];
    wn_1(ind)           = [];
    [zetahat_1,ind]     = sort(zetahat(:,(kk-1)*ll*Nb/h+1));
    wnhat_1             = wnhat(ind,(kk-1)*ll*Nb/h+1);
    ind                 = find(zetahat_1 > .99); % take out first order modes
    zetahat_1(ind)      = [];
    wnhat_1(ind)        = [];

    zeta_i(:,kk)        = zeta_1;
    wn_i(:,kk)          = wn_1;
    zetahat_i(:,kk)     = zetahat_1;
    wnhat_i(:,kk)       = wnhat_1;
end

results.pct_y       = mean(abs((signals.yhat(1:tend)-signals.y(1:tend))./signals.y(1:tend)))*100;
results.zeta        = zeta;
results.wn          = wn;
results.zetahat     = zetahat;
results.wnhat       = wnhat;
results.zeta_i      = zeta_i;
results.wn_i        = wn_i;
results.zetahat_i   = zetahat_i;
results.wnhat_i     = wnhat_i;