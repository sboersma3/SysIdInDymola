clear;clc

ops.directory   = 'U:\results\Nordic44\';

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 2;         % number of batches (even number)
ops.ll          = 10;        % every ll second the model will be linearized
ops.h           = .01;       % sample period
ops.K           = 2;         % after every K<=N batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

ops.w           = linspace(.1*2*pi,5*2*pi,30);            % frequency grid

Ai              = .10*ones(length(ops.w),1);    % amplitudes initial batch
wi              = ops.w';                       % frequencies initial batch

u = 0;
rng(4)
for kk=1:length(wi)
   u = u + Ai(kk)*sin(wi(kk)*(0:ops.h:ops.N*ops.ll)+randn); 
end
% figure(100);clf
% plot(u)

%
ind  = [];
for kk=1:length(wi)
    [~,temp] = min(abs(wi(kk)-ops.w));   
    ind      = [ind; temp]; 
end

A            = zeros(ops.N,length(ops.w));
for kk=1:ops.K
    A(kk,ind)     = Ai;
end

for kk=ops.K+1:ops.N
    if ops.Optimal
        load(strcat(ops.directory,'OptimalInput.mat'))
        A(kk,:)   = OptimalInput(:,2);
    else
        A(kk,:)   = A(kk-1,:);
    end
end
B   = repmat(ops.w',1,ops.N);


h   = ops.h;
ll  = ops.ll;
N   = ops.N;
K   = ops.K;

save(strcat(ops.directory,'InputDymola.mat'),'A','B','h','ll','N','K')

clear



