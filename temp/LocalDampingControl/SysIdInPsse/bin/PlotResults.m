function PlotResults(sys,syshat,signals,SimuResults,SysIdResults,ops)

ll          = ops.ll;
N           = ops.N;
Nb          = ops.Nb;
modeid      = ops.modeid;
w           = signals.wi/2/pi;
wi          = signals.wi/2/pi;

zetahat     = SimuResults.zetahat;
wnhat       = SimuResults.wnhat/2/pi;
zetahat_i   = SimuResults.zetahat_i;
wnhat_i     = SimuResults.wnhat_i/2/pi;

yhat        = signals.yhat;
u           = signals.u(1:length(yhat));
t           = signals.t(1:length(yhat));
y           = signals.y(1:length(yhat));

for kk=1:N
    temp(kk) = syshat{kk*ll*Nb}.fit;
end
fit = mean(temp);

if strcmp(modeid,'min')
    [~,modeid]= min(zetahat,[],1);  % take the minimum of estimated damping coeff
    modeid    = modeid(1);          % this can be made time-varying
    if ops.Dymola
        [~,mode]  = min(sys.zeta,[],1);     % take the minimum of estimated damping coeff
        mode      = mode(1);            % this can be made time-varying
    end
end
%
fontsize = 15;

figure(1);clf;
subplot(4,1,1);hold on;grid;
ylabel('$u(t)$','interpreter','latex','fontsize',fontsize)
plot(t,u,'b','linewidth',2);
for kk=1:ops.N;vline(kk*ops.ll,'k--');end

subplot(4,1,2);hold on;grid;
ylabel('$y(t)$','interpreter','latex','fontsize',fontsize)
plot(t,y,'b','linewidth',2);hold on;
plot(t,yhat,'r','linewidth',2);
title(['mean(fit) = ' ,num2str(fit,3),' \%'],'interpreter','latex','fontsize',fontsize)
for kk=1:ops.N;vline(kk*ops.ll,'k--');end

subplot(4,1,3);hold on;grid;
ylabel('$\zeta_n(t)$','interpreter','latex','fontsize',fontsize);
if ops.Dymola
    plot(t,sys.zeta(mode)*ones(1,length(zetahat(modeid,:))),'b','linewidth',2);hold on;
end
plot(t,zetahat(modeid,:),'r--','linewidth',2);

ylim([0 1.5]*max(zetahat(modeid,:)))
title(['mean($\hat{\zeta}_n)$ = ',num2str(mean(zetahat(modeid,:)),2)],'interpreter','latex','fontsize',fontsize)
for kk=1:ops.N;vline(kk*ops.ll,'k--');end

subplot(4,1,4);hold on;grid;
xlabel('Time $(s)$','interpreter','latex','fontsize',fontsize);
ylabel('$\omega_n(t)$','interpreter','latex','fontsize',fontsize);
if ops.Dymola
    plot(t,sys.wn(mode)/2/pi*ones(1,length(wnhat(modeid,:))),'b','linewidth',2);hold on;
end
plot(t(:),wnhat(modeid,:),'r--','linewidth',2);
ylim([0 1.5]*max(wnhat(modeid,:)))
title(['mean($\hat{\omega}_n)$ = ',num2str(mean(wnhat(modeid,:)),2),' (Hz)'],'interpreter','latex','fontsize',fontsize)
for kk=1:ops.N;vline(kk*ops.ll,'k--');end

figure(2);clf
for kk=1:ops.N
    subplot(ops.N,2,[2*(kk-1)+1 2*kk])
    opts              = bodeoptions('cstprefs');
    opts.PhaseVisible = 'off';
    opts.grid         = 'on';
    opts.FreqUnits    = 'Hz';
    handle            = bodeplot(syshat{kk*ll*Nb}.sys,opts,opts,'r');hold on
    if ops.Dymola
        bodeplot(sys.Gid,opts);showConfidence(handle)
    end
    obj      = findobj(gcf,'type','axes');
    ax       = obj(2);
    ax_ylim  = ax.YLim;
    plot(ax,[w(1) w(1)],[ax_ylim(1) ax_ylim(2)],'k--','linewidth',1.5)
    plot(ax,[w(end) w(end)],[ax_ylim(1) ax_ylim(2)],'k--','linewidth',1.5)
    plot(ax,[wi(kk,1) wi(kk,1)],[ax_ylim(1) ax_ylim(2)],'r:','linewidth',1.5)
    plot(ax,[wi(kk,end) wi(kk,end)],[ax_ylim(1) ax_ylim(2)],'r:','linewidth',1.5)
    xlim([min(wi(kk,:)) max(wi(kk,:))])
    xlabel('$\omega$','interpreter','latex');
    ylabel('Magnitude','interpreter','latex');
    title(['Batch ' num2str(kk)],'interpreter','latex','fontsize',fontsize)
end
sgtitle({'Bodemagnitude of the identified model (red)';' '},'interpreter','latex','fontsize',fontsize)

