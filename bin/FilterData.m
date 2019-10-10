function signals = FilterData(signals,ops)

h              = ops.h;
order          = 10;
fs             = 1/h;

y              = detrend(signals.y);
u              = detrend(signals.u);

[a1,b1,c1,d1]  = butter(order,[ops.w(end)/2/pi,1e6]/(fs/2),'bandpass');
[a2,b2,c2,d2]  = butter(order,[0,ops.w(1)/2/pi]/(fs/2),'bandpass');

[a,b,c,d]      = ssdata(ss(a1,b1,c1,d1)*ss(a2,b2,c2,d2));

x              = zeros(size(a,1),length(y));
yf             = zeros(1,length(y));
yf(1)          = y(1);
x(:,1)         = c\(yf(1) - d*y(1));

for kk=1:length(y)
   x(:,kk+1) =  a*x(:,kk) + b*y(kk);
   yf(kk)    =  c*x(:,kk) + d*y(kk);
end


x              = zeros(size(a,1),length(u));
uf             = zeros(1,length(u));
uf(1)          = u(1);
x(:,1)         = c\(uf(1) - d*u(1));

for kk=1:length(u)
   x(:,kk+1) =  a*x(:,kk) + b*u(kk);
   uf(kk)    =  c*x(:,kk) + d*u(kk);
end


signals.yf = yf;
signals.uf = uf;



% figure(1);clf;
% plot(signals.y,'b');
% hold on;
% plot(signals.yf,'r--');


