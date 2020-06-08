clear;clc

addpath(genpath('bin'));

ops.directory   = 'results\HvdcKundur\'; 

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 100;         % number of batches (even number)
ops.ll          = 120;        % every ll second the model will be linearized (60 for OE model)
ops.h           = .005;       % sample period

ops.w           = (.1*2*pi:1*.1*2*pi:3*2*pi)';
Ai              = 0.03*ones(length(ops.w),1);         % amplitudes initial batch

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ops.K           = 1;         % after every K<=N batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

SaveAndPlotExcitationSignal(Ai,ops)


