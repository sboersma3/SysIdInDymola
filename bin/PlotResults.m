function PlotResults(sys,syshat,signals,SimuResults,ops)

ll          = ops.ll;
Nb          = ops.Nb;
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

yhat        = signals.yhat;
u           = signals.u(1:length(yhat));
t           = signals.t(1:length(yhat));
y           = signals.y(1:length(yhat));


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
plot(t,u,'b','linewidth',2);

subplot(4,1,2);hold on;grid;
ylabel('$y(t)$','interpreter','latex','fontsize',fontsize)
plot(t,y,'b','linewidth',2);hold on;
plot(t,yhat,'r','linewidth',2);

subplot(4,1,3);hold on;grid;
ylabel('$\zeta_n(t)$','interpreter','latex','fontsize',fontsize);
plot(t,zeta(mode,:),'b','linewidth',2);hold on;
plot(t,zetahat(modeid,:),'r--','linewidth',2);
ylim([0 1.5]*max(max(zeta(mode,:)),max(zetahat(modeid,:))))
title(['mean($\zeta_n)$ = ' ,num2str(mean(zeta(mode,:)),2), '$\quad$ and $\quad$ mean($\hat{\zeta_n})$ = ',num2str(mean(zetahat(modeid,:)),2)],'interpreter','latex','fontsize',fontsize)

subplot(4,1,4);hold on;grid;
xlabel('Time $(s)$','interpreter','latex','fontsize',fontsize);
ylabel('$\omega_n(t)$','interpreter','latex','fontsize',fontsize);
plot(t(:),wn(mode,:),'b','linewidth',2);hold on;
plot(t(:),wnhat(modeid,:),'r--','linewidth',2);
ylim([0 1.5]*max(max(wn(mode,:)),max(wnhat(modeid,:))))
title(['mean($\omega_n)$ = ' ,num2str(mean(wn(mode,:)),2),' (Hz)', '$\quad$ and $\quad$ mean($\hat{\omega}_n)$ = ',num2str(mean(wnhat(modeid,:)),2),' (Hz)'],'interpreter','latex','fontsize',fontsize)


figure(2);clf
subplot(2,2,[1 2])
opts              = bodeoptions('cstprefs');
opts.PhaseVisible = 'off';
opts.grid         = 'on';
opts.FreqUnits    = 'Hz';
%handle            = bodeplot(sys{1*ll*Nb}.Gid,logspace(log10(wi(1,1)),log10(wi(1,end)),100),opts);hold on
%bodeplot(syshat{1*ll*Nb}.sys,logspace(log10(wi(1,1)),log10(wi(1,end)),100),opts);%showConfidence(handle)
handle            = bodeplot(sys{1*ll*Nb}.Gid,opts);hold on
bodeplot(syshat{1*ll*Nb}.sys,opts);showConfidence(handle) 
obj      = findobj(gcf,'type','axes');
ax       = obj(2);
ax_ylim  = ax.YLim;
plot(ax,[w(1) w(1)],[ax_ylim(1) ax_ylim(2)],'k--','linewidth',1.5)
plot(ax,[w(end) w(end)],[ax_ylim(1) ax_ylim(2)],'k--','linewidth',1.5)
plot(ax,[wi(1,1) wi(1,1)],[ax_ylim(1) ax_ylim(2)],'r:','linewidth',1.5)
plot(ax,[wi(1,end) wi(1,end)],[ax_ylim(1) ax_ylim(2)],'r:','linewidth',1.5)
xlabel('$\omega$','interpreter','latex');
ylabel('Magnitude','interpreter','latex');
title({'Bodemagnitude of the identified model (red), and true model (blue)';'Batch $i$'},'interpreter','latex','fontsize',fontsize)
subplot(2,2,[3 4]);
%handle            = bodeplot(sys{2*ll*Nb}.Gid,logspace(log10(wi(2,1)),log10(wi(2,end)),100),opts);hold on
%bodeplot(syshat{2*ll*Nb}.sys,logspace(log10(wi(2,1)),log10(wi(2,end)),100),opts);%showConfidence(handle)
handle            = bodeplot(sys{2*ll*Nb}.Gid,opts);hold on
bodeplot(syshat{2*ll*Nb}.sys,opts);showConfidence(handle) 
obj      = findobj(gcf,'type','axes');
ax       = obj(2);
ax_ylim  = ax.YLim;
plot(ax,[w(1) w(1)],[ax_ylim(1) ax_ylim(2)],'k--','linewidth',1.5)
plot(ax,[w(end) w(end)],[ax_ylim(1) ax_ylim(2)],'k--','linewidth',1.5)
plot(ax,[wi(2,1) wi(2,1)],[ax_ylim(1) ax_ylim(2)],'r:','linewidth',1.5)
plot(ax,[wi(2,end) wi(2,end)],[ax_ylim(1) ax_ylim(2)],'r:','linewidth',1.5)
xlabel('$\omega$','interpreter','latex');
ylabel('Magnitude','interpreter','latex');
title('Batch $i+1$','interpreter','latex','fontsize',fontsize)


%
figure(3);clf
subplot(2,2,1)
stairs(unique(zeta_i(:,1),'stable'),'bo','linewidth',2);grid;hold on;
stairs(unique(zetahat_i(:,1),'stable'),'ro','linewidth',2);
ylabel('$\zeta_i$','interpreter','latex','fontsize',fontsize);
xlabel('\# of damping coefficient','interpreter','latex','fontsize',fontsize);
title('Batch $i$','interpreter','latex','fontsize',fontsize)
set(gca,'xtick',0:length(unique(zeta_i(:,1))))
set(gca,'xlim',[0,length(unique(zeta_i(:,1)))+1])
set(gca,'ylim',[0,1.1])

subplot(2,2,2)
stairs(unique(zeta_i(:,2),'stable'),'bo','linewidth',2);grid;hold on;
stairs(unique(zetahat_i(:,2),'stable'),'ro','linewidth',2);
ylabel('$\zeta_{i+1}$','interpreter','latex','fontsize',fontsize);
xlabel('\# of damping coefficient','interpreter','latex','fontsize',fontsize);
title('Batch $i+1$','interpreter','latex','fontsize',fontsize)
set(gca,'xtick',0:length(unique(zeta_i(:,2))))
set(gca,'xlim',[0,length(unique(zeta_i(:,2)))+1])
set(gca,'ylim',[0,1.1])

subplot(2,2,3)
stairs(unique(wn_i(:,1),'stable'),'bo','linewidth',2);grid;hold on;
stairs(unique(wnhat_i(:,1),'stable'),'ro','linewidth',2);
ylabel('$\omega_i$ (Hz)','interpreter','latex','fontsize',fontsize);
xlabel('\# of natural frequencies','interpreter','latex','fontsize',fontsize);
title('Batch $i$','interpreter','latex','fontsize',fontsize)
set(gca,'xtick',0:length(unique(wn_i(:,1))))
set(gca,'xlim',[0,length(unique(wn_i(:,1)))+1])
set(gca,'ylim',[0,max(wn_i(:,1))*1.1])

subplot(2,2,4)
stairs(unique(wn_i(:,2),'stable'),'bo','linewidth',2);grid;hold on;
stairs(unique(wnhat_i(:,2),'stable'),'ro','linewidth',2);
ylabel('$\omega_{i+1}$ (Hz)','interpreter','latex','fontsize',fontsize);
xlabel('\# of natural frequencies','interpreter','latex','fontsize',fontsize);
title('Batch $i+1$','interpreter','latex','fontsize',fontsize)
set(gca,'xtick',0:length(unique(wn_i(:,2))))
set(gca,'xlim',[0,length(unique(wn_i(:,2)))+1])
set(gca,'ylim',[0,max(wn_i(:,2))*1.1])

sgtitle('true (blue) and estimated (red)','interpreter','latex','fontsize',fontsize)


figure(4);clf
subplot(2,2,1)
plot(syshat{1*ops.ll*ops.Nb}.wi,syshat{1*ops.ll*ops.Nb}.Ai,'bo','linewidth',3);grid;
xlabel('$\omega$ (Hz)','interpreter','latex','fontsize',fontsize);
ylabel('$A_i$','interpreter','latex','fontsize',fontsize);
title('Batch $i$','interpreter','latex','fontsize',fontsize)
subplot(2,2,2)
plot(syshat{2*ops.ll*ops.Nb}.wi,syshat{2*ops.ll*ops.Nb}.Ai,'bo','linewidth',3);grid;
xlabel('$\omega$ (Hz)','interpreter','latex','fontsize',fontsize);
ylabel('$A_{i+1}$','interpreter','latex','fontsize',fontsize);
title('Batch $i+1$','interpreter','latex','fontsize',fontsize)

sgtitle('spectra of the excitation signal','interpreter','latex','fontsize',fontsize)

subplot(2,2,3)
plot(diag(syshat{1*ops.ll*ops.Nb}.P(syshat{1*ops.ll*ops.Nb}.CritPar,syshat{1*ops.ll*ops.Nb}.CritPar)),'ro','linewidth',3);grid
xlabel('\# of damping coefficient','interpreter','latex','fontsize',fontsize);
set(gca,'xtick',0:length(syshat{1*ops.ll*ops.Nb}.CritPar))
set(gca,'xlim',[0,length(syshat{1*ops.ll*ops.Nb}.CritPar)+1])
set(gca,'ylim',[0,1.2*max(max(diag(syshat{1*ops.ll*ops.Nb}.P(syshat{1*ops.ll*ops.Nb}.CritPar,syshat{1*ops.ll*ops.Nb}.CritPar)),...
    diag(syshat{1*ops.ll*ops.Nb}.P(syshat{1*ops.ll*ops.Nb}.CritPar,syshat{1*ops.ll*ops.Nb}.CritPar))))])
ylabel('var($\zeta_{i}$)','interpreter','latex','fontsize',fontsize);
title('Batch 1','interpreter','latex','fontsize',fontsize)
subplot(2,2,4)
plot(diag(syshat{2*ops.ll*ops.Nb}.P(syshat{2*ops.ll*ops.Nb}.CritPar,syshat{2*ops.ll*ops.Nb}.CritPar)),'ro','linewidth',3);grid;
xlabel('\# of damping coefficient','interpreter','latex','fontsize',fontsize);
set(gca,'xtick',0:length(syshat{2*ops.ll*ops.Nb}.CritPar))
set(gca,'xlim',[0,length(syshat{2*ops.ll*ops.Nb}.CritPar)+1])
set(gca,'ylim',[0,1.2*max(max(diag(syshat{2*ops.ll*ops.Nb}.P(syshat{2*ops.ll*ops.Nb}.CritPar,syshat{2*ops.ll*ops.Nb}.CritPar)),...
    diag(syshat{2*ops.ll*ops.Nb}.P(syshat{2*ops.ll*ops.Nb}.CritPar,syshat{2*ops.ll*ops.Nb}.CritPar))))])
ylabel('var($\zeta_{i+1}$)','interpreter','latex','fontsize',fontsize);
title('Batch $i+1$','interpreter','latex','fontsize',fontsize)

sgtitle('variance of the damping coeffcient','interpreter','latex','fontsize',fontsize)
