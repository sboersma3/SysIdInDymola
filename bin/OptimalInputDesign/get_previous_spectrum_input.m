function syshat = get_previous_spectrum_input(syshat,ops,kk)

load(strcat(ops.directory,'InputDymola.mat'),'A','B');

Ai   = A(kk*ops.Nb,:);
wn   = B(:,kk*ops.Nb);

ind  = [];
for kk=1:length(wn)
    [~,temp] = min(abs(wn(kk)-ops.w));   
    ind      = [ind; temp]; 
end

Ai_         = zeros(1,length(ops.w));
Ai_(ind)    = Ai;
syshat.Ai_  = Ai_';

% should approximately be the same
%ops.w(ind)
%wn

% figure(100);clf
% semilogx(ops.w,Ai_,'ro','linewidth',3);grid
% xlabel('$\omega$ (rad/s)','interpreter','latex');
% ylabel('$A_i$','interpreter','latex');