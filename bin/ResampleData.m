function [signals,ops] = ResampleData(signals,ops)
% resample the data

rs        = ops.h_new/ops.h; % resample to rs*ops.h

temp      = resample(iddata([],signals.y',ops.h),1,rs);
yrs       = [temp.u;temp.u(end)];
temp      = resample(iddata([],signals.u',ops.h),1,rs);
urs       = [temp.u;temp.u(end)];
temp      = resample(iddata([],signals.e',ops.h),1,rs);
ers       = [temp.u;temp.u(end)];

trs       = [0;temp.sa];


% figure(1);clf;
% subplot(2,1,1)
% plot(signals.t,signals.y,'b');
% hold on;
% plot(trs,yrs,'r--');grid;
% subplot(2,1,2)
% plot(signals.t,signals.u,'b');
% hold on;
% plot(trs,urs,'r--');grid;

signals.t = trs';
signals.y = yrs';
signals.u = urs';
signals.e = ers';

% update sample period and number of data points used for sysid
ops.h     = ops.h_new;
ops.Nid   = ops.Nb*ops.ll/ops.h;                
