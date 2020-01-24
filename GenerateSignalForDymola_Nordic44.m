clear;clc

addpath(genpath('bin'));

ops.directory   = 'results\Nordic44\';

ops.Optimal     = 1;         % generate optimal signal (true) or base signal (false)

ops.N           = 2;         % number of batches (even number)
ops.ll          = 450;       % every ll second the model will be linearized
ops.h           = .02;       % sample period

ops.w           = linspace(.1*2*pi,3*2*pi,30)'; % frequency grid
Ai              = .02*ones(length(ops.w),1);    % amplitudes initial batch

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ops.K           = 1;         % after every K<=N batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

SaveAndPlotExcitationSignal(Ai,ops)