figure(3);clf
for kk=1:ops.N
    
    Zetahat = [zetahat_i(1:2:2*syshat{kk*ops.ll*ops.Nb}.ni,kk);zetahat_i(2*syshat{kk*ops.ll*ops.Nb}.ni+1:end,kk)];
    
    subplot(ops.N,2,2*(kk-1)+1)
    stairs(Zetahat,'ro','linewidth',2);grid;
    ylabel('$\zeta$','interpreter','latex','fontsize',fontsize);
    xlabel('\# of damping coefficient','interpreter','latex','fontsize',fontsize);
    title(['Batch ' num2str(kk)],'interpreter','latex','fontsize',fontsize)
    set(gca,'xtick',0:length(Zetahat))
    set(gca,'xlim',[0,length(Zetahat)+1])
    set(gca,'ylim',[0,1.1])
    
    Wnhat = [wnhat_i(1:2:2*syshat{kk*ops.ll*ops.Nb}.ni,kk);wnhat_i(2*syshat{kk*ops.ll*ops.Nb}.ni+1:end,kk)];
    
    subplot(ops.N,2,2*kk)
    stairs(Wnhat,'ro','linewidth',2);grid;
    ylabel('$\omega$ (Hz)','interpreter','latex','fontsize',fontsize);
    xlabel('\# of natural frequencies','interpreter','latex','fontsize',fontsize);
    title(['Batch ' num2str(kk)],'interpreter','latex','fontsize',fontsize)
    set(gca,'xtick',0:length(Wnhat))
    set(gca,'xlim',[0,length(Wnhat)+1])
    set(gca,'ylim',[0,max(Wnhat)*1.1])
end
sgtitle('estimated (red)','interpreter','latex','fontsize',fontsize)


% figure(4);clf
% for kk=1:ops.N
%     subplot(ops.N,2,2*(kk-1)+1)
%     plot(wi,syshat{kk*ops.ll*ops.Nb}.Ai,'bo','linewidth',3);grid;hold on;
%     plot(w,syshat{kk*ops.ll*ops.Nb}.Aopt,'ro','linewidth',2);
%     if kk==ops.N
%         xlabel('$\omega$ (Hz)','interpreter','latex','fontsize',fontsize);
%     end
%     ylabel('$A_i$','interpreter','latex','fontsize',fontsize);
%     if kk==1
%         title({'spectra of the excitation signal';' ';['Batch ' num2str(kk)]},'interpreter','latex','fontsize',fontsize)
%     else
%         title(['Batch ' num2str(kk)],'interpreter','latex','fontsize',fontsize)
%     end
%     ylim([0 1.1*max(max(syshat{kk*ops.ll*ops.Nb}.Ai),max(syshat{kk*ops.ll*ops.Nb}.Aopt))])
%
%     subplot(ops.N,2,2*kk)
%     plot(diag(syshat{kk*ops.ll*ops.Nb}.P(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar)),'bo','linewidth',3);grid
%     set(gca,'xtick',0:length(syshat{kk*ops.ll*ops.Nb}.CritPar))
%     set(gca,'xlim',[0,length(syshat{kk*ops.ll*ops.Nb}.CritPar)+1])
%     set(gca,'ylim',[0,1.2*max(max(diag(syshat{kk*ops.ll*ops.Nb}.P(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar)),...
%         diag(syshat{kk*ops.ll*ops.Nb}.P(syshat{kk*ops.ll*ops.Nb}.CritPar,syshat{kk*ops.ll*ops.Nb}.CritPar))))])
%     if kk==ops.N
%         xlabel('\# of damping coefficient','interpreter','latex','fontsize',fontsize);
%     end
%     ylabel('var($\zeta$)','interpreter','latex','fontsize',fontsize);
%     if kk==1
%         title({'variance of the damping coeffcient';' ';['Batch ' num2str(kk)]},'interpreter','latex','fontsize',fontsize)
%     else
%         title(['Batch ' num2str(kk)],'interpreter','latex','fontsize',fontsize)
%     end
% end


% figure(5);clf
% for kk=1:ops.N
%     subplot(ops.N,2,2*(kk-1)+1)
%     plot(SysIdResults{kk*ll*Nb}.tau,SysIdResults{kk*ll*Nb}.R(:,1,1));hold on;
%     hline(SysIdResults{kk*ll*Nb}.lconf);hline(SysIdResults{kk*ll*Nb}.uconf);grid
%     title(['Batch ' num2str(kk)],'interpreter','latex','fontsize',fontsize)
%     ylabel('$R_\epsilon$','interpreter','latex','fontsize',fontsize);
%     if kk==ops.N
%         xlabel('$\tau$','interpreter','latex','fontsize',fontsize);
%     end
%     xlim([0 max(SysIdResults{kk*ll*Nb}.tau)])
%
%     subplot(2,2,2*kk)
%     plot(SysIdResults{kk*ll*Nb}.tau,SysIdResults{kk*ll*Nb}.R(:,1,2));hold on;
%     hline(SysIdResults{kk*ll*Nb}.lconf);hline(SysIdResults{kk*ll*Nb}.uconf);grid;
%     title(['Batch ' num2str(kk)],'interpreter','latex','fontsize',fontsize)
%     ylabel('$R_{\epsilon,u}$','interpreter','latex','fontsize',fontsize);
%     if kk==ops.N
%         xlabel('$\tau$','interpreter','latex','fontsize',fontsize);
%     end
%     xlim([0 max(SysIdResults{kk*ll*Nb}.tau)])
% end


