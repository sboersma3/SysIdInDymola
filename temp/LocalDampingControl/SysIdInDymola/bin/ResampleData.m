function [signals,ops] = ResampleData(signals,ops)

rs         = ops.h_new/ops.h; % resample to rs*ops.h

temp       = idresamp(iddata([],signals.y',ops.h),rs);
yrs        = [temp.u;temp.u(end)];
temp       = idresamp(iddata([],signals.u',ops.h),rs);
urs        = [temp.u;temp.u(end)];
temp       = idresamp(iddata([],signals.e',ops.h),rs);
ers        = [temp.u;temp.u(end)];

trs        = [0;temp.sa];

signals.to = signals.t;
signals.yo = signals.y;
signals.uo = signals.u;
signals.eo = signals.e;

signals.t = trs';
signals.y = yrs';
signals.u = urs';
signals.e = ers';

% update sample period and number of data points used for sysid
ops.ho    = ops.h;
ops.h     = ops.h_new;

disp(['# of datapoints per batch after resampling: ',num2str(round(length(signals.u)/ops.N))])
disp(' ')