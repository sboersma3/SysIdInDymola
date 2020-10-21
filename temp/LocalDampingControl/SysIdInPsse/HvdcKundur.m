clear;clc;

ops.directory = 'PSSE/HvdcKundur/';
ops.European  = strfind(ops.directory,'European')>1;

ops.modeid    = 'min';  % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.ny1       = 2;
ops.ny2       = 3;
ops.nf        = 4;      % #poles
ops.nb        = 5;      %  
ops.nk        = 0;

ops.sigma_e   = 1e-3;      % noise added to Dymola data

ops.h_new     = 0.01;      % new sampling period after resampling (0 -> no resampling)

%%% simulation done in Dymola
% y      = dphi and u = Pref
% data_2 = [t, Pref, dphi]
ops.Dymola    = 1;
ops.Ny        = 4;                     % choice of your output for identification (taken from data_2)
ops.Nu        = 2;                     % choice of your input for identification (taken from data_2)
ops.nu        = 1;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ny        = 1;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 
addpath(genpath('bin'));
sys           = Dymola2PsseData(ops);
%%%

run('bin/MAIN')

