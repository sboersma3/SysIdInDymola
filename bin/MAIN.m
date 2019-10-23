cd ../

addpath(genpath('bin')); warning('off','Ident:dataprocess:idresampSignalAlert');

% load parameters ll,h and N from Dymola
parameters     = dlmread(strcat(ops.directory,'parameters.txt'),' ',0,1);

ops.N          = parameters(1);         % number of batches simulation
ops.ll         = parameters(2);         % every ll second the model will be linearized
ops.h          = parameters(3);         % sample period
ops.Nw         = parameters(4);         % #of frequencies considered in input
ops.Nb         = parameters(5);         % #of batches in each identification cycle
ops.sigma      = parameters(8);         % standard deviation noise

if ops.h_new==0
    ops.h_new = ops.h;
end

ops.Nid        = floor(ops.Nb*ops.ll/ops.h_new);     % every Nid sample we identify
ops.Nw         = length(ops.w);

% load time domain data
[sys,signals]  = LoadDymolaData(ops);

% preprocessing data
[signals,ops]  = ResampleData(signals,ops);
signals        = FilterData(signals,ops);

% identification/validation
syshat         = IdentifyModel(signals,ops);
SysIdResults   = TestIdentifiedModel(syshat,signals,ops);

% optimal input design
syshat         = OptimalInputDesign(syshat,signals.u,ops);

% simulate estimated linear model
signals        = SimulateIdentifiedModel(syshat,signals,ops);

% postprocessing data
SimuResults    = PostProcessing(sys,syshat,signals,ops);

% plot results per batch
% for kk=1:floor(ops.N/ops.Nb)
%     PlotResultsPerBatch(sys,syshat,signals,SimuResults,SysIdResults,ops,kk)
%     pause
% end
% clear kk

PlotResults(sys,syshat,signals,SimuResults,ops)


