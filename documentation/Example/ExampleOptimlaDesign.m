%% Example of optimal design on the ThreeMachineNineBus
% SysId and Robust (or Optimization) Matlab toolboxes are required

% variables indicated with $$ can be tuned

clear;clc

addpath(genpath('bin'));

syshat.h    = .1;                   % sample period $$
L           = 3*60;                 % length initial experiment $$
t           = 0:syshat.h:L;         % time vector
N           = length(t);

% load Linearized Dymola model (u = active power, y = delta phi)
nu          = 1;    % input channel from linearized Dymola model
ny          = 1;    % output channel from linearized Dymola model
ne          = 3;    % noise channel from linearized Dymola model

load('G.mat');
network     = ssbal(ss(ABCD(1:nx,1:nx), ABCD(1:nx,nx+1:end),...
                ABCD(nx+1:end,1:nx),ABCD(nx+1:end,nx+1:end)));
sys.G       = c2d(ssbal(network(ny,nu)),syshat.h);
sys.H       = c2d(ssbal(network(ny,ne)),syshat.h);

% damping ratios and frequencies
[~,D]       = eig(sys.G.a,'vector');
D           = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
sys.p       = D;                                                    % poles
D           = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
sys.zeta    = abs(-real(log(D))./abs(log(D)));                      % damping ratios
sys.zeta(isnan(sys.zeta)) = 1;
sys.wn      = abs(log(D)/syshat.h);                                 % natural frequency
% sort damping ratios and frequencies
[sys.zeta,ind] = sort(sys.zeta);
sys.wn         = sys.wn(ind);
clear ABCD nx nu ny ne xuyName network Aclass D ind  

% construct initial excitation signal for SysId and noise signal
syshat.w    = linspace(.1*2*pi,5*2*pi,25)';         % frequency grid $$
syshat.Ai   = .1*ones(length(syshat.w),1);         % amplitudes initial batch $$
thetai      = 2*pi.*rand(1,length(syshat.w)) - pi;  % phases initial batch
u           = 0;
for kk=1:length(syshat.w)
    u = u + syshat.Ai(kk)*sin( syshat.w(kk)*t+thetai(kk) ); % excitation signal
end
clear thetai kk

sigma_e     = .05;                                  % standard deviation noise $$
e           = sigma_e*randn(N,1);

% perform experiment for SysId
y           = lsim(sys.G,u,t) + lsim(sys.H,e,t);

% identify initial model
syshat.na          = 7;                        % #of states of estimated model $$
syshat.nb          = syshat.na-1;              % #of parameters in numerator G $$
syshat.nc          = syshat.na-3;              % #of parameters in numerator H $$
syshat.nk          = 0;                        % #of delays in G $$

