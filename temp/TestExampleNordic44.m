%% TestExample (Nordic44)



%% Optimal experiment test
clear;clc

ops.directory  = 'results\Nordic44\';
 
% y = dphi and u = [Pref Qref eP5301 eQ5301]^T
% data_2 = [t, Qref, dphi]
ops.Ny         = 3;                     % choice of your output for identification (taken from data_2)
ops.mode       = 'min';                 % mode of the true system you plot 
ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.na         = 11;                    % #of states of estimated model
ops.nb         = ops.na-1;              % #of parameters in numerator G
ops.nc         = ops.na;                % #of parameters in numerator H
ops.nk         = 0;                     % #of delays in G
ops.nu         = 2;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ne         = 4;                     % choice of your noise channel channel from Dymola linearization (taken from u) 
ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 

ops.h_new      = 0.0;                   % new sampling period after resampling (0 -> no resampling)

ops.w          = linspace(.3*2*pi,2*2*pi,30);        % frequency grid

ops.c1         = 1;                                  % weighting factor for input (power or variance)
ops.c2         = (1-ops.c1);                         % weighting factor for output (power)

%%%
%%%
addpath(genpath('bin')); warning('off','Ident:dataprocess:idresampSignalAlert');

% load parameters ll,h and N from Dymola
parameters     = dlmread(strcat(ops.directory,'parameters.txt'),' ',0,1);

ops.N          = parameters(1);         % number of batches simulation
ops.ll         = parameters(2);         % every ll second the model will be linearized
ops.h          = parameters(3);         % sample period
ops.Nw         = parameters(4);         % #of frequencies considered in input
ops.Nb         = parameters(5);         % #of batches in each identification cycle
ops.sigma      = parameters(8);         % standard deviation noise

if ops.h_new==0
    ops.h_new = ops.h;
end

ops.Nid        = floor(ops.Nb*ops.ll/ops.h_new);     % every Nid sample we identify
ops.Nw         = length(ops.w);

% load time domain data
[sys,signals]  = LoadDymolaData(ops);
[signals,ops]  = ResampleData(signals,ops);


% replace nonlinear measurement with linear measurement
signals.yl     = (lsim(sys{1*ops.ll}.Gid,signals.u,signals.t) + ...
        lsim(sys{1*ops.ll}.Hid,ops.sigma*signals.e,signals.t))';
    

figure(1);clf
subplot(2,1,1)
plot(signals.t,signals.u,'r');grid;
ylabel('$u$','interpreter','latex')
title('excitation signal','interpreter','latex')
for kk=1:ops.N;vline(kk*ops.ll,'k--');end
xlim([0 signals.t(end)])
subplot(2,1,2)
plot(signals.t,signals.y,'b');hold on;
plot(signals.t,signals.yl,'r--');grid;    
ylabel('$y$','interpreter','latex')
title('measurement nonlinear model (blue) and linear model (red)','interpreter','latex')
for kk=1:ops.N;vline(kk*ops.ll,'k--');end
xlim([0 signals.t(end)])
xlabel('Time $(s)$','interpreter','latex')

signals.y = signals.yl;
%%%
%%%

% Optimal experiment

% base
syshat.G        = sys{1*ops.ll}.Gid;
syshat.H        = sys{1*ops.ll}.Hid;
syshat.vare     = ops.sigma;

[syshat.numG,~,~] = tfdata(syshat.G,'v'); % tricky operation and used in get_Fu_and_Fe, but not in the true code
[syshat.numH,~,~] = tfdata(syshat.H,'v'); % tricky operation

syshat.p        = sys{1*ops.ll}.p;
syshat.zeta     = sys{1*ops.ll}.zeta;
syshat.wn       = sys{1*ops.ll}.wn;
syshat.h        = ops.h;
syshat.na       = size(syshat.G.a,1)-1;
syshat.nb       = syshat.na+1; % here you assume D matrix in G (you do not want to use numG)
syshat.nc       = syshat.na;   % here you assume D matrix in H (you do not want to use numH)
syshat.ni       = sys{1*ops.ll}.ni;
syshat.nr       = sys{1*ops.ll}.nr;

syshat.CritPar  = [];
for mm=1:syshat.ni
    syshat.CritPar = [syshat.CritPar syshat.nr+2*mm];     % element number of parameter vector that has constrained variance
end
    
syshat          = get_Fu_and_Fe(syshat);

