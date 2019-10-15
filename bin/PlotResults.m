function PlotResults(sys,syshat,signals,SimuResults,SysIdResults,ops,kk)

ll          = ops.ll;
Nb          = ops.Nb;
Nid         = ops.Nid;
mode        = ops.mode;
modeid      = ops.modeid;
w           = ops.w/2/pi;
wi          = signals.wi/2/pi;

zeta        = SimuResults.zeta;
wn          = SimuResults.wn/2/pi;
zetahat     = SimuResults.zetahat;
wnhat       = SimuResults.wnhat/2/pi;
zeta_i      = SimuResults.zeta_i;
wn_i        = SimuResults.wn_i/2/pi;
zetahat_i   = SimuResults.zetahat_i;
wnhat_i     = SimuResults.wnhat_i/2/pi;
pct_y       = SimuResults.pct_y;

u           = signals.u;
t           = signals.t;
y           = signals.y;
yhat        = signals.yhat;

t1          = (kk-1)*Nid+1;
t2          = kk*Nid;

Repsilon    = SysIdResults{kk*ll*Nb}.R(:,1,1);
Repsilon_u  = SysIdResults{kk*ll*Nb}.R(:,1,2);
tau         = SysIdResults{kk*ll*Nb}.tau;
lconf       = SysIdResults{kk*ll*Nb}.lconf;
uconf       = SysIdResults{kk*ll*Nb}.uconf;

if strcmp(modeid,'min')
    [~,modeid]= min(zetahat,[],1);  % take the minimum of estimated damping coeff
    modeid    = modeid(1);          % this can be made time-varying
end
if strcmp(mode,'min')
    [~,mode]  = min(zeta,[],1);     % take the minimum of estimated damping coeff
    mode      = mode(1);            % this can be made time-varying
end
%
fontsize = 15;

figure(1);clf;
subplot(4,1,1);hold on;grid;
ylabel('$u(t)$','interpreter','latex','fontsize',fontsize)
plot(t(t1:t2),u(t1:t2),'b','linewidth',2);

subplot(4,1,2);hold on;grid;
ylabel('$y(t)$','interpreter','latex','fontsize',fontsize)
plot(t(t1:t2),y(t1:t2),'b','linewidth',2);hold on;
plot(t(t1:t2),yhat(t1:t2),'r','linewidth',2);
%title(['mean error = ' ,num2str(pct_y,4), ' \%'],'interpreter','latex')

subplot(4,1,3);hold on;grid;
ylabel('$\zeta_i(t)$','interpreter','latex','fontsize',fontsize);
plot(t(t1:t2),zeta(mode,t1:t2),'b','linewidth',2);hold on;
plot(t(t1:t2),zetahat(modeid,t1:t2),'r--','linewidth',2);
ylim([0 1.5]*max(max(zeta(mode,t1:t2)),max(zetahat(modeid,t1:t2))))
title(['mean($\zeta)$ = ' ,num2str(mean(zeta(mode,t1:t2)),2), '$\quad$ and $\quad$ mean($\hat{\zeta})$ = ',num2str(mean(zetahat(modeid,t1:t2)),2)],'interpreter','latex','fontsize',fontsize)

subplot(4,1,4);hold on;grid;
xlabel('Time $(s)$','interpreter','latex','fontsize',fontsize);
ylabel('$\omega_i(t)$','interpreter','latex','fontsize',fontsize);
plot(t(t1:t2),wn(mode,t1:t2),'b','linewidth',2);hold on;
plot(t(t1:t2),wnhat(modeid,t1:t2),'r--','linewidth',2);
ylim([0 1.5]*max(max(wn(mode,t1:t2)),max(wnhat(modeid,t1:t2))))
title(['mean($\omega_n)$ = ' ,num2str(mean(wn(mode,t1:t2)),2),' (Hz)', '$\quad$ and $\quad$ mean($\hat{\omega}_n)$ = ',num2str(mean(wnhat(modeid,t1:t2)),2),' (Hz)'],'interpreter','latex','fontsize',fontsize)


figure(2);clf
subplot(2,2,[1 2])
opts              = bodeoptions('cstprefs');
opts.PhaseVisible = 'off';
opts.grid         = 'on';
opts.FreqUnits    = 'Hz';
%handle            = bodeplot(sys{kk*ll*Nb}.Gid,logspace(log10(w(1)),log10(w(end)),100),opts);hold on
%bodeplot(syshat{kk*ll*Nb}.sys,logspace(log10(w(1)),log10(w(end)),100),opts);%showConfidence(handle)
handle            = bodeplot(sys{kk*ll*Nb}.Gid,opts);hold on
bodeplot(syshat{kk*ll*Nb}.sys,opts);showConfidence(handle) 
obj      = findobj(gcf,'type','axes');
ax       = obj(2);
ax_ylim  = ax.YLim;
plot(ax,[w(1) w(1)],[ax_ylim(1) ax_ylim(2)],'k--')
plot(ax,[w(end) w(end)],[ax_ylim(1) ax_ylim(2)],'k--')
plot(ax,[wi(1) wi(1)],[ax_ylim(1) ax_ylim(2)],'r--')
plot(ax,[wi(end) wi(end)],[ax_ylim(1) ax_ylim(2)],'r--')
xlabel('$\omega$','interpreter','latex');
ylabel('Magnitude','interpreter','latex');
title('Bodemagnitude of the identified model (red), and true model (blue)','interpreter','latex','fontsize',fontsize)
subplot(2,2,3);
stem(tau,Repsilon,'linewidth',2);grid;hold on;
plot(tau,lconf*ones(size(tau)),'color',[169,169,169]/255,'linewidth',2)
plot(tau,uconf*ones(size(tau)),'color',[169,169,169]/255,'linewidth',2)
xlabel('$\tau$','interpreter','latex','fontsize',fontsize);
ylabel('$R_{\epsilon}$','interpreter','latex','fontsize',fontsize);
xlim([-1 length(SysIdResults{kk*ll*Nb}.R(:,1,1))])
ylim([lconf-.1 uconf+.1])
subplot(2,2,4);
stem(tau,Repsilon_u,'linewidth',2);grid;hold on;
plot(tau,lconf*ones(size(tau)),'color',[169,169,169]/255,'linewidth',2)
plot(tau,uconf*ones(size(tau)),'color',[169,169,169]/255,'linewidth',2)
xlabel('$\tau$','interpreter','latex','fontsize',fontsize);
ylabel('$R_{\epsilon,u}$','interpreter','latex','fontsize',fontsize);
xlim([-1 length(SysIdResults{kk*ll*Nb}.R(:,1,2))])
ylim([lconf-.1 uconf+.1])
%
figure(3);clf
subplot(2,1,1)
stairs(unique(zeta_i(:,kk),'stable'),'bo','linewidth',2);grid;hold on;
stairs(unique(zetahat_i(:,kk),'stable'),'ro','linewidth',2);
ylabel('$\zeta_i$','interpreter','latex','fontsize',fontsize);
xlabel('\# of damping coefficient','interpreter','latex','fontsize',fontsize);
title('true (blue) and estimated (red)','interpreter','latex','fontsize',fontsize)
set(gca,'xtick',0:length(unique(zeta_i(:,kk))))
set(gca,'xlim',[0,length(unique(zeta_i(:,kk)))+1])
set(gca,'ylim',[0,1.1])

ylabel('$\zeta_i$','interpreter','latex');
subplot(2,1,2)
stairs(unique(wn_i(:,kk),'stable'),'bo','linewidth',2);grid;hold on;
stairs(unique(wnhat_i(:,kk),'stable'),'ro','linewidth',2);
ylabel('$\omega_{n,i}$','interpreter','latex','fontsize',fontsize);
xlabel('\# of natural frequencies','interpreter','latex','fontsize',fontsize);
title('true (blue) and estimated (red)','interpreter','latex','fontsize',fontsize)
set(gca,'xtick',0:length(unique(wn_i(:,kk))))
set(gca,'xlim',[0,length(unique(wn_i(:,kk)))+1])


figure(4);clf
subplot(2,1,1)
plot(w,syshat{kk*ops.ll*ops.Nb}.Ai,'ro','linewidth',3);hold on;
plot(wi,syshat{kk*ops.ll*ops.Nb}.Ai_,'bo','linewidth',3);grid;
xlabel('$\omega$ (Hz)','interpreter','latex','fontsize',fontsize);
ylabel('$A_i$','interpreter','latex','fontsize',fontsize);
title('previous spectrum (blue) and optimal spectrum (red) input','interpreter','latex','fontsize',fontsize)
subplot(2,1,2)
plot(diag(syshat{kk*ops.ll*ops.Nb}.P(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar)),'ro','linewidth',3);hold on;
plot(diag(syshat{kk*ops.ll*ops.Nb}.P_(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar)),'bo','linewidth',3);grid;
xlabel('\# of damping coefficient','interpreter','latex','fontsize',fontsize);
title('previous variance (blue) and new variance (red) damping coefficient','interpreter','latex','fontsize',fontsize)
set(gca,'xtick',0:length(syshat{kk*ops.ll*ops.Nb}.CritPar))
set(gca,'xlim',[0,length(syshat{kk*ops.ll*ops.Nb}.CritPar)+1])
set(gca,'ylim',[0,1.2*max(max(diag(syshat{kk*ops.ll*ops.Nb}.P_(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar)),...
    diag(syshat{kk*ops.ll*ops.Nb}.P(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar))))])

