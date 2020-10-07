

%% IEEE_9_Buses_with_3T_MTDC (only suitable for one batch)
clear;clc

ops.directory  = 'results\IEEE_9_Buses_with_3T_MTDC_MIMO\';
 
% y = [dphi74 dphi79 dphi94 P74 P79 P94] and u = [Phvdc1 Phvdc2 Phvdc3]^T
% data_2 = [t Phvdc1 Phvdc2 Phvdc3 dphi74 dphi79 dphi94 P74 P79 P94]
ops.Ny         = 5:7;                   % choice of your output for identification (taken from data_2)
ops.na         = 4;                     % #of states of estimated model
ops.nu         = 1:3;                   % choice of your input channel from Dymola linearization (taken from u)
ops.ny         = 1:3;                   % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 

ops.h_new      = 0.01;                  % new sampling period after resampling (0 -> no resampling)
ops.sigma_e    = .05;                   % standard deviation noise 


% load simulation parameters
parameters       = dlmread(strcat(ops.directory,'parameters.txt'),' ',0,1);

ops.N            = parameters(1);         % number of batches simulation
ops.ll           = parameters(2);         % every ll second the model will be linearized
ops.h            = parameters(3);         % sample period
ops.Nw           = parameters(4);         % #of frequencies considered in input
ops.Nb           = parameters(5);         % #of batches in each identification cycle
ops.sigma        = parameters(8);         % standard deviation noise
clear parameters

parameters       = load(strcat(ops.directory,'InputDymola'));
ops.w            = parameters.B(:,1);
clear parameters

% load linearized Dymola model for comparison
load(strcat(ops.directory,'LinRes',num2str(ops.ll)));
A           = ABCD(1:nx,1:nx);B = ABCD(1:nx,nx+1:end);C = ABCD(nx+1:end,1:nx);D = ABCD(nx+1:end,nx+1:end);
sys.G       = ss(A,B,C,D);
sys.G       = stabsep(sys.G(ops.ny,ops.nu));
sys.G       = minreal(sys.G,1*sqrt(eps));
sys.ny      = size(sys.G.C,1);
sys.nu      = size(sys.G.B,2); 
clear xuyName nx A B C D ABCD Aclass

% load collected data
temp        = load(strcat(ops.directory,"SimRes",num2str(ops.ll),'.mat'),'data_2'); 
Y           = temp.data_2;
signals.t   = Y(1,1:end);
signals.u   = Y(1+ops.nu,1:end);
signals.y   = Y(ops.Ny,1:end);
% to remove the wrapping error
dy          = diff(signals.y');
for ll=1:length(ops.ny)
    ind                 = find(abs(dy(:,ll)) > 1==1);
    for kk=1:2:length(ind)-1; signals.y(ll,ind(kk)+1:ind(kk+1)) = signals.y(ll,ind(kk)+1:ind(kk+1)) - dy(ind(kk),ll); end
    signals.y(ll,:)     = unwrap(signals.y(ll,:)); % measured output
end

clear temp Y dy ind kk ll

% add noise to measurement
signals.y   = signals.y + ops.sigma_e*randn(length(ops.Ny),length(signals.t));

% post-process data (resample, detrend)
SysIdData_0             = iddata(signals.y',signals.u',ops.h);

rs                      = ops.h_new/ops.h;                          % resample to rs*ops.h
SysIdData               = idresamp(SysIdData_0,rs);
SysIdData               = detrend(SysIdData);
SysIdData.InputName     = {'Phvdc1';'Phvdc2';'Phvdc3'};             % MW
SysIdData.OutputName    = {'phi1';'phi2';'phi3'};                   % deg
clear rs

% check data from SysId experiment
%figure(100);clf;plot(SysIdData(:,1,1));hold on;plot(SysIdData_0(:,1,1),'r--')

% perform SysId
syshat.nx  = 4;                                                     % #states in identified model $$
syshat.sys = ssest(SysIdData,ops.na,'Form','Companion',...
    'DisturbanceModel','estimate','Feedthrough',1,'Ts',ops.h_new);%,...
    %'InitialState','estimate','Ts',ops.h_new);

% compare time-domain data
figure(1);clf
compare(SysIdData,syshat.sys)

% compare frequency-domain data
opts              = bodeoptions('cstprefs');
opts.Title.String = 'Bode magnitude linearized model (blue) and identified model (red)';
opts.PhaseVisible = 'off';
opts.grid         = 'on';
opts.FreqUnits    = 'Hz';
opts.XLim{1}      = [ops.w(1)/2/pi ops.w(end)/2/pi+1];

figure(2);clf
bode(sys.G,'b',opts);hold on;
bode(syshat.sys,'r',opts);

opts.Title.String = 'Bode magnitude identified model (red) and its confidence interval';
figure(3);clf
handle = bodeplot(syshat.sys,'r',opts);
showConfidence(handle);
clear opts

figure(4);clf
for kk=1:length(ops.nu)
    subplot(length(ops.nu),1,kk)
    plot(signals.t,signals.u(1,:));grid
end
sgtitle('Excitation signals (MW)')
