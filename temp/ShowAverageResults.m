%% Compute average quantaties from multiple simulations

clear;clc

addpath(genpath('bin'));

AverageResults = struct;

for mm=1:20
    
    ops.directory  = strcat('U:\results\ThreeMachineNineBus\',num2str(mm),'\');
    
    % load parameters ll,h and N from Dymola
    parameters     = dlmread(strcat(ops.directory,'parameters.txt'),' ',0,1);
    
    ops.N          = parameters(1);         % number of batches
    ops.ll         = parameters(2);         % every ll second the model will be linearized
    ops.h          = parameters(3);         % sample period
    ops.Nw         = parameters(4);         % #of frequencies considered in input
    ops.Nb         = parameters(5);         % #of batches in each identification cycle
    
    % y      = [dphi_12, dphi_13, dphi_23]^T and u = [Pref8 Qref8 eP6 eQ6]^T
    % data_2 = [t, Qref8, dphi_12, dphi_13, dphi_23, phi1, phi2, phi3]
    ops.Ny         = 3;                     % choice of your output for identification (taken from data_2)
    ops.mode       = 'min';                 % mode of the true system you plot
    ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
    ops.na         = 3;                     % #of states of estimated model (5 works well)
    ops.nb         = ops.na+1;              % #of parameters in numerator G
    ops.nc         = ops.na;                % #of parameters in numerator H
    ops.nk         = 0;                     % #of delays in G
    ops.nu         = 1;                     % choice of your input channel from Dymola linearization (taken from u)
    ops.ne         = 3;                     % choice of your noise channel channel from Dymola linearization (taken from u)
    ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2!
    
    ops.w          = linspace(.1*2*pi,5*2*pi,ops.Nw);    % frequency grid
    
    ops.Nid        = ops.Nb*ops.ll/ops.h;                % every Nid step we identify
    ops.c1         = 1;                                  % weithing factor for input (power or variance)
    ops.c2         = (1-ops.c1);                         % weithing factor for output (power)
    
    
    % load time domain data
    [sys,signals]  = LoadDymolaData(ops);
    
    signals        = FilterData(signals,ops);
    
    % identification/validation
    syshat         = IdentifyModel(signals,ops);
    SysIdResults   = TestIdentifiedModel(syshat,signals,ops);
    
    % optimal input design
    syshat         = OptimalInputDesign(syshat,signals.u,ops);
    
    % simulate estimated linear model
    signals        = SimulateIdentifiedModel(syshat,signals,ops);
    
    % post processing data
    SimuResults    = PostProcessing(sys,syshat,signals,ops);
    
    
    AverageResults = GetAverages(syshat,signals,ops,AverageResults,mm);
    
    
end

% remove outliners
ind                          = AverageResults.ind(AverageResults.ind~=0);
AverageResults.zeta(:,ind)   = [];
AverageResults.Ptheta(:,ind) = [];
AverageResults.rho(:,ind)    = [];
AverageResults.Prho(:,ind)   = [];
AverageResults.p(:,ind)      = [];
AverageResults.magG(:,ind)   = [];
AverageResults.yhat(:,ind)   = [];

% plot results
figure(1000);clf;hold on;grid
for kk=1:size(AverageResults.p,2)
    plot(real(AverageResults.p(:,kk)),imag(AverageResults.p(:,kk)),'b*');
end
xlabel('Real axis','interpreter','latex')
ylabel('Imaginairy axis','interpreter','latex')

figure(1001);clf;hold on;grid
for kk=1:size(AverageResults.magG,2)
    semilogx(ops.w,20*log10(AverageResults.magG(:,kk)),'r');
end
[mag,~]                     = bode(sys{end}.Gid,ops.w);
magG                        = squeeze(mag);
semilogx(ops.w,20*log10(magG),'b');
xlabel('$\omega$ (rad/s)','interpreter','latex')
ylabel('$|G(i\omega|, |\hat{G}(i\omega)|$','interpreter','latex')
xlim([ops.w(1) ops.w(end)])

zeta        = unique(AverageResults.zeta,'rows');
zeta(end,:) = []; 
zeta_mean   = mean(zeta,2);
Pzeta       = std(zeta,[],2);%mean(AverageResults.Prho(syshat{end}.CritPar,:),2);
phi         = -pi:0.01:pi;
x           = zeta_mean(1)+Pzeta(1)*cos(phi);
y           = zeta_mean(2)+Pzeta(2)*sin(phi);

zeta0       = unique(sys{end}.zeta);

figure(1002);clf;hold on;grid
for kk=1:size(zeta,2)
plot(zeta(1,kk),zeta(2,kk),'r*');hold on
end
plot(zeta0(1),zeta0(2),'b*');
plot(x,y)
xlabel('$\zeta_1, \hat{\zeta}_1$','interpreter','latex')
ylabel('$\zeta_2, \hat{\zeta}_2$','interpreter','latex')
xlim([-.1 1]);ylim([-.1 1])

figure(1003);clf;hold on;grid
subplot(2,1,1);hold on;grid;
ylabel('$u(t)$','interpreter','latex')
plot(signals.t,signals.u,'b','linewidth',2);
subplot(2,1,2);hold on;grid;
ylabel('$y(t)$','interpreter','latex')
plot(signals.t,signals.y,'b','linewidth',2);hold on;
plot(signals.t(1:end-1),AverageResults.yhat(:,2),'r--','linewidth',2);

% for kk=1:size(AverageResults.yhat,2)
% plot(signals.t(1:end-1),AverageResults.yhat(:,kk),'r--','linewidth',2);
% end


