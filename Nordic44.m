

%% Nordic 44
clear;clc

ops.directory  = 'results\Nordic44\008\3Hz\900\base\';
 
% y = dphi and u = [Pref Qref eP5301 eQ5301]^T
% data_2 = [t, Qref, dphi]
ops.Ny         = 3;                     % choice of your output for identification (taken from data_2)
ops.mode       = 'min';                 % mode of the true system you plot 
ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.na         = 8;                    % #of states of estimated model
ops.nb         = ops.na;              % #of parameters in numerator G
ops.nc         = ops.na-2;              % #of parameters in numerator H
ops.nk         = 0;                     % #of delays in G
ops.nu         = 2;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ne         = 4;                     % choice of your noise channel channel from Dymola linearization (taken from u) 
ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 

ops.h_new      = 0.25;                   % new sampling period after resampling (0 -> no resampling)

ops.w          = linspace(.1*2*pi,3.0*2*pi,30);        % frequency grid

ops.c1         = 0.5;                                  % weighting factor for input (power or variance)
ops.c2         = (1-ops.c1);                         % weighting factor for output (power)


run('bin/MAIN')


% store optimal excitation signal derived from first batch
OptimalInput = [ops.w' syshat{1*ops.ll*ops.Nb}.Aopt];
if 0
    save(strcat(ops.directory,'OptimalInput.mat'),'OptimalInput');
end



%% print some results on the screen:
clc
disp(' ')
disp(['power in the input = ', num2str(signals.Pu)])
disp(' ')
disp(['power in the output = ', num2str(signals.Py)])
disp(' ')
for kk=1:ops.N
    disp(['variance zeta = ', num2str(diag(syshat{kk*ops.ll*ops.Nb}.P(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar))')])    
    disp(' ')
end

kk = 2;
P2 = diag(syshat{kk*ops.ll*ops.Nb}.P(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar))';




