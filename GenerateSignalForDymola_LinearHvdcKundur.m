clear;clc

addpath(genpath('bin'));

ops.directory   = 'results\LinearHvdcKundur\'; 

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 3;         % number of batches (even number)
ops.ll          = 100;        % every ll second the model will be linearized (60 for OE model)
ops.h           = .005;       % sample period

ops.w           = (.1*2*pi:1*.1*2*pi:3*2*pi)';
Ai              = 0*0.05*ones(length(ops.w),1);         % amplitudes initial batch
Ai(10)          = .8;
Ai(15)          = .8;
Ai(20)          = .8;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ops.K           = 1;         % after every K<=N batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

SaveAndPlotExcitationSignal(Ai,ops)

