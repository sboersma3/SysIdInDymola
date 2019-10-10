function syshat = get_Fu_and_Fe( syshat )
% Evaluates symbolic Ghat and Hhat and its derivatives wrt parameter vector
% and then define Fu and Fe

syms z

h            = syshat.h;
na           = syshat.na;
nb           = syshat.nb;
nc           = syshat.nc;
numG         = syshat.numG;
numH         = syshat.numH;

pr           = syshat.p(imag(syshat.p)==0);
zetahatr     = syshat.zeta(1:length(pr));
wnhatr       = syshat.wn(1:length(pr)).*zetahatr;
pi           = syshat.p(imag(syshat.p)~=0);
zetahati     = syshat.zeta(length(pr)+1:length(pr)+length(pi));
wnhati       = syshat.wn(length(pr)+1:length(pr)+length(pi));

nr           = size(pr,1);
ni           = size(pi,1)/2;

% true parameter vector
theta0       = [];
for kk=1:nr
    theta0   = [theta0;wnhatr(kk)]; 
end
for kk=1:ni
    theta0   = [theta0;wnhati(2*kk-1)];
    theta0   = [theta0;zetahati(2*kk-1)]; 
end
temp         = nonzeros(numH);
theta0       = [theta0;nonzeros(numG);temp(2:end)];

% symbolic parameter vector
thetasym       = [];
for kk=1:nr
    thetasym   = [thetasym sym(strcat('w',num2str(kk)))]; 
end

for kk=nr+1:nr+ni
    thetasym   = [thetasym sym(strcat('w',num2str(kk)))]; 
    thetasym   = [thetasym sym(strcat('zeta',num2str(kk)))];   
end

for kk=2*ni+nr+1:2*ni+nr+nb
    thetasym   = [thetasym sym(strcat('theta',num2str(kk)))];   
end

for kk=2*ni+nr+nb+1:2*ni+nr+nb+nc
    thetasym   = [thetasym sym(strcat('theta',num2str(kk)))];   
end

% symbolic characteristic polynomial
p     = 1;
for kk=1:nr    
    p = p*(z-sign(pr(kk))*exp(-thetasym(kk)*h));     
end

for kk=1:ni   
    p = p*(z^2+...
        -2*exp(-thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h)*cos(thetasym(nr+(2*kk-1))*sqrt(1-thetasym(nr+2*kk)^2)*h)*z + ...
        exp(-2*thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h));     
end

% derivative symbolic characteristic polynomial
dp    = []; 
for kk=1:nr    
    dp = [dp;h*sign(pr(kk))*exp(-thetasym(kk)*h)];     
end

for kk=1:ni   
    dp = [dp;
        2*h*z*exp(-h*thetasym(nr+(2*kk-1))*thetasym(nr+2*kk))*sin(h*thetasym(nr+(2*kk-1))*(1 - thetasym(nr+2*kk)^2)^(1/2))*(1 - thetasym(nr+2*kk)^2)^(1/2) - ...
        2*h*thetasym(nr+2*kk)*exp(-2*h*thetasym(nr+(2*kk-1))*thetasym(nr+2*kk)) + ...
        2*h*z*thetasym(nr+2*kk)*exp(-h*thetasym(nr+(2*kk-1))*thetasym(nr+2*kk))*cos(h*thetasym(nr+(2*kk-1))*(1 - thetasym(nr+2*kk)^2)^(1/2))];

    dp = [dp;
        2*h*thetasym(nr+(2*kk-1))*z*exp(-h*thetasym(nr+(2*kk-1))*thetasym(nr+2*kk))*cos(h*thetasym(nr+(2*kk-1))*(1 - thetasym(nr+2*kk)^2)^(1/2)) - ...
        2*h*thetasym(nr+(2*kk-1))*exp(-2*h*thetasym(nr+(2*kk-1))*thetasym(nr+2*kk)) - ...
        (2*h*thetasym(nr+(2*kk-1))*z*thetasym(nr+2*kk)*exp(-h*thetasym(nr+(2*kk-1))*thetasym(nr+2*kk))* ...
        sin(h*thetasym(nr+(2*kk-1))*(1 - thetasym(nr+2*kk)^2)^(1/2)))/(1 - thetasym(nr+2*kk)^2)^(1/2)];
end

% division by part characteristic polynomial
for kk=1:nr    
    dp(kk) = dp(kk)*p/(z-sign(pr(kk))*exp(-thetasym(kk)*h));
end
for kk=1:+ni    
    dp(nr+2*kk)     = dp(nr+2*kk)*p/(z^2+...
        -2*exp(-thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h)*cos(thetasym(nr+(2*kk-1))*sqrt(1-thetasym(nr+2*kk)^2)*h)*z + ...
        exp(-2*thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h));
    dp(nr+(2*kk-1)) = dp(nr+(2*kk-1))*p/(z^2+...
        -2*exp(-thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h)*cos(thetasym(nr+(2*kk-1))*sqrt(1-thetasym(nr+2*kk)^2)*h)*z + ...
        exp(-2*thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h));    
end

% vector with monomials
if nb>na
    mG = [];
    for kk=0:na
        mG = [z^kk mG];
    end
    B1  = sym(zeros(na+1,1));
else
    mG = [];
    for kk=0:na-1
        mG = [z^kk mG];
    end
    B1  = sym(zeros(na,1));
end

if nb>na
    B1(1:end,1)        = thetasym(nr+2*ni+1:nr+2*ni+nb);
    dB1                = sym(zeros(na+nb,na+1));
else
    B1(na-nb+1:end,1)  = thetasym(nr+2*ni+1:nr+2*ni+nb);
    dB1                = sym(zeros(na+nb,na));
end
dB1(1:na,:)        = repmat(B1.',na,1);

if nb>na
    for kk=na+1:na+nb
        dB1(kk,kk-nb+1) = 1;
    end
else
    for kk=na+1:na+nb
        dB1(kk,kk-nb) = 1;
    end
end

dGzsym = [];
for kk=1:nr+2*ni
    temp = -p^(-2)*dp(kk)*mG*B1; 
    dGzsym   = [dGzsym;temp];
end
for kk=nr+2*ni+1:nr+2*ni+nb
    temp = p^(-1)*mG*dB1(kk,:).'; 
    dGzsym   = [dGzsym;temp];
end
for kk=nr+2*ni+nb+1:nr+2*ni+nb+nc
    dGzsym   = [dGzsym;0];
end

% dH/dtheta
% vector with monomials
mH = [];
for kk=0:na
    mH = [z^kk mH]; 
end

B2                 = sym(zeros(na+1,1));
B2(na-nc+1,1)      = sym(1);
B2(na-nc+2:end,1)  = thetasym(nr+2*ni+nb+1:nr+2*ni+nb+nc);
dB2                = sym(zeros(na+nc,na+1));
dB2(1:na,:)        = repmat(B2.',na,1); 

for kk=na+1:na+nc
   dB2(kk,kk+1-nc) = 1;
end

dHzsym = [];
for kk=1:nr+2*ni
    temp = -p^(-2)*dp(kk)*mH*B2; 
    dHzsym   = [dHzsym;temp];
end
for kk=nr+2*ni+1:nr+2*ni+nb
    dHzsym   = [dHzsym;0];
end
for kk=nr+2*ni+1:nr+2*ni+nc
    temp = p^(-1)*mH*dB2(kk,:).'; 
    dHzsym   = [dHzsym;temp];
end

% symbolic H
numHs  = z^nc+thetasym(na+nb+1:na+nb+nc)*mG(end-length(thetasym(na+nb+1:na+nb+nc))+1:end).'; 
Hzsym  = numHs/p; 

% sumbolic G
numGs  = thetasym(na+1:na+nb)*mG(end-length(thetasym(na+1:na+nb))+1:end).'; 
Gzsym  = numGs/p; 


%sym2tf(subs(dGzsym,thetasym, theta0'),h)
%sym2tf(subs(jacobian(Gzsym,thetasym),thetasym, theta0'),h)
%sym2tf(subs(dHzsym,thetasym, theta0'),h)
%sym2tf(subs(jacobian(Hzsym,thetasym),thetasym, theta0'),h)

%%

Fuzsym            = dGzsym/Hzsym;                                
Fezsym            = dHzsym/Hzsym;

dGz               = sym2tf(subs(dGzsym,thetasym, theta0'),h);
dHz               = sym2tf(subs(dHzsym,thetasym, theta0'),h);
Fuz               = sym2tf(subs(Fuzsym,thetasym, theta0'),h);                                                
Fez               = sym2tf(subs(Fezsym,thetasym, theta0'),h);                                                

syshat.theta0     = theta0;
syshat.thetasym   = thetasym;
syshat.dGz        = dGz;
syshat.dHz        = dHz;
syshat.Fuz        = Fuz;
syshat.Fez        = Fez;


end