

%% ThreeMachineNineBus
clear;clc

ops.directory  = 'results\ThreeMachineNineBus\';
 
% y      = [dphi_12, dphi_13, dphi_23]^T and u = [Pref8 Qref8 eP6 eQ6]^T
% data_2 = [t, Qref8, dphi_12, dphi_13, dphi_23, phi1, phi2, phi3]
ops.Ny         = 3;                     % choice of your output for identification (taken from data_2)
ops.mode       = 'min';                 % mode of the true system you plot 
ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.na         = 4;                     % #of states of estimated model (5 works well)
ops.nb         = ops.na+1;              % #of parameters in numerator G
ops.nc         = ops.na;                % #of parameters in numerator H
ops.nk         = 0;                     % #of delays in G
ops.nu         = 1;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ne         = 3;                     % choice of your noise channel channel from Dymola linearization (taken from u) 
ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 

ops.h_new      = 0.09;                  % new sampling period after resampling (0 -> no resampling)

ops.w          = linspace(.5*2*pi,2*2*pi,30);        % frequency grid

ops.c1         = 1;                                  % weighting factor for input (power or variance)
ops.c2         = (1-ops.c1);                         % weighting factor for output (power)


run('bin/MAIN')


% store optimal excitation signal derived from first batch
OptimalInput = [ops.w' syshat{1*ops.ll*ops.Nb}.Aopt];
if 0
    save(strcat(ops.directory,'OptimalInput.mat'),'OptimalInput');
end



