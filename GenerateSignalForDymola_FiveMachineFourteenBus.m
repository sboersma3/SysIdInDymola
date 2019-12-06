clear;clc

addpath(genpath('bin'));

ops.directory   = 'results\FiveMachineFourteenBus\';

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 1;         % number of batches (even number)
ops.ll          = 120;         % every ll second the model will be linearized
ops.h           = .1;       % sample period

ops.w           = linspace(.1*2*pi,3*2*pi,20)'; % frequency grid
Ai              = .01*ones(length(ops.w),1);    % amplitudes initial batch

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ops.K           = 1;         % after every K<=N batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

SaveAndPlotExcitationSignal(Ai,ops)
