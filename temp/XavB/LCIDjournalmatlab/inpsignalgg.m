
function u=inpsignal(M,vecRu,ndata)

B=[1;zeros(M-1,1)];
A=[zeros(1,M-1),0;eye(M-1),zeros(M-1,1)];
C=vecRu(2:end)';
D=0.5*vecRu(1);



T = DARE(A',C',zeros(M,M),-D-D',-B,eye(M));

Omega=D+D'-C*T*C';
K=-(A*T*C'-B)*inv(Omega);

[numW,denW]=ss2tf(A,K,C,1);

e=sqrt(Omega)*randn(ndata,1);



u=dimpulse(numW,denW,500);
