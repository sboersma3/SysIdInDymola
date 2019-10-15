function syshat = get_previous_spectrum_input(syshat,signals,ops,kk)

%Ai   = signals.Ai(kk*ops.Nb,:);
%wi   = signals.wi(kk*ops.Nb,:);

% ind  = [];
% for kk=1:length(wi)
%     [~,temp] = min(abs(wi(kk)-ops.w));   
%     ind      = [ind; temp]; 
% end
% 
% Ai_         = zeros(1,length(ops.w));
% Ai_(ind)    = Ai;
% syshat.Ai_  = Ai_';

syshat.Ai_ = signals.Ai(kk*ops.Nb,:)';
syshat.wi_ = signals.wi(kk*ops.Nb,:)';

% should approximately be the same
%ops.w(ind)
%wn

% figure(100);clf
% semilogx(ops.w,Ai_,'ro','linewidth',3);grid
% xlabel('$\omega$ (rad/s)','interpreter','latex');
% ylabel('$A_i$','interpreter','latex');