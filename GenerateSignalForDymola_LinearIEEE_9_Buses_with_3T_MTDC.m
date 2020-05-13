clear;clc

addpath(genpath('bin'));

ops.directory   = 'results\LinearIEEE_9_Buses_with_3T_MTDC\';

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 1;         % number of batches (even number)
ops.ll          = 50;        % every ll second the model will be linearized
ops.h           = .005;       % sample period

ops.w           = linspace(.1*2*pi,3*2*pi,30)'; % frequency grid
Ai              = .1*ones(length(ops.w),1);    % amplitudes initial batch

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ops.K           = 1;         % after every K<=N batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

SaveAndPlotExcitationSignal(Ai,ops)