clear;clc

ops.directory   = 'results\SingleMachineInfiniteBus\';

ops.Optimal     = 0;         % generate optimal signal (true) or base signal (false)

ops.N           = 1;         % number of batches (even number or 1)
ops.ll          = 10;        % every ll second the model will be linearized
ops.h           = .01;       % sample period
ops.K           = 1;         % after every K batch, the excitation signal is changed
if ops.K>ops.N;ops.K=ops.N;end

ops.w           = linspace(.1*2*pi,3*2*pi,30)'; % frequency grid

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
U = fftshift(fft(u));
N = length(u);                 
f = (-N/2:N/2-1)*(1/ops.h/N);   
P = abs(U).^2/N;                


figure(100);clf
subplot(3,1,1)
plot(t,u);grid
ylabel('$u(t)$','interpreter','latex')
xlabel('$t$ (sec)','interpreter','latex')
title('Excitation signal','interpreter','latex')

subplot(3,1,2)
plot(ops.w,Ai,'bo');grid
ylabel('$A_i$','interpreter','latex')
xlabel('$\omega$ (rad/sec)','interpreter','latex')
xlim([ops.w(1) ops.w(end)])
ylim([0 max(Ai)+0.5*max(Ai)])
title('Excitation signal spectrum','interpreter','latex')

subplot(3,1,3)
plot(f,P,'bo');grid
ylabel('$P$','interpreter','latex')
xlabel('$\omega$ (Hz)','interpreter','latex')
xlim([f(1) f(end)])
ylim([0 max(P)+0.5*max(P)])
title('Excitation signal power','interpreter','latex')


