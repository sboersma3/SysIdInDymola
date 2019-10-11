clear;clc

ops.directory   = 'U:\results\ThreeMachineNineBus\';

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 1;         % number of batches (even number or 1)
ops.ll          = 120;        % every ll second the model will be linearized
ops.h           = .1;        % sample period
ops.K           = 1;         % after every K batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

ops.w           = linspace(.1*2*pi,5*2*pi,30)'; % frequency grid

Ai              = .1*ones(length(ops.w),1);    % amplitudes initial batch

u = 0;
rng(4)
for kk=1:length(ops.w)
   thetai(kk) = randn;
   u          = u + Ai(kk)*sin(ops.w(kk)*(0:ops.h:ops.N*ops.ll)+thetai(kk)); 
end


A            = zeros(ops.N,length(ops.w));
for kk=1:ops.K
    A(kk,:)     = Ai;
end

for kk=ops.K+1:ops.N
    if ops.Optimal
        load(strcat(ops.directory,'OptimalInput.mat'))
        A(kk,:)   = OptimalInput(:,2);
    else
        A(kk,:)   = A(kk-1,:);
    end
end
B      = repmat(ops.w,1,ops.N);
C      = repmat(thetai',1,ops.N);


h   = ops.h;
ll  = ops.ll;
N   = ops.N;
K   = ops.K;


save(strcat(ops.directory,'InputDymola.mat'),'A','B','C','h','ll','N','K')


t = 0:ops.h:ops.N*ops.ll;
figure(100);clf
subplot(1,2,1)
plot(t,u);grid
ylabel('$u(t)$','interpreter','latex')
xlabel('$t$ (sec)','interpreter','latex')
title('Excitation signal','interpreter','latex')

subplot(1,2,2)
plot(ops.w,Ai,'bo');grid
ylabel('$A_i$','interpreter','latex')
xlabel('$\omega$ (rad/sec)','interpreter','latex')
xlim([ops.w(1) ops.w(end)])
ylim([0 max(Ai)+0.5*max(Ai)])
title('Excitation signal spectrum','interpreter','latex')
