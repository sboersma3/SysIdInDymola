function [PHIopt,vecC,C,P] = get_optimal_spectrum_input(syshat,ops,ll)

Nid            = ops.Nid;
Nw             = ops.Nw;
Np             = length(ops.alpha);
ind            = syshat.ind;

h              = syshat.h;
G              = syshat.G;
Delay          = syshat.Delay;
vare           = syshat.vare;
Fu             = syshat.Fu;
Fe             = syshat.Fe;
wn             = syshat.wn;

Fuw            = freqresp(Fu,ops.w);
M              = [];
for kk=1:Nw
    M = [M,(Nid/vare/2)*real(Fuw(:,:,kk)*Fuw(:,:,kk)')];
end

Q         = Fe.b*Fe.b';
X         = dlyap(Fe.a,Q);
Mbar      = Nid*Fe.c*X*Fe.c'+Fe.d*Fe.d';
nx        = size(Mbar,1);

% term in cost when a weight on the output is applied
Gw        = freqresp(G*Delay,ops.w);
C         = zeros(1,Nw);
for kk=1:Nw
    C(kk) =  real(Gw(:,:,kk)*Gw(:,:,kk)');
end

% merge weights c1 and c2 for cost
vecC  = (ops.c1*ones(1,Nw) + ops.c2*C)/2;

% matrix with unit vectors
BB    = eye(size(Mbar,1));

setlmis([])

[~,~,sPHI]       = lmivar(2,[Nw 1]);
sPHIdiag         = diag(sPHI);
diagPHI          = lmivar(3,sPHIdiag);
blkdiagPHIs      = kron(sPHI,eye(nx));
[blkdiagPHI,~,~] = lmivar(3,blkdiagPHIs);


for kk=1:Np
    lmiterm([-kk 1 1 0],ops.alpha(kk))
    lmiterm([-kk 2 1 0],BB(:,ind(kk)))
    lmiterm([-kk 2 2 0],Mbar)                       % N*C*X*C'
    lmiterm([-kk 2 2 blkdiagPHI],M,1/2,'s')         % N/vare/2 * sum ( PHI * real(Fuw*Fuw') ), with Fuw = dG/H
end

lmiterm([-(Np+1),1,1,diagPHI],1,1)

lmis           = getlmis;
options        = [1e-4,100,1e12,10,1];              %[accuracy, max_it, feas_rad, , ]

[copt,xopt]    = mincx(lmis,vecC,options);

% make sure you do not apply an infeasible solution
if ~isempty(xopt)
    PHIopt      = dec2mat(lmis,xopt,1);
else
    disp(' ')
    disp(['no feasible solution found for batch ', num2str(ll)])
    disp(' ')
    PHIopt      = eps*ones(Nw,1);
end


% check constraint on var(zeta_i)
% note that here the combination Gi,Hi,A{i+1} are used
P     = inv(Mbar + M * kron(PHIopt,eye(nx))); % covariance matrix
diagP = diag(P);
for kk=1:Np
    disp(' ')
    disp(['the variance and its upperbound are: ',num2str([diagP(ind(kk)) ops.alpha(kk)]),' for batch ',num2str(ll)])
    disp(' ')
end





