clear;clc

addpath(genpath('bin'));

ops.directory   = 'results\HvdcKundur\'; 

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 1;         % number of batches (even number)
ops.ll          = 60;        % every ll second the model will be linearized (60 for OE model)
ops.h           = .005;       % sample period

ops.w           = (.1*2*pi:1*.1*2*pi:5*2*pi)';
Ai              = 1*ones(length(ops.w),1);         % amplitudes initial batch
% Ai(3)           = 1;
% Ai(5)           = 1;
% Ai(8)           = 1;
% Ai(11)           = 1;
% Ai(14)           = 1;
% Ai(17)           = 1;
% Ai(20)           = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ops.K           = 1;         % after every K<=N batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

SaveAndPlotExcitationSignal(Ai,ops)


