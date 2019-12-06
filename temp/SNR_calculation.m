ops.N           = 2;         % number of batches (even number)
ops.ll          = 100000;        % every ll second the model will be linearized
ops.h           = .02;       % sample period

t               = 0:ops.h:ops.N*ops.ll-ops.h;

e               = 0.07*randn(ops.N*ops.ll/ops.h,1); %0.07 as Pierres SNR

ops.w           = linspace(.1*2*pi,2.5*2*pi,30)'; % frequency grid
Ai              = .02*ones(length(ops.w),1);    % amplitudes initial batch

rng(4)
thetai          = 2*pi.*rand(1,length(ops.w)) - pi; % phase initial batch

u = 0;
for kk=1:length(ops.w)
    
   u = u + Ai(kk)*sin(ops.w(kk)*t+thetai(kk)); 
end


figure(11);clf;
plot(t,u);grid;hold on;
plot(t,e,'r--');


Pu = sum(abs(u).^2)/length(u);
Pe = sum(abs(e).^2)/length(e);

SNR = 20*log10(Pu./Pe);


[sum(Ai.^2/2) Pu Pe SNR]