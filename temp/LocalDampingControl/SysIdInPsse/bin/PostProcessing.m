function results = PostProcessing(syshat,ops)

N       = ops.N;
Nb      = ops.Nb;
Nid     = ops.Nid;
ll      = ops.ll;

zetahat = []; wnhat = [];
for kk=1:floor(N/Nb)
    zetahat = [zetahat repmat(syshat{kk*ll*Nb}.zeta,1,Nid)];
    wnhat   = [wnhat repmat(syshat{kk*ll*Nb}.wn,1,Nid)];
end

% for only the identified modes at the beginning of each batch
for kk=1:floor(N/Nb)
    
    [zetahat_1,ind]     = sort(zetahat(:,(kk-1)*Nid+1));
    wnhat_1             = wnhat(ind,(kk-1)*Nid+1);

    zetahat_i(:,kk)     = zetahat_1;
    wnhat_i(:,kk)       = wnhat_1;
end

results.zetahat     = zetahat;
results.wnhat       = wnhat;
results.zetahat_i   = zetahat_i;
results.wnhat_i     = wnhat_i;