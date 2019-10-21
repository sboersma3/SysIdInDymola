

%% TestExample (without sysid, i.e., true system is assumed to be exactly know)



%% Optimal experiment test
clear;clc

addpath(genpath('bin'));

h                   = 0.01;
t                   = 0:h:40-h;
ops.Nid             = length(t);
ops.w               = linspace(.1*2*pi,3*2*pi,20);
ops.Nw              = length(ops.w);

% define true system
wn                  = 5;
zeta                = .1;
z                   = tf('z',h);
G0                  = c2d(tf(wn^2,[1 2*zeta*wn wn^2]),h);    
H0                  = c2d(tf([1 3 1],[1 2*zeta*wn wn^2]),h);

[magG0,~,~]         = bode(G0,ops.w);
[magH0,~,~]         = bode(H0,ops.w);
[numG0,den0]        = tfdata(G0,'v');
[numH0,~]           = tfdata(H0,'v');
D                   = pole(G0);
D                   = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
p0                  = D;
D                   = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
zeta0               = abs(-real(log(D))./abs(log(D)));      % damping ratios
wn0                 = abs(log(D)/h);                        % natural frequency

pr                  = p0(imag(p0)==0);
zetahatr            = zeta0(1:length(pr));
wnhatr              = wn0(1:length(pr)).*zetahatr;
pi                  = p0(imag(p0)~=0);
zetahati            = zeta0(length(pr)+1:length(pr)+length(pi));
wnhati              = wn0(length(pr)+1:length(pr)+length(pi));
nr0                 = size(pr,1);
ni0                 = size(pi,1)/2;

denrho     = 1;
for ll=1:nr0
    denrho = denrho*(z-sign(pr(ll))*exp(-wnhatr(ll)*h));
end

for ll=1:ni0
    denrho = denrho*(z^2+...
        -2*exp(-zetahati(2*ll-1)*wnhati(2*ll-1)*h)*cos(wnhati(2*ll-1)*sqrt(1-zetahati(2*ll-1)^2)*h)*z + ...
        exp(-2*zetahati(2*ll-1)*wnhati(2*ll-1)*h));
end
Grho0                = tf(numG0,tfdata(denrho,'v'),h);
Hrho0                = tf(numH0,tfdata(denrho,'v'),h);


% true parameter vector
rho0         = [];
for kk=1:nr0
    rho0   = [rho0 wnhatr(kk)]; 
end
for kk=1:ni0
    rho0   = [rho0 wnhati(2*kk-1)];
    rho0   = [rho0 zetahati(2*kk-1)]; 
end

temp       = nonzeros(numH0);
rho0       = [rho0 nonzeros(numG0)' temp(2:end)'];
theta0     = [den0(2:end) nonzeros(numG0)' temp(2:end)'];


clear temp directory G zz den D zetahati zetahatr wnhatr pi pr kk ll wn zeta;


% Optimal experiment

% base
sigma_e         = 1;
sigma_u         = .1;
% define input signals
t               = t;
ops.Nid         = length(t);
ops.Ai          = sigma_u*ones(1,ops.Nw);

syshat.Gz       = G0;
syshat.Hz       = H0;
syshat.G        = ss(G0);
syshat.H        = ss(H0);
syshat.vare     = sigma_e;
syshat.numG     = numG0;
syshat.numH     = numH0;
syshat.p        = p0;
syshat.zeta     = zeta0;
syshat.wn       = wn0;
syshat.h        = h;
syshat.na       = length(den0(2:end));
syshat.nb       = nnz(numG0);
syshat.nc       = nnz(numH0)-1;
syshat.CritPar  = 2;


syshat          = get_Fu_and_Fe(syshat);
vare            = syshat.vare;
Fuz             = syshat.Fuz;
Fez             = syshat.Fez;

