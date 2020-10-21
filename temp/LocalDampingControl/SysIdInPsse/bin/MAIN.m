cd ../

addpath(genpath('bin')); warning('off','Ident:dataprocess:idresampSignalAlert');

% load parameters ll,h and N from PSSE
parameters     = readmatrix(strcat(ops.directory,'parameters.txt')); 

ops.N          = parameters(3);         % number of batches simulation
ops.ll         = parameters(2)/ops.N;   % every ll second the model will be linearized
ops.h          = parameters(1);         % sample period
ops.Nb         = 1;                     % #of batches in each identification cycle
ops.sigma      = ops.sigma_e;           % standard deviation noise

if ops.h_new==0
    ops.h_new = ops.h;
end

ops.Nid        = floor(ops.Nb*ops.ll/ops.h_new);     % every Nid sample we identify

% load time domain data
[signals,ops]  = LoadPsseData(ops);

% preprocessing data
[signals,ops]  = ResampleData(signals,ops);

if ops.European
    ops.Nid = length(signals.t);
end
 
% identification/validation
syshat         = IdentifyModel(signals,ops);
SysIdResults   = TestIdentifiedModel(syshat,signals,ops);

% optimal input design
%syshat         = OptimalInputDesign(syshat,signals.u,ops);

% simulate estimated linear model
signals        = SimulateIdentifiedModel(syshat,signals,ops);

% postprocessing data
SimuResults    = PostProcessing(syshat,ops);


PlotResults(sys,syshat,signals,SimuResults,SysIdResults,ops)

% validate if model second batch can estimate data first batch
ValidateModel(syshat,signals,ops)