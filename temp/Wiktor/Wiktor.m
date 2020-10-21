clear; clc

% load the linearized Dymola model
load('LinRes');

A  = ABCD(1:nx,1:nx);B = ABCD(1:nx,nx+1:end);C = ABCD(nx+1:end,1:nx);D = ABCD(nx+1:end,nx+1:end);
G  = ss(A,B(:,1),C(1,:),D(1,1));
H  = ss(A,B(:,3),C(1,:),D(1,3)); clear A B C D

% make excitation signal for sysid experiment
L    = 40;                  % length of sysid experiment
h    = 0.05;                % sample time
t    = 0:h:L;
w    = (0.1:2*0.1:5)*2*pi;
phi  = 2*pi*randn(length(w))-pi;
Ai   = 3/2*ones(length(w));

u    = 0;
for kk=1:length(w)
    u = u + Ai(kk)*sin(w(kk)*t+phi(kk));
end

% generate noise
sigma_e = 1;
e       = sigma_e*randn(length(t),1); 

% run experiment for sysid
y    = lsim(G,u,t) + lsim(H,e,t);
data = iddata(detrend(y),detrend(u'),h);

% sysid
na         = 4;         % #of states of estimated model
nb         = na-1;      % #of parameters in numerator G
nc         = na-3;      % #of parameters in numerator H
nk         = 0;         % #of delays in G

syshat     = armax(data, [na nb nc nk]);
GhatHhat   = tf(syshat,'augmented');

figure(1);clf
subplot(2,1,1)
bodemag(G);hold on
bodemag(GhatHhat(1,1));grid
legend('$G$','$\hat{G}$','interpreter','latex','fontsize',16)
title('Bode magnitude plot','interpreter','latex','fontsize',16)
xlim([w(1) w(end)])
subplot(2,1,2)
bodemag(H);hold on
bodemag(GhatHhat(1,2));grid
legend('$H$','$\hat{H}$','interpreter','latex','fontsize',16)
title('Bode magnitude plot','interpreter','latex','fontsize',16)
xlim([w(1) w(end)])


figure(2);clf
compare(syshat,data);grid




%%
clear;clc
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

y = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);

Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure(1);clf
subplot(2,1,1)
plot(1000*t(1:50),y(1:50));grid
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('y(t)')
subplot(2,1,2)
plot(f,P1);grid 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')