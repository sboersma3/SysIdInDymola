
function [dd,a,b,c,d]=delay(k)

f=tf([zeros(1,k),1],[1,zeros(1,k)],1);
[a,b,c,d]=ssdata(f);
dd=ss(f);