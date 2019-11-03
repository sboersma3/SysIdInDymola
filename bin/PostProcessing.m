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

zeta    = repmat(sys{1*ll}.zeta,1,Nid/Nb); 
wn      = repmat(sys{1*ll}.wn,1,Nid/Nb);
for kk=1:N-1
    zeta    = [zeta repmat(sys{kk*ll}.zeta,1,Nid/Nb)];
    wn      = [wn repmat(sys{kk*ll}.wn,1,Nid/Nb)]; 
end
% when #zeta and #wn change (needs to be checked)
% for kk=1:N
%    n_zeta(kk) = length(sys{kk*ll}.zeta); 
%    n_wn(kk)   = length(sys{kk*ll}.wn); 
% end
% M_zeta = max(n_zeta);
% M_wn   = max(n_wn);
% zeta   = nan*ones(M_zeta,N*Nid/Nb); 
% wn     = nan*ones(M_wn,N*Nid/Nb); 
% for kk=1:N
%     zeta(1:n_zeta(kk),(kk-1)*Nid/Nb+1:kk*Nid/Nb) = repmat(sys{kk*ll}.zeta,1,Nid/Nb);
%     wn(1:n_wn(kk),(kk-1)*Nid/Nb+1:kk*Nid/Nb)     = repmat(sys{kk*ll}.wn,1,Nid/Nb);
% end

% for only the identified modes at the beginning of each batch
for kk=1:floor(N/Nb)
    [zeta_1,ind]        = sort(zeta(:,(kk-1)*Nid+1));
    wn_1                = wn(ind,(kk-1)*Nid+1);
    %ind                 = find(zeta_1 > .8); % take out first order and high damped modes
    %zeta_1(ind)         = [];
    %wn_1(ind)           = [];
    
    [zetahat_1,ind]     = sort(zetahat(:,(kk-1)*Nid+1));
    wnhat_1             = wnhat(ind,(kk-1)*Nid+1);
    %ind                 = find(zetahat_1 > .99); % take out first order modes
    %zetahat_1(ind)      = [];
    %wnhat_1(ind)        = [];

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