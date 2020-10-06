
function [powermatrix]=vectorpower(Fe,sigma2)

[a,b,c,d]=ssdata(Fe);
Q=b*b';
X=dlyap(a,Q);


pFnorm=c*X*c'+d*d';



powermatrix=sigma2*pFnorm;