optPEM      = armaxOptions('Focus','prediction','InitialCondition' ,'auto','EnforceStability',true);
SysId       = armax(iddata(y,u',syshat.h),[syshat.na syshat.nb syshat.nc syshat.nk],optPEM);

% check the standard deviation of the estimated parameters
%present(SysId)

[syshat.den,syshat.numG,syshat.numH,~,~]    = polydata(SysId);
syshat.numH                                 = [syshat.numH zeros(1,length(syshat.den)-length(syshat.numH))];
syshat.G                                    = ss(tf(syshat.numG,syshat.den,syshat.h));
syshat.H                                    = ss(tf(syshat.numH,syshat.den,syshat.h));
syshat.Delay                                = ss(tf(1,[1 0],syshat.h)^SysId.nk);
syshat.vare                                 = SysId.NoiseVariance;


% estimated damping ratios and modes
[~,D]               = eig(syshat.G.a,'vector');
D                   = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
syshat.p            = D;                                                    % poles
D                   = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
syshat.zeta         = abs(-real(log(D))./abs(log(D)));                      % damping ratios
syshat.zeta(isnan(syshat.zeta)) = 1;
syshat.wn           = abs(log(D)/syshat.h);                                 % natural frequency

syshat.nr           = size(D(imag(D)==0),1);
syshat.ni           = size(sort(D(imag(D)~=0)),1)/2;

syshat.CritPar      = [];
for mm=1:syshat.ni
    syshat.CritPar  = [syshat.CritPar syshat.nr+2*mm];     % element number of parameter vector that has constrained variance
end
clear D mm ind

% compute variance damping coefficients
syshat              = get_covariance_dampingcoeff(syshat,N);

% use initial identified model to find optimal spectrum excitation signal
syshat              = get_Fu_and_Fe(syshat);

% upperbound on variance of all damping coefficients
alpha               = diag(syshat.P(syshat.CritPar,syshat.CritPar));

% find optimal spectrum
c1                  = 1;                                    % weighting factor for input (power or variance)
c2                  = (1-c1);                               % weighting factor for output (power)
[PHIopt,vecC,C,P]	= get_optimal_spectrum_input(syshat,alpha,N,c1,c2);

% cost values
syshat.J1           = sum(PHIopt)/2;        % term in cost without c1
syshat.J2           = C*PHIopt/2;           % term in cost without c2
syshat.J            = vecC*PHIopt;          % cost

% covariances
syshat.Phat         = P;
syshat.Phat_zeta    = diag(P(syshat.CritPar,syshat.CritPar));

% get optimal time-domain excitation signal
syshat.uopt         = get_optimal_timeseries_input(u(end),syshat.h,N,syshat.w,PHIopt);
syshat.Aopt         = sqrt(PHIopt);
clear PHIopt P vecC C

figure(1);clf
stem(syshat.w/2/pi,syshat.Ai,'linewidth',1);grid;hold on;
stem(syshat.w/2/pi,syshat.Aopt,'linewidth',2);
xlabel('$\omega$ (Hz)','interpreter','latex','fontsize',15)
ylabel('$A_i$','interpreter','latex','fontsize',15)
legend('$A_{\rm{base}}$','$A_{\rm{opt}}$','interpreter','latex','fontsize',15)
ylim([0 max(max(syshat.Aopt),max(syshat.Ai))*(1+.2)])
vline(sys.wn(1)/2/pi,'k--')
vline(sys.wn(3)/2/pi,'k--')
str = strcat('$\zeta_1=',num2str(sys.zeta(1),1),'$');
text(sys.wn(1)/2/pi-.2,max(max(syshat.Aopt),max(syshat.Ai))*(1+.25),str,'interpreter','latex','fontsize',15)
str = strcat('$\zeta_2=',num2str(sys.zeta(3),1),'$');
text(sys.wn(3)/2/pi-.2,max(max(syshat.Aopt),max(syshat.Ai))*(1+.25),str,'interpreter','latex','fontsize',15)
set(gcf, 'Position',  [400, 400, 900, 300])
clear str

% setup second (optimal) part of the SysId experiment 
e_1       = [e;sigma_e*randn(N,1)];
u_1       = [u syshat.uopt];
t_1       = [t (L+syshat.h:syshat.h:2*L+syshat.h)];

% perform experiment for SysId 
% we redo the first part so that there are no initial condition problems
y_1       = lsim(sys.G,u_1,t_1) + lsim(sys.H,e_1,t_1);

% plot the SysId experiment results
figure(2);clf
subplot(2,1,1)
plot(t_1,u_1);grid;
ylabel('$u(t)$','interpreter','latex','fontsize',15)
xlabel('$t$ (s)','interpreter','latex','fontsize',15)
axis tight
subplot(2,1,2)
plot(t_1,y_1);grid;
ylabel('$y(t)$','interpreter','latex','fontsize',15)
xlabel('$t$ (s)','interpreter','latex','fontsize',15)
axis tight

% identify optimal model
SysId_1     = armax(iddata(y_1(N+1:end),u_1(N+1:end)',syshat.h),[syshat.na syshat.nb syshat.nc syshat.nk],optPEM);
clear optPEM
% check the standard deviation of the estimated parameters
%present(SysId_1)

% get second identified model
[syshat.den,syshat.numG,syshat.numH,~,~]    = polydata(SysId_1);
syshat.numH                                 = [syshat.numH zeros(1,length(syshat.den)-length(syshat.numH))];
syshat.G_1                                  = ss(tf(syshat.numG,syshat.den,syshat.h));
syshat.H_1                                  = ss(tf(syshat.numH,syshat.den,syshat.h));

% combine both identified models
P1              = getcov(SysId);
theta1          = getpvec(SysId);

P2              = getcov(SysId_1);
theta2          = getpvec(SysId_1);

P_combined      = inv( inv(P1) + inv(P2) );
theta_combined  = P_combined *( inv(P1)*theta1 + inv(P2)*theta2 );
clear P1 P2 P_combined 

syms z
monomial = [];
for kk=0:syshat.na
    monomial = [z^kk monomial]; 
end
den_sym = monomial*[1;theta_combined(1:syshat.na)];

monomial = [];
for kk=0:syshat.nb-1
    monomial = [z^kk monomial]; 
end
numG_sym = monomial*theta_combined(syshat.na+1:syshat.na+syshat.nb);

monomial = [];
for kk=syshat.na-syshat.nc:syshat.na
    monomial = [z^kk monomial]; 
end
numH_sym = monomial*[1;theta_combined(syshat.na+syshat.nb+1:end)];
% define combined estimated model
Gopt     = ss(sym2tf(numG_sym/den_sym,syshat.h));
Hopt     = ss(sym2tf(numH_sym/den_sym,syshat.h));
clear monomial den_sym numG_sym numH_sym theta1 theta2 theta_combined kk

% plot the SysId results
opts              = bodeoptions('cstprefs');
opts.PhaseVisible = 'off';
opts.grid         = 'on';
opts.FreqUnits    = 'Hz';

figure(3);clf
subplot(2,1,1)
bode(Gopt,opts);hold on
bode(sys.G,opts);
legend('$\hat{G}$','$G$','interpreter','latex','fontsize',15,'location','southwest')
xlim([syshat.w(1)/2/pi syshat.w(end)/2/pi])
subplot(2,1,2)
bodemag(Hopt,opts);hold on
bodemag(sys.H,opts);
legend('$\hat{H}$','$H$','interpreter','latex','fontsize',15,'location','northwest')
xlim([syshat.w(1)/2/pi syshat.w(end)/2/pi])
clear opts

% get optimal estimated damping coefficients
[~,D]                 = eig(Gopt.a,'vector');
D                     = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
D                     = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
syshat.zeta_opt       = abs(-real(log(D))./abs(log(D)));                      % damping ratios
syshat.zeta_opt(isnan(syshat.zeta_opt)) = 1;
syshat.wn_opt         = abs(log(D)/syshat.h);                                 % natural frequency
% sort damping ratios and frequencies
[syshat.zeta_opt,ind] = sort(syshat.zeta_opt);
syshat.wn_opt         = syshat.wn_opt(ind);
clear D ind

VarNames = {'true damping', 'estimated damping'};
T        = table([sys.zeta(1);sys.zeta(3)],[syshat.zeta_opt(1);syshat.zeta_opt(3)],'VariableNames',VarNames);
clear VarNames

disp(T)