Fuw             = freqresp(Fuz,ops.w);
M               = [];
for kk=1:ops.Nw
    M = [M,(ops.Nid/vare/2)*real(Fuw(:,:,kk)*Fuw(:,:,kk)')];    
end


[a,b,c,d] = ssdata(minreal(ss(Fez),[],false));
Q         = b*b';
X         = dlyap(a,Q);
Mbar      = ops.Nid*c*X*c'+d*d';
nx        = size(Mbar,1);

% covariance matrix base case
Pbase     = inv(Mbar + M * kron(ops.Ai'.^2,eye(nx)));
ubase     = 0;
rng(4)
for ll=1:ops.Nw
    thetai(ll) = randn;
    ubase      = ubase + ops.Ai(ll)*sin(ops.w(ll)*t+thetai(ll))';
end


% now in two batches
% first batch
t1              = t(1:ceil(length(t)/2));
t2              = t(length(t1)+1:end);
ops.Nid         = length(t1);
ops.Ai          = sigma_u*ones(1,ops.Nw);
syshat.Gz       = G0;
syshat.Hz       = H0;
syshat.G        = ss(G0);
syshat.H        = ss(H0);
syshat.vare     = sigma_e;
syshat.numG     = numG0;
syshat.numH     = numH0;
syshat.p        = p0;
syshat.zeta     = zeta0;
syshat.wn       = wn0;
syshat.h        = h;
syshat.na       = length(den0(2:end));
syshat.nb       = nnz(numG0);
syshat.nc       = nnz(numH0)-1;
syshat.nk       = 0;
syshat.CritPar  = 2;


syshat         = get_Fu_and_Fe(syshat);
vare           = syshat.vare;
Fuz            = syshat.Fuz;
Fez            = syshat.Fez;

Fuw            = freqresp(Fuz,ops.w);
M              = [];
for kk=1:ops.Nw
    M = [M,(ops.Nid/vare/2)*real(Fuw(:,:,kk)*Fuw(:,:,kk)')];    
end


[a,b,c,d] = ssdata(minreal(ss(Fez),[],false));
Q         = b*b';
X         = dlyap(a,Q);
Mbar      = ops.Nid*c*X*c'+d*d';
nx        = size(Mbar,1);

% covariance matrix
P1     = inv(Mbar + M * kron(ops.Ai'.^2,eye(nx)));
u1     = 0;
for ll=1:ops.Nw
    u1 = u1 + ops.Ai(ll)*sin(ops.w(ll)*t1+thetai(ll))';
end

% second batch
ops.Nid                = length(t2);
ops.c1                 = 1;                                  % weithing factor for input 
ops.c2                 = (1-ops.c1);                          % weithing factor for output
ops.alpha              = P1(syshat.CritPar,syshat.CritPar) - Pbase(syshat.CritPar,syshat.CritPar);
[PHIopt,vecC,C,P2]     = get_optimal_spectrum_input(syshat,ops);

Popt                   = P1-P2;
Pbase(syshat.CritPar,syshat.CritPar)
Popt(syshat.CritPar,syshat.CritPar)


u2     = 0;
for ll=1:ops.Nw
    ops.Aiopt(ll) = sqrt(PHIopt(ll));
    u2            = u2 + ops.Aiopt(ll)*sin(ops.w(ll)*t1+thetai(ll))';
end

uopt = [u1;-u2];

% simulate model wiht ubase and uopt = [u1;u2]
rng(66)
e     = 0*randn(1,length(t));

ybase = lsim(G0,ubase,t) + lsim(H0,e,t);
yopt  = lsim(G0,uopt,t)  + lsim(H0,e,t);

figure(1);clf;
subplot(2,3,1)
plot(ops.w,ops.Ai,'ro','linewidth',3);grid;
xlabel('$\omega$ (rad/s)','interpreter','latex');
ylabel('$A_i$','interpreter','latex');
ylim([0 1.1*max(ops.Aiopt)])
subplot(2,3,2)
plot(t,ubase,'r');grid
ylabel('$u_{base}$','interpreter','latex');
title(['$P_u$ = ' ,num2str(ubase'*ubase/(ubase'*ubase),4)],'interpreter','latex'); 
subplot(2,3,3)
plot(t,ybase);grid
ylabel('$y_{base}$','interpreter','latex');
title(['$P_y$ = ' ,num2str(ybase'*ybase/(ybase'*ybase),4)],'interpreter','latex');
subplot(2,3,4)
plot(ops.w,ops.Aiopt,'ro','linewidth',3);grid;hold on;
xlabel('$\omega$ (rad/s)','interpreter','latex');
ylabel('$A_i$','interpreter','latex');
obj      = findobj(gcf,'type','axes');
ax       = obj(2);
ax_ylim  = ax.YLim;
plot([wnhati(1) wnhati(1)],[ax_ylim(1) ax_ylim(2)],'k--','linewidth',1.5)
ylim([0 1.1*max(ops.Aiopt)])
subplot(2,3,5)
plot(t,uopt,'r');grid
ylabel('$u_{opt}$','interpreter','latex');
title(['$P_u$ = ' ,num2str(uopt'*uopt/(ubase'*ubase),4)],'interpreter','latex'); 
subplot(2,3,6)
plot(t,yopt);grid
ylabel('$y_{opt}$','interpreter','latex');
xlabel('$t$ (sec)','interpreter','latex');
title(['$P_y$ = ' ,num2str(yopt'*yopt/(ybase'*ybase),4)],'interpreter','latex')











%% Check if estimation is unbiased and check variance expression (needs to be checked)
clear;clc

addpath(genpath('bin'));

h                   = 0.01;
t                   = 0:h:40-h;
ops.Nid             = length(t);
ops.w               = linspace(0.01,20,50);
ops.wlog            = logspace(log10(0.1),log10(40),100);
ops.Nw              = length(ops.w);

% define true system
z                   = tf('z',h);
G0                  = c2d(tf(10^2,[1 2*.1*10 10^2]),h);    
H0                  = c2d(tf([1 3 1],[1 2*.1*10 10^2]),h);

[magG0,~,~]         = bode(G0,ops.wlog);
[magH0,~,~]         = bode(H0,ops.wlog);
[numG0,den0]        = tfdata(G0,'v');
[numH0,~]           = tfdata(H0,'v');
D                   = pole(G0);
D                   = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
p0                  = D;
D                   = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
zeta0               = abs(-real(log(D))./abs(log(D)));      % damping ratios
wn0                 = abs(log(D)/h);                        % natural frequency

pr                  = p0(imag(p0)==0);
zetahatr            = zeta0(1:length(pr));
wnhatr              = wn0(1:length(pr)).*zetahatr;
pi                  = p0(imag(p0)~=0);
zetahati            = zeta0(length(pr)+1:length(pr)+length(pi));
wnhati              = wn0(length(pr)+1:length(pr)+length(pi));
nr0                 = size(pr,1);
ni0                 = size(pi,1)/2;

denrho     = 1;
for ll=1:nr0
    denrho = denrho*(z-sign(pr(ll))*exp(-wnhatr(ll)*h));
end

for ll=1:ni0
    denrho = denrho*(z^2+...
        -2*exp(-zetahati(2*ll-1)*wnhati(2*ll-1)*h)*cos(wnhati(2*ll-1)*sqrt(1-zetahati(2*ll-1)^2)*h)*z + ...
        exp(-2*zetahati(2*ll-1)*wnhati(2*ll-1)*h));
end
Grho0                = tf(numG0,tfdata(denrho,'v'),h);
Hrho0                = tf(numH0,tfdata(denrho,'v'),h);


% true parameter vector
rho0         = [];
for kk=1:nr0
    rho0   = [rho0 wnhatr(kk)]; 
end
for kk=1:ni0
    rho0   = [rho0 wnhati(2*kk-1)];
    rho0   = [rho0 zetahati(2*kk-1)]; 
end

temp       = nonzeros(numH0);
rho0       = [rho0 nonzeros(numG0)' temp(2:end)'];
theta0     = [den0(2:end) nonzeros(numG0)' temp(2:end)'];


clear temp directory G zz den D zetahati wnhati zetahatr wnhatr pi pr kk ll;

na           = length(den0(2:end));
nb           = nnz(numG0);
nc           = nnz(numH0)-1;
nk           = 1;


for kk=1:20
    
    sigma_e     = 100;
    sigma_u     = 100;
    
    % define input signals
    e           = sigma_e*randn(ops.Nid,1);
    u           = 0;%sigma_u*randn(ops.Nid,1);
    ops.Ai      = sigma_u*ones(1,ops.Nw);
    for ll=1:ops.Nw
        u = u + ops.Ai(ll)*sin(ops.w(ll)*t)';
    end

    
    % simulation true system
    y                       = lsim(G0,u,t) + lsim(H0,e,t);
    
    syshat.sys              = armax(iddata(detrend(y),detrend(u),h),[na nb nc nk]);
    
    [den,numG,numH,~,~]     = polydata(syshat.sys);
    syshat.den              = den;
    syshat.numG             = numG;
    syshat.numH             = numH;
    syshat.G                = tf(numG,den,h);
    syshat.H                = tf(numH,den,h);
    [syshat.magG(:,kk),~,~] = bode(syshat.G,ops.wlog);
    [syshat.magH(:,kk),~,~] = bode(syshat.H,ops.wlog);
    
    syshat.h                = h;
    syshat.na               = na;
    syshat.nk               = nk;
    syshat.nb               = nnz(numG);
    syshat.nc               = nnz(numH)-1;
    syshat.vare             = syshat.sys.NoiseVariance;
    syshat.Ptheta(:,:,kk)   = getcov(syshat.sys);
    temp                    = nonzeros(syshat.numH);
    syshat.theta(:,kk)      = [syshat.den(2:end) nonzeros(syshat.numG)' temp(2:end)'];
    
    % rho parameterization
    D                       = pole(syshat.G);
    D                       = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
    syshat.p                = D;
    D                       = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
    syshat.zeta             = abs(-real(log(D))./abs(log(D)));      % damping ratios
    syshat.wn               = abs(log(D)/h);                        % natural frequency
    pr                      = syshat.p(imag(syshat.p)==0);
    zetahatr                = syshat.zeta(1:length(pr));
    wnhatr                  = syshat.wn(1:length(pr)).*zetahatr;
    pi                      = syshat.p(imag(syshat.p)~=0);
    zetahati                = syshat.zeta(length(pr)+1:length(pr)+length(pi));
    wnhati                  = syshat.wn(length(pr)+1:length(pr)+length(pi));   
    syshat.nr               = size(pr,1);
    syshat.ni               = size(pi,1)/2;
    
    
    % parameter vector
    temp         = [];
    for ll=1:syshat.nr
        temp   = [temp wnhatr(ll)];
    end
    for ll=1:syshat.ni
        temp   = [temp wnhati(2*ll-1)];
        temp   = [temp zetahati(2*ll-1)];
    end
    
    syshat.rho(:,kk)    = [temp nonzeros(syshat.numG)' nonzeros(syshat.numH(2:end))'];
    
    denrho     = 1;
    for ll=1:syshat.nr
        denrho = denrho*(z-sign(pr(ll))*exp(-wnhatr(ll)*h));
    end
    
    for ll=1:syshat.ni
        denrho = denrho*(z^2+...
            -2*exp(-zetahati(2*ll-1)*wnhati(2*ll-1)*h)*cos(wnhati(2*ll-1)*sqrt(1-zetahati(2*ll-1)^2)*h)*z + ...
            exp(-2*zetahati(2*ll-1)*wnhati(2*ll-1)*h));
    end

    syshat.Grho                = tf(numG,tfdata(denrho,'v'),h);  
    [syshat.magGrho(:,kk),~,~] = bode(syshat.Grho,ops.wlog);
    syshat.Hrho                = tf(numH,tfdata(denrho,'v'),h);  
    [syshat.magHrho(:,kk),~,~] = bode(syshat.Hrho,ops.wlog);
    
    % compute covariance
    syshat              = get_Fu_and_Fe(syshat);
    Fuw                 = freqresp(syshat.Fuz,ops.w);
    M                   = [];
    for ll=1:ops.Nw
        M = [M,(ops.Nid/syshat.vare/2)*real(Fuw(:,:,ll)*Fuw(:,:,ll)')];
    end
    
    [a,b,c,d]               = ssdata(minreal(ss(syshat.Fez),[],false));
    Q                       = b*b';
    X                       = dlyap(a,Q);
    Mbar                    = ops.Nid*c*X*c'+d*d';
    nx                      = size(Mbar,1);    
    syshat.Prho(:,:,kk)     = inv(Mbar + M * kron(ops.Ai'.^2,eye(nx)));
    
    % compute correlation tests   
    [~,temp]                = resid(iddata(detrend(y),detrend(u),h),syshat.sys);
    syshat.R(:,kk)          = temp(:,1,1);
    syshat.lconf            = -(sqrt(2)*erfcinv(2*.01/2))/sqrt(ops.Nid);
    syshat.uconf            = (sqrt(2)*erfcinv(2*.01/2))/sqrt(ops.Nid);
    syshat.tau              = 0:1:size(temp,1)-1;

    syshat.fit(kk)          = syshat.sys.report.Fit.FitPercent;

    syshat.CritPar    = [];
    for ll=1:syshat.ni
        syshat.CritPar = [syshat.CritPar syshat.nr+2*ll];     % element number of theta that has constrained variance
    end
    
end
%clear temp D zetahati wnhati zetahatr wnhatr pi pr na nb nc kk den numG numH a b c d Q X Mbar nx M Fuw ll nk;

syshat.Prho_mean        = mean(syshat.Prho,3);
syshat.rho_mean         = mean(syshat.rho,2)';
syshat.Ptheta_mean      = mean(syshat.Ptheta,3);
syshat.theta_mean       = mean(syshat.theta,2)';

[theta0' syshat.theta_mean' diag(syshat.Ptheta_mean) var(syshat.theta,0,2)]
[rho0' syshat.rho_mean' diag(syshat.Prho_mean) var(syshat.rho,0,2)]


figure(2);clf
subplot(2,1,1)
loglog(ops.wlog,squeeze(magG0),'linewidth',2);hold on
loglog(ops.wlog,mean(syshat.magG,2),'r--','linewidth',2);
loglog(ops.wlog,mean(syshat.magGrho,2),'o','linewidth',2);grid
xlabel('$\omega$','interpreter','latex');
ylabel('Magnitude','interpreter','latex');
title('Bodemagnitude $G$ identified model (red), and true model (blue)','interpreter','latex')
xlim([ops.wlog(1) ops.wlog(end)]);
subplot(2,1,2)
loglog(ops.wlog,squeeze(magH0),'linewidth',2);hold on
loglog(ops.wlog,mean(syshat.magH,2),'r--','linewidth',2);
loglog(ops.wlog,mean(syshat.magHrho,2),'o','linewidth',2);grid
xlabel('$\omega$','interpreter','latex');
ylabel('Magnitude','interpreter','latex');
title('Bodemagnitude $H$ identified model (red), and true model (blue)','interpreter','latex')
xlim([ops.wlog(1) ops.wlog(end)]);

figure(3);clf
subplot(2,1,1);
stem(syshat.tau,mean(syshat.R,2)/max(mean(syshat.R,2)),'linewidth',2);grid;hold on;
plot(syshat.tau,syshat.lconf*ones(size(syshat.tau)),'color',[169,169,169]/255,'linewidth',2)
plot(syshat.tau,syshat.uconf*ones(size(syshat.tau)),'color',[169,169,169]/255,'linewidth',2)
xlabel('$\tau$','interpreter','latex');
ylabel('$R_{\epsilon}$','interpreter','latex');
xlim([-1 length(syshat.R(:,1,1))])
ylim([0-.2 1+.2])

