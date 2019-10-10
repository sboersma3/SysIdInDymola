clear;clc

ops.directory   = 'U:\results\ThreeMachineNineBus\2\';

ops.Optimal     = 1;         % generate optimal signal (true) or base signal (false)

ops.N           = 2;         % number of batches (even number or 1)
ops.ll          = 10;        % every ll second the model will be linearized
ops.h           = .01;       % sample period
ops.K           = 1;         % after every K batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

ops.w           = linspace(.1*2*pi,5*2*pi,30)'; % frequency grid

Ai              = 0*ones(length(ops.w),1);    % amplitudes initial batch
Ai(5)           = .1;
Ai(10)          = .1;
Ai(15)          = .1;

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

subplot(1,2,2)
plot(ops.w,Ai,'bo');grid
ylabel('$A_i$','interpreter','latex')
xlabel('$\omega$ (rad/sec)','interpreter','latex')
xlim([ops.w(1) ops.w(end)])
ylim([0 max(Ai)+0.5*max(Ai)])
