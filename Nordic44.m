

%% Nordic 44
clear;clc

ops.directory  = 'results\Nordic44\base\';
 
% y = dphi and u = [Pref Qref eP5301 eQ5301]^T
% data_2 = [t, Qref, dphi, e]
ops.Ny         = 3;                     % choice of your output for identification (taken from data_2)
ops.mode       = 'min';                 % mode of the true system you plot 
ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.na         = 6;                     % #of states of estimated model
ops.nb         = ops.na-3;                % #of parameters in numerator G
ops.nc         = ops.na-3;              % #of parameters in numerator H
ops.nk         = 0;                     % #of delays in G
ops.nu         = 2;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ne         = 4;                     % choice of your noise channel channel from Dymola linearization (taken from u) 
ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 

ops.h_new      = .2;                   % new sampling period after resampling (0 -> no resampling)

ops.w          = (.1*2*pi:1*.1*2*pi:3*2*pi);        % frequency grid in optimal input design optimization

ops.c1         = .20;                                % weighting factor on input power
ops.c2         = (1-ops.c1);                         % weighting factor on output power

run('bin/MAIN')


% store optimal excitation signal derived from first batch
OptimalInput = [ops.w' syshat{1*ops.ll*ops.Nb}.Aopt];
c1           = ops.c1;
c2           = ops.c2;
if 0
    save(strcat(ops.directory,'OptimalInput.mat'),'OptimalInput','c1','c2');
end



% ops.na         = 7;                     % #of states of estimated model
% ops.nb         = ops.na;                % #of parameters in numerator G
% ops.nc         = ops.na;              % #of parameters in numerator H
% ops.nk         = 0;                     % #of delays in G
% ops.nu         = 4;                     % choice of your input channel from Dymola linearization (taken from u)
% ops.ne         = 2;                     % choice of your noise channel channel from Dymola linearization (taken from u) 
% ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 
% 
% ops.h_new      = .25;                   % new sampling period after resampling (0 -> no resampling)
