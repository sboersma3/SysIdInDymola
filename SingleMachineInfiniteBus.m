

%% SingleMachineInfiniteBus
clear;clc

addpath(genpath('bin'));

ops.directory  = 'U:\results\SingleMachineInfiniteBus\Base\';
 
% load parameters ll,h and N from Dymola
parameters     = dlmread(strcat(ops.directory,'parameters.txt'),' ',0,1);

ops.N          = parameters(1);         % number of batches
ops.ll         = parameters(2);         % every ll second the model will be linearized
ops.h          = parameters(3);         % sample period
ops.Nw         = parameters(4);         % #of frequencies considered in input
ops.Nb         = parameters(5);         % #of batches in each identification cycle

% y      = [phi1 phi2 delta_phi]^T and u = [Pref2 Qref2 eP1 eQ1]^T
% data_2 = [t, Qref2, phi1, phi2, delta_phi]
ops.Ny         = 5;                     % choice of your output for identification (taken from data_2)
ops.mode       = 'min';                 % mode of the true system you plot 
ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.na         = 2;                     % #of states of estimated model
ops.nb         = ops.na+1;              % #of parameters in numerator G
ops.nc         = ops.na;                % #of parameters in numerator H
ops.nk         = 0;                     % #of delays in G
ops.nu         = 2;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ne         = 4;                     % choice of your noise channel channel from Dymola linearization (taken from u) 
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

% plot results per batch
for kk=1:floor(ops.N/ops.Nb)
    PlotResults(sys,syshat,signals,SimuResults,SysIdResults,ops,kk)
    %pause
end
clear kk

OptimalInput = [ops.w' syshat{1*ops.ll*ops.Nb}.Ai];
if 0
    save(strcat(ops.directory,'OptimalInput.mat'),'OptimalInput');
end

%% statistical fusion
clc;
P      = 0;
for kk=1:floor(ops.N/ops.Nb)
    P      = P + (inv(syshat{kk*ops.ll*ops.Nb}.P));
end
P = inv(P);

theta0 = 0;
for kk=1:floor(ops.N/ops.Nb)
    theta0 = theta0 + (inv(syshat{kk*ops.ll*ops.Nb}.P)) * syshat{kk*ops.ll*ops.Nb}.theta0;
end
theta0 = P*theta0;
disp(' ')
disp(['Fused covariance : ', num2str(diag(P(syshat{1*ops.ll*ops.Nb}.CritPar,syshat{1*ops.ll*ops.Nb}.CritPar)),'%10.2e')])
disp(' ')
disp(['Fused parameter : ', num2str(theta0(syshat{1*ops.ll*ops.Nb}.CritPar),'%10.3f')])




% % controllability analysis (under construction)
% [U,S,V]         = svd(sys{ll}.Wc);
% U_              = zeros(size(U));
% for kk=1:size(U,1)
%  
%     for mm=1:kk
%     U_(:,kk) = U_(:,kk) + S(mm,mm)/S(1,1) * U(:,mm);
%     end
% end

