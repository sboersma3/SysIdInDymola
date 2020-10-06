
function [alpha]=H2power(Fu)

[a,b,c,d]=ssdata(Fu);
Q=b*b';
X=dlyap(a,Q);


alpha=c*X*c'+d*d';


