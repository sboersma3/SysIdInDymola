
function [Fo,vecFm,alpha]=calculFmarx(Fu,Fe,M)

[a,b,c,d]=ssdata(Fu);
Q=b*b';
X=dlyap(a,Q);


Fo=c*X*c';



vecFm=[];


for jj=1:M,
   
   Fmpos=c*(a^jj)*X*c';
   Fmneg=Fmpos';
   Fm=Fmpos+Fmneg;
   vecFm=[vecFm,Fm];
end;


[a,b,c,d]=ssdata(Fe);
Q=b*b';
X=dlyap(a,Q);


alpha=c*X*c';