Fuw             = freqresp(syshat.Fu,ops.w);
M               = [];
for kk=1:ops.Nw
    M = [M,(ops.Nid/syshat.vare/2)*real(Fuw(:,:,kk)*Fuw(:,:,kk)')];    
end


Q         = Fe.b*Fe.b';
X         = dlyap(Fe.a,Q);
Mbar      = ops.Nid*Fe.c*X*Fe.c'+Fe.d*Fe.d';
nx        = size(Mbar,1);

% covariance matrix base case
Pbase     = inv(Mbar + M * kron(ops.Ai'.^2,eye(nx)));
ubase     = signals.u;



% now in two batches
% first batch
t1              = signals.t(1:floor(length(signals.t)/2));
t2              = signals.t(length(t1)+1:end);
ops.Ai          = sigma_u*ones(1,ops.Nw);
syshat.Gz       = G0;
syshat.Hz       = H0;
syshat.G        = ss(G0);
syshat.H        = ss(H0);
syshat.vare     = sigma_e;
syshat.numG     = numG0;
syshat.numH     = numH0;
syshat.p        = p0;
syshat.zeta     = zeta0;
syshat.wn       = wn0;
syshat.h        = h;
syshat.na       = length(den0(2:end));
syshat.nb       = nnz(numG0);
syshat.nc       = nnz(numH0)-1;
syshat.nk       = 0;
syshat.CritPar  = 2;


syshat         = get_Fu_and_Fe(syshat);
vare           = syshat.vare;
Fuz            = syshat.Fuz;
Fez            = syshat.Fez;

Fuw            = freqresp(Fuz,ops.w);
M              = [];
for kk=1:ops.Nw
    M = [M,(ops.Nid/vare/2)*real(Fuw(:,:,kk)*Fuw(:,:,kk)')];    
end


[a,b,c,d] = ssdata(minreal(ss(Fez),[],false));
Q         = b*b';
X         = dlyap(a,Q);
Mbar      = ops.Nid*c*X*c'+d*d';
nx        = size(Mbar,1);

% covariance matrix
P1     = inv(Mbar + M * kron(ops.Ai'.^2,eye(nx)));
u1     = 0;
for ll=1:ops.Nw
    u1 = u1 + ops.Ai(ll)*sin(ops.w(ll)*t1+thetai(ll))';
end

% second batch
ops.Nid                = length(t2);
ops.c1                 = 1;                                  % weithing factor for input 
ops.c2                 = (1-ops.c1);                          % weithing factor for output
syshat.ind             = syshat.CritPar;
ops.alpha              = P1(syshat.CritPar,syshat.CritPar) - Pbase(syshat.CritPar,syshat.CritPar);
[PHIopt,vecC,C,P2]     = get_optimal_spectrum_input(syshat,ops,2);

Popt                   = P1-P2;
Pbase(syshat.CritPar,syshat.CritPar)
Popt(syshat.CritPar,syshat.CritPar)


u2     = 0;
for ll=1:ops.Nw
    ops.Aiopt(ll) = sqrt(PHIopt(ll));
    u2            = u2 + ops.Aiopt(ll)*sin(ops.w(ll)*t1+thetai(ll))';
end

uopt = [u1;-u2];

% simulate model wiht ubase and uopt = [u1;u2]
rng(66)
e     = 0*randn(1,length(t));

ybase = lsim(G0,ubase,t) + lsim(H0,e,t);
yopt  = lsim(G0,uopt,t)  + lsim(H0,e,t);

figure(1);clf;
subplot(2,3,1)
plot(ops.w,ops.Ai,'ro','linewidth',3);grid;
xlabel('$\omega$ (rad/s)','interpreter','latex');
ylabel('$A_i$','interpreter','latex');
ylim([0 1.1*max(ops.Aiopt)])
subplot(2,3,2)
plot(t,ubase,'r');grid
ylabel('$u_{base}$','interpreter','latex');
title(['$P_u$ = ' ,num2str(ubase'*ubase/(ubase'*ubase),4)],'interpreter','latex'); 
subplot(2,3,3)
plot(t,ybase);grid
ylabel('$y_{base}$','interpreter','latex');
title(['$P_y$ = ' ,num2str(ybase'*ybase/(ybase'*ybase),4)],'interpreter','latex');
subplot(2,3,4)
plot(ops.w,ops.Aiopt,'ro','linewidth',3);grid;hold on;
xlabel('$\omega$ (rad/s)','interpreter','latex');
ylabel('$A_i$','interpreter','latex');
obj      = findobj(gcf,'type','axes');
ax       = obj(2);
ax_ylim  = ax.YLim;
plot([wnhati(1) wnhati(1)],[ax_ylim(1) ax_ylim(2)],'k--','linewidth',1.5)
ylim([0 1.1*max(ops.Aiopt)])
subplot(2,3,5)
plot(t,uopt,'r');grid
ylabel('$u_{opt}$','interpreter','latex');
title(['$P_u$ = ' ,num2str(uopt'*uopt/(ubase'*ubase),4)],'interpreter','latex'); 
subplot(2,3,6)
plot(t,yopt);grid
ylabel('$y_{opt}$','interpreter','latex');
xlabel('$t$ (sec)','interpreter','latex');
title(['$P_y$ = ' ,num2str(yopt'*yopt/(ybase'*ybase),4)],'interpreter','latex')