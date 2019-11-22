

%% ThreeMachineNineBus
clear;clc

ops.directory  = 'results\ThreeMachineNineBus_omega\';
 
% y      = [dw1, dw2, dw3]^T and u = [Pref6 Qref6]^T
% data_2 = [t, Qref6, dw1, dw2, dw3]
ops.Ny         = 5;                     % choice of your output for identification (taken from data_2)
ops.mode       = 'min';                 % mode of the true system you plot 
ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.na         = 6;                     % #of states of estimated model
ops.nb         = ops.na-1;              % #of parameters in numerator G
ops.nc         = ops.na-1;                % #of parameters in numerator H
ops.nk         = 0;                     % #of delays in G
ops.nu         = 1;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ne         = 2;                     % choice of your noise channel channel from Dymola linearization (taken from u) !! no channel in this case, but active power !!
ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 

ops.h_new      = 0.08;                  % new sampling period after resampling (0 -> no resampling)

ops.w          = linspace(.1*2*pi,3*2*pi,30);        % frequency grid

ops.c1         = 1;                                  % weighting factor for input (power or variance)
ops.c2         = (1-ops.c1);                         % weighting factor for output (power)


run('bin/MAIN')


% store optimal excitation signal derived from first batch
OptimalInput = [ops.w' syshat{1*ops.ll*ops.Nb}.Aopt];
if 0
    save(strcat(ops.directory,'OptimalInput.mat'),'OptimalInput');
end



