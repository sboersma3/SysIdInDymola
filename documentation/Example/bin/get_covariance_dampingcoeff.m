function syshat = get_covariance_dampingcoeff(syshat,N)


syshat         = get_Fu_and_Fe(syshat);

Nw             = length(syshat.w);

vare           = syshat.vare;
Fu             = syshat.Fu;
Fe             = syshat.Fe;

Fuw            = freqresp(Fu,syshat.w);
M              = [];
for kk=1:Nw
    M = [M,(N/vare/2)*real(Fuw(:,:,kk)*Fuw(:,:,kk)')];    % (Nid/vare/2/h)  *real(Fuw(:,:,kk)*Fuw(:,:,kk)')
end

Q         = Fe.b*Fe.b';
X         = dlyap(Fe.a,Q);
Mbar      = N*Fe.c*X*Fe.c'+Fe.d*Fe.d';
nx        = size(Mbar,1);


% covariance matrix
syshat.P       = inv(Mbar + M * kron(syshat.Ai.^2,eye(nx)));
syshat.P_zeta  = diag(syshat.P(syshat.CritPar,syshat.CritPar));