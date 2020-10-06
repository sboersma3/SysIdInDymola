
function [Fo,vecFm]=calculFsid(Sid,M)

[a,b,c,d]=ssdata(Sid);
Q=b*b';
X=dlyap(a,Q);


Fo=c*X*c'+d*d';



vecFm=[];


for jj=1:M,
   
   Fmpos=c*(a^jj)*X*c'+c*(a^(jj-1))*b*d';
   Fmneg=Fmpos';
   Fm=Fmpos+Fmneg;
   vecFm=[vecFm,Fm];
end;

