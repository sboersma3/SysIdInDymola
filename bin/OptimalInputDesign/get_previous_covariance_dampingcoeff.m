function syshat = get_previous_covariance_dampingcoeff(syshat,ops)


syshat         = get_Fu_and_Fe(syshat);

Nid            = ops.Nid;
Nw             = length(ops.w);

vare           = syshat.vare;
Fuz            = syshat.Fuz;
Fez            = syshat.Fez;

Fuw            = freqresp(Fuz,ops.w);
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
syshat.P_ = inv(Mbar + M * kron(syshat.Ai_.^2,eye(nx)));
