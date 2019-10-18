function [PHIopt,vecC,C,P] = get_optimal_spectrum_input(syshat,ops)

Nid            = ops.Nid; 
Nw             = ops.Nw;
Np             = length(syshat.CritPar);
CritPar        = syshat.CritPar;

h              = syshat.h;
Gz             = syshat.Gz;
vare           = syshat.vare;
Fuz            = syshat.Fuz;
Fez            = syshat.Fez;
wn             = syshat.wn;

Fuw            = freqresp(Fuz,ops.w);
M              = [];
for kk=1:Nw
    M = [M,(Nid/vare/2)*real(Fuw(:,:,kk)*Fuw(:,:,kk)')];    % (Nid/vare/2/h)  *real(Fuw(:,:,kk)*Fuw(:,:,kk)')
end


[a,b,c,d] = ssdata(balreal(minreal(Fez)));
Q         = b*b';
X         = dlyap(a,Q);
Mbar      = Nid*c*X*c'+d*d';
nx        = size(Mbar,1);

% term in cost when a weight on the output is applied
Gw        = freqresp(Gz,ops.w);
C         = zeros(1,Nw);
for kk=1:Nw
    C(kk) =  real(Gw(:,:,kk)*Gw(:,:,kk)');
end

% merge weights c1 and c2 for cost
vecC  = (ops.c1*ones(1,Nw) + ops.c2*C)/2;

% matrix with unit vectors
BB    = eye(size(Mbar,1));


[a,b,c,d] = ssdata(balreal(minreal(Fuz)));
Q         = b*b';
X         = dlyap(a,Q);
Fo        = c*X*c' + d*d';
vecFm     = [];
for kk    = 1:Nw
    Fmpos  = c*(a^kk)*X*c' + d*d';
    Fmneg  = Fmpos';
    Fm     = Fmpos + Fmneg;
    vecFm  = [vecFm, Fm];
end
vecM      = (Nid/vare)*[Fo vecFm];


[a,b,c,d] = ssdata(syshat.G);
Q         = b*b';
X         = dlyap(a,Q);
Fo        = c*X*c' + d*d';
vecFm     = [];
for kk    = 1:Nw
    Fmpos = c*(a^kk)*X*c'+c*(a^(kk-1))*b*d';
    Fmneg = Fmpos';
    Fm    = Fmpos + Fmneg;
    vecFm = [vecFm, Fm];
end
vecC      = [Fo vecFm];


cvx_begin sdp;
cvx_precision('default')
cvx_solver sdpt3

% decision variables
variable RB(Nw+1,1)              % crosscorrelation of FIR excitation
variable Q(Nw,Nw) symmetric

% information matrix (inverse covariance matrix)
R      = Mbar;
for kk = 1:Nw+1
    MI = vecM(:,(kk-1)*nx+1:kk*nx);
    R  = R + MI*RB(kk);
end
R      = tril(R)+tril(R,-1)';

% cost
minimize(vecC*RB);

% constraints
subject to

% 1) upperbound variance
for kk=1:Np
    [ops.alpha(kk) BB(:,CritPar(kk))' ; BB(:,CritPar(kk))  R] >= 0;
end

% 2) positivity constraint
B    = [1;zeros(Nw-1,1)];
A    = [zeros(1,Nw-1),0;eye(Nw-1),zeros(Nw-1,1)];
C    = RB(2:Nw+1)';
D    = RB(1);

[Q-A'*Q*A C'-A'*Q*B;
    C-B'*Q*A D-B'*Q*B] >= 0;

cvx_end

PHIopt = RB';

% check constraint on var(zet_i)
Pinv      = Mbar;
for kk    = 1:Nw+1
    MI    = vecM(:,(kk-1)*nx+1:kk*nx);
    Pinv  = Pinv + MI*RB(kk);
end
P     = inv(Pinv);
diagP = diag(P);
for kk=1:Np
    [diagP(CritPar(kk)) ops.alpha(kk)]
end



