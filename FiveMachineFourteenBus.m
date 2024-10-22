

%% FiveMachineFourteenBus
clear;clc

ops.directory  = 'results\FiveMachineFourteenBus\2batches\optimal\';
 
% y      = dphi_18 and u = [Pref12 Qref12 eP14 eQ14]^T
% data_2 = [t, Qref12, dphi_18]
ops.Ny         = 3;                     % choice of your output for identification (taken from data_2)
ops.mode       = 'min';                 % mode of the true system you plot 
ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.na         = 8;                     % #of states of estimated model
ops.nb         = 4;               % #of parameters in numerator G
ops.nc         = 4;                % #of parameters in numerator H
ops.nk         = 0;                     % #of delays in G
ops.nu         = 2;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ne         = 4;                     % choice of your noise channel channel from Dymola linearization (taken from u) 
ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 

ops.h_new      = 0.1;                   % new sampling period after resampling (0 -> no resampling)

ops.w          = linspace(.1*2*pi,3*2*pi,30);        % frequency grid

ops.c1         = .8;                                  % weighting factor for input (power or variance)
ops.c2         = (1-ops.c1);                         % weighting factor for output (power)


run('bin/MAIN')


% store optimal excitation signal derived from first batch
OptimalInput = [ops.w' syshat{1*ops.ll*ops.Nb}.Aopt];
if 0
    save(strcat(ops.directory,'OptimalInput.mat'),'OptimalInput');
end

