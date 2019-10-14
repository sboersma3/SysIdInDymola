function [PHIopt,vecC,C,P] = get_optimal_spectrum_input(syshat,ops)

fir            = 0;
lmitool_matlab = 1;

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

if fir
    
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
    
else
    
    if lmitool_matlab
        
        
        setlmis([])
        
        [~,~,sPHI]       = lmivar(2,[Nw 1]);
        sPHIdiag         = diag(sPHI);
        diagPHI          = lmivar(3,sPHIdiag);
        blkdiagPHIs      = kron(sPHI,eye(nx));
        [blkdiagPHI,~,~] = lmivar(3,blkdiagPHIs);
        
        
        for kk=1:Np
            lmiterm([-kk 1 1 0],ops.alpha(kk))
            lmiterm([-kk 2 1 0],BB(:,CritPar(kk)))
            lmiterm([-kk 2 2 0],Mbar)                       % N*C*X*C'
            lmiterm([-kk 2 2 blkdiagPHI],M,1)               % N/vare/2 * sum ( PHI * real(Fuw*Fuw') ), with Fuw = dG/H
        end
        
        lmiterm([-(Np+1),1,1,diagPHI],1,1)
        
        lmis           = getlmis;
        options        = [1e-4,100,1e12,10,0];              %[accuracy, max_it, feas_rad, , ]
        
        [copt,xopt]    = mincx(lmis,vecC,options);
        
        % make sure you do not apply an infeasible solution
        if ~isempty(xopt)
            PHIopt      = dec2mat(lmis,xopt,1);
        else
            PHIopt      = eps*ones(Nw,1);
        end      
        
    else
        cvx_begin sdp;
        
        cvx_precision('default')
        
        %cvx_solver mosek_2
        cvx_solver sdpt3
        %cvx_solver sedumi
        
        % decision variables
        variable PHI(Nw,1)
        
        % information matrix (inverse covariance matrix)
        Pinv = Mbar + M * kron(PHI,eye(nx));
        Pinv  = tril(Pinv)+tril(Pinv,-1)';                  % enforce symmetry
        
        % cost
        minimize( vecC*PHI );
        
        % constraints
        subject to
        
        % 1) upperbound variance
        for kk=1:Np
            [ops.alpha(kk) BB(:,CritPar(kk))' ; BB(:,CritPar(kk))  Pinv] >= 0;
        end
        
        % 2) positivity constraint
        PHI >= 0;
        
        cvx_end
        
        % make sure you do not apply an infeasible solution
        if strcmp(cvx_status,'Solved') || strcmp(cvx_status,'Inaccurate/Solved')
            PHIopt      = PHI;
        else
            PHIopt      = eps*ones(Nw,1);
        end
        
    end
    
    % check constraint on var(zet_i)
    P     = inv(Mbar + M * kron(PHIopt,eye(nx))); % covariance matrix
    diagP = diag(P);
    for kk=1:Np
        [diagP(CritPar(kk)) ops.alpha(kk)]
    end
    
end





