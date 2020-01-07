function results = PostProcessing(sys,syshat,ops)

N       = ops.N;
Nb      = ops.Nb;
Nid     = ops.Nid;
ll      = ops.ll;

zetahat = []; wnhat = [];
for kk=1:floor(N/Nb)
    zetahat = [zetahat repmat(syshat{kk*ll*Nb}.zeta,1,Nid)];
    wnhat   = [wnhat repmat(syshat{kk*ll*Nb}.wn,1,Nid)];
end

zeta    = []; wn    = [];
for kk=1:N
    zeta    = [zeta repmat(sys{kk*ll}.zeta,1,Nid/Nb)];
    wn      = [wn repmat(sys{kk*ll}.wn,1,Nid/Nb)]; 
end

% for only the identified modes at the beginning of each batch
for kk=1:floor(N/Nb)
    [zeta_1,ind]        = sort(zeta(:,(kk-1)*Nid+1));
    wn_1                = wn(ind,(kk-1)*Nid+1);
    
    [zetahat_1,ind]     = sort(zetahat(:,(kk-1)*Nid+1));
    wnhat_1             = wnhat(ind,(kk-1)*Nid+1);

    zeta_i(:,kk)        = zeta_1;
    wn_i(:,kk)          = wn_1;
    zetahat_i(:,kk)     = zetahat_1;
    wnhat_i(:,kk)       = wnhat_1;
end

results.zeta        = zeta;
results.wn          = wn;
results.zetahat     = zetahat;
results.wnhat       = wnhat;
results.zeta_i      = zeta_i;
results.wn_i        = wn_i;
results.zetahat_i   = zetahat_i;
results.wnhat_i     = wnhat_i;