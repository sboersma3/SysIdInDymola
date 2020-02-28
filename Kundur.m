

%% SingleMachineInfiniteBus
clear;clc

ops.directory  = 'results\Kundur\';

% y      = [dphi]^T and u = [Pref2 Qref2 eP1 eQ1]^T
% data_2 = [t, Qref, n, dphi domega P12]
ops.Ny         = 3;                     % choice of your output for identification (taken from data_2)
ops.mode       = 'min';                 % mode of the true system you plot 
ops.modeid     = 'min';                 % mode of the estimated system you plot ('min' if you want to plot the minimum)
ops.na         = 2;                     % #of states of estimated model
ops.nb         = ops.na+1;                % #of parameters in numerator G
ops.nc         = ops.na-1;                % #of parameters in numerator H
ops.nk         = 0;                     % #of delays in G
ops.nu         = 2;                     % choice of your input channel from Dymola linearization (taken from u)
ops.ne         = 4;                     % choice of your noise channel channel from Dymola linearization (taken from u) 
ops.ny         = ops.Ny-2;              % choice of your output channel from Dymola linearization (taken from y) !make sure this output is equivalent to signals taken from data_2! 
 
ops.h_new      = 0.04;                   % new sampling period after resampling (0 -> no resampling)

ops.w          = linspace(.1*2*pi,3*2*pi,20);       % frequency grid

ops.c1         = 1.0;                               % weighting factor for input (power or variance)
ops.c2         = (1-ops.c1);                        % weighting factor for output (power)


run('bin/MAIN')


% store optimal excitation signal derived from first batch
OptimalInput = [ops.w' syshat{1*ops.ll*ops.Nb}.Aopt];
if 0
    save(strcat(ops.directory,'OptimalInput.mat'),'OptimalInput');
end

















% % statistical fusion (under construction)
% P      = 0;
% for kk=1:floor(ops.N/ops.Nb)
%     P      = P + (inv(syshat{kk*ops.ll*ops.Nb}.P));
% end
% P = inv(P);
% 
% theta0 = 0;
% for kk=1:floor(ops.N/ops.Nb)
%     theta0 = theta0 + (inv(syshat{kk*ops.ll*ops.Nb}.P)) * syshat{kk*ops.ll*ops.Nb}.theta0;
% end
% theta0 = P*theta0;
% disp(' ')
% disp(['Fused covariance : ', num2str(diag(P(syshat{1*ops.ll*ops.Nb}.CritPar,syshat{1*ops.ll*ops.Nb}.CritPar)),'%10.2e')])
% disp(' ')
% disp(['Fused parameter : ', num2str(theta0(syshat{1*ops.ll*ops.Nb}.CritPar),'%10.3f')])




% % controllability analysis (under construction)
% [U,S,V]         = svd(sys{ll}.Wc);
% U_              = zeros(size(U));
% for kk=1:size(U,1)
%  
%     for mm=1:kk
%     U_(:,kk) = U_(:,kk) + S(mm,mm)/S(1,1) * U(:,mm);
%     end
% end

