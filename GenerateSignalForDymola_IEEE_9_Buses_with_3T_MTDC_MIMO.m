clear;clc

addpath(genpath('bin'));

ops.directory   = 'results\IEEE_9_Buses_with_3T_MTDC_MIMO\';

ops.q           = 1;         % 1 for phase measurement, frequency measurement otherwise

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 1;         % number of batches (even number)
ops.ll          = 120;        % every ll second the model will be linearized
ops.h           = .01;       % sample period
if ops.q
    ops.w           = linspace(.1*2*pi,5*2*pi,40)'; % frequency grid
    Ai              = 3*ones(length(ops.w),1);      % amplitudes initial batch
else
    ops.w           = linspace(.1*2*pi,5*2*pi,40)'; % frequency grid
    Ai              = .5*ones(length(ops.w),1);      % amplitudes initial batch
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ops.K           = 1;         % after every K<=N batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end
ops.MIMO        = true;

SaveAndPlotExcitationSignal(Ai,ops)
