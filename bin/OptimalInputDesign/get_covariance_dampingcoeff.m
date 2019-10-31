function syshat = get_covariance_dampingcoeff(syshat,ops)


syshat         = get_Fu_and_Fe(syshat);

Nid            = ops.Nid;
Nw             = length(syshat.wi);

vare           = syshat.vare;
Fuz            = syshat.Fuz;
Fez            = syshat.Fez;

Fuw            = freqresp(Fuz,syshat.wi);
M              = [];
for kk=1:Nw
    M = [M,(Nid/vare/2)*real(Fuw(:,:,kk)*Fuw(:,:,kk)')];    % (Nid/vare/2/h)  *real(Fuw(:,:,kk)*Fuw(:,:,kk)')
end


[a,b,c,d] = ssdata(minreal(ss(Fez),[],false));
Q         = b*b';
X         = dlyap(a,Q);
Mbar      = Nid*c*X*c'+d*d';
nx        = size(Mbar,1);


% covariance matrix
syshat.P  = inv(Mbar + M * kron(syshat.Ai.^2,eye(nx)));