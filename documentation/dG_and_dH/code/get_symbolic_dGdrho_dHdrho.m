%% Symbolic in terms of rho that contains the damping coefficients
clear;clc;

h    = .01;
t    = (0:h:100)';
z    = tf('z',h);

wn   = .7;
zeta = .1;
sys0 = ss(c2d(tf([1 .1*2*wn*zeta wn^2],[1 2*wn*zeta wn^2]),h));
H0   = ss(c2d(tf([1 .5*2*wn*zeta wn^2],[1 2*wn*zeta wn^2]),h));

u    = sin(wn*t);
y    = lsim(sys0,u,t) + lsim(H0,100*randn(1,length(t)),t);

na   = 5; % =nr+2*ni
nb   = 6;
nc   = 5;
nk   = 0;
 

sys                    = armax(iddata(y,u,h),[na nb nc nk]); 
[den,numG,numH,~,~]    = polydata(sys); % D is not zero here due to direct feedthrough noise in output
 
Gz                     = tf(numG,den,h);
Hz                     = tf(numH,den,h);

% construct analytical transfer
[~,D]    = eig(ss(sys).A,'vector');
D        = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
nx       = size(D,1);
phat     = D;    
D        = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
zetahat  = -real(log(D))./abs(log(D));          % damping ratios
wnhat    = abs(log(D)/h);                       % natural frequency

pr       = phat(imag(phat)==0);
zetahatr = zetahat(1:length(pr));
wnhatr   = wnhat(1:length(pr)).*zetahatr;
pi       = phat(imag(phat)~=0);
zetahati = zetahat(length(pr)+1:length(pr)+length(pi));
wnhati   = wnhat(length(pr)+1:length(pr)+length(pi));

nr       = size(pr,1);
ni       = size(pi,1)/2;
den1     = 1;
for kk=1:nr    
    den1 = den1*(z-sign(pr(kk))*exp(-wnhatr(kk)*h));     
end

for kk=1:ni   
    den1 = den1*(z^2+...
        -2*exp(-zetahati(2*kk-1)*wnhati(2*kk-1)*h)*cos(wnhati(2*kk-1)*sqrt(1-zetahati(2*kk-1)^2)*h)*z + ...
        exp(-2*zetahati(2*kk-1)*wnhati(2*kk-1)*h));     
end

Gz1 = tf(numG,tfdata(den1,'v'),h);     
Hz1 = tf(numH,tfdata(den1,'v'),h);

pole(Gz)-pole(Gz1)
dcgain(Gz)-dcgain(Gz1)

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

% From here we define symbolic transfers
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

syms z
p     = 1;
for kk=1:nr    
    p = p*(z-sign(pr(kk))*exp(-thetasym(kk)*h));     
end

for kk=1:ni   
    p = p*(z^2+...
        -2*exp(-thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h)*cos(thetasym(nr+(2*kk-1))*sqrt(1-thetasym(nr+2*kk)^2)*h)*z + ...
        exp(-2*thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h));     
end

% check if p and den1 are equivalent
%sym2tf(subs(p,thetasym, theta0'),h)
%den1

dp     = []; 
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

% check if dp1 and dp are equivalent
%dp1 = jacobian(p,thetasym(1:nr+2*ni));

for kk=1:nr    
    dp(kk) = dp(kk)*p/(z-sign(pr(kk))*exp(-thetasym(kk)*h));
end
for kk=1:ni    
    dp(nr+2*kk)    = dp(nr+2*kk)*p/(z^2+...
        -2*exp(-thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h)*cos(thetasym(nr+(2*kk-1))*sqrt(1-thetasym(nr+2*kk)^2)*h)*z + ...
        exp(-2*thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h));
    dp(nr+(2*kk-1)) = dp(nr+(2*kk-1))*p/(z^2+...
        -2*exp(-thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h)*cos(thetasym(nr+(2*kk-1))*sqrt(1-thetasym(nr+2*kk)^2)*h)*z + ...
        exp(-2*thetasym(nr+2*kk)*thetasym(nr+(2*kk-1))*h));    
end



% check if dp and jacobian are equivalent
sym2tf(subs(jacobian(p,thetasym(1:nr+2*ni)),thetasym(1:nr+2*ni), theta0(1:nr+2*ni)'),h);
sym2tf(subs(dp,thetasym, theta0'),h);

% dG/dtheta
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

dG = [];
for kk=1:nr+2*ni
    temp = -p^(-2)*dp(kk)*mG*B1; 
    dG   = [dG;temp];
end
for kk=nr+2*ni+1:nr+2*ni+nb
    temp = p^(-1)*mG*dB1(kk,:).'; 
    dG   = [dG;temp];
end
for kk=nr+2*ni+nb+1:nr+2*ni+nb+nc
    dG   = [dG;0];
end

% check
numGs = thetasym(na+1:na+nb)*mG(end-length(thetasym(na+1:na+nb))+1:end).'; 
Gsym  = numGs/p; 

%check if Gsym and G are equivalent
%sym2tf(subs(Gsym,thetasym, theta0'),h)
%Gz


DG    = jacobian(Gsym,thetasym);

% dG and DG should be the same
%dG; pretty(DG);

dGz = sym2tf(subs(dG,thetasym, theta0'),h);
DGz = sym2tf(subs(DG,thetasym, theta0'),h);

for kk=1:size(dGz,1)
norm(dGz(kk,1)-DGz(1,kk)) % should all be zero
dcgain(dGz(kk,1))-dcgain(DGz(1,kk))
end

% dH/dtheta
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

dH = [];
for kk=1:nr+2*ni
    temp = -p^(-2)*dp(kk)*mH*B2; 
    dH   = [dH;temp];
end
for kk=nr+2*ni+1:nr+2*ni+nb
    dH   = [dH;0];
end
for kk=nr+2*ni+1:nr+2*ni+nc
    temp = p^(-1)*mH*dB2(kk,:).'; 
    dH   = [dH;temp];
end

% check
numHs = z^nc+thetasym(na+nb+1:na+nb+nc)*mG(end-length(thetasym(na+nb+1:na+nb+nc))+1:end).'; 
Hsym  = numHs/p; 

%check if Hsym and H are equivalent
sym2tf(subs(Hsym,thetasym, theta0'),h);
Hz;


DH    = jacobian(Hsym,thetasym);

% dH and DH should be the same
%dH; pretty(DH);

dHz = sym2tf(subs(dH,thetasym, theta0'),h);
DHz = sym2tf(subs(DH,thetasym, theta0'),h);

for kk=1:size(dHz,1)
norm(dHz(kk,1)-DHz(1,kk)) % should all be zero
end




%% Symbolic zpk transfer as Vedran does it
clear;clc;

z         = tf('z');
dt        = 1;

Gn        = 0.08223 / ( (z^2-1.863*z+0.9478)*(z-.5) );
Hn        = (z+0.3921) / ( (z^2-1.863*z+0.9478)*(z-.5) );


[zG,p,kG] = zpkdata(Gn,'v');
[zH,p,kH] = zpkdata(Hn,'v');


zrG       = zG(imag(zG)==0);
ziG       = zG(imag(zG)>0);
zrH       = zH(imag(zH)==0);
ziH       = zH(imag(zH)>0);
pr        = p(imag(p)==0);
pi        = p(imag(p)>0);

siG       =(2/dt)*(ziG-1)./(ziG+1);
sp        =(2/dt)*(pi -1)./(pi +1);
siH       =(2/dt)*(ziH-1)./(ziH+1);

[wzG,zetzG] = damp(siG);
[wp,zetp]   = damp(sp);
[wzH,zetzH] = damp(siH);

numrealzG   = numel(zrG);
numrealp    = numel(pr);
numimagzG   = numel(ziG);
numimagp    = numel(pi);

numrealzH   = numel(zrH);
numimagzH   = numel(ziH);

thetasym      = [zrG'   pr'  reshape([wzG  zetzG]',1,2*numimagzG) ...
                reshape([wp zetp]',1,2*numimagp) zrH' reshape([wzH zetzH]', ...
                1,2*numimagzH), kG];
% reshape to make order "w zeta w zeta" etc.

G     = sym('1');
theta = str2sym('');
for i=1:numrealzG
[G,theta] = add_realz(theta, G, i);
end

for i=1:numrealp
[G,theta] = add_realp(theta, G, i);
end

for i=1:numimagzG
[G,theta] = add_imagz(theta, G, i, dt);
end

for i=1:numimagp
[G,theta] = add_imagp(theta, G, i, dt);
end

%%%%%
H = sym('1');
for i=1:numrealzH
    j = i+numrealzG;
    [H,theta] = add_realz(theta, H, j);
end

for i=1:numrealp
    [H,theta] = add_realp(theta, H, i,'Dont add Theta');
end

for i=1:numimagzH
    j = i+numimagzG;
    [H,theta] = add_imagz(theta, H, j, dt);
end

for i=1:numimagp
    [H,theta] = add_imagp(theta, H, i, dt,'Dont add Theta');
end

H     = kH*H;
kGs   = sym('kGs');
G     = kGs*G;
theta = [theta kGs];

syssym.Gs           = G;
syssym.Hs           = H;
syssym.theta        = theta;
syssym.theta0       = thetasym;
syssym.numrealzG    = numrealzG;
syssym.numrealp     = numrealp;
syssym.numimagzG    = numimagzG;
syssym.numimagp     = numimagp; 
syssym.numrealzH    = numrealzH;
syssym.numimagzH    = numimagzH;



Gsym = sym2tf(vpa(subs(G,theta, thetasym)),1);
Hsym = sym2tf(vpa(subs(H,theta, thetasym)),1);

Gn
Gsym
Hn
Hsym




%% Symbolic state space from armax (parameters in the C matrix)
clear;clc;

h    = 1;
t    = (0:h:100)';

wn   = .5;
zeta = .1;
sys0 = ss(c2d(tf(wn^2,[1 2*wn*zeta wn^2]),h));

u    = sin(wn*t);
y    = lsim(sys0,u,t);

na   = 3;
nb   = 2;
nc   = 2;
nk   = 1;

sys                    = armax(iddata(y,u,h),[na nb nc nk]);  
[den,numG,numH,~,~]    = polydata(sys); % D is not zero here due to direct feedthrough noise in output

Gz             = tf(numG,den,h);
Hz             = tf(numH,den,h);

% From here we define symbolic transfers
thetasym       = [];
for kk=1:na
    thetasym   = [thetasym sym(strcat('a1',num2str(kk)))];    
end
for kk=na-nb+1:na
    thetasym   = [thetasym sym(strcat('gc1',num2str(kk)))];    
end
for kk=na-nc+1:na
    thetasym   = [thetasym sym(strcat('hc1',num2str(kk)))];    
end

Asym                  = sym(diag(ones(na-1,1),-1));
Asym(1,:)             = -thetasym(1:na);
Bsym                  = sym([1;zeros(na-1,1)]);
GCsym                 = sym(zeros(1,na));
GCsym(1,na-nb+1:end)  = thetasym(na+1:na+nb);
HCsym                 = sym(zeros(1,na));
HCsym(1,na-nc)        = sym(1);           
HCsym(1,na-nc+1:end)  = thetasym(na+nb+1:na+nb+nc);

theta0                = [den(2:end) nonzeros(numG)' nonzeros(numH(2:end))'];
A0                    = double(subs(Asym,thetasym(1:na), theta0(1:na)));
B0                    = [1;zeros(na-1,1)]; 
GC0                   = double(subs(GCsym,thetasym(na+1:na+nb), theta0(na+1:na+nb)));
HC0                   = double(subs(HCsym,thetasym(na+nb+1:na+nb+nc), theta0(na+nb+1:na+nb+nc)));
G0                    = ss(A0,B0,GC0,0,h);
H0                    = ss(A0,B0,HC0,0,h);

z                     = sym('z');
Gamma                 = (z*eye(na)-Asym)\Bsym;
Gzsym                 = simplify(GCsym*Gamma);
Hzsym                 = simplify(HCsym*Gamma);


figure(1);clf
subplot(2,1,1)
step(G0);hold on
step(Gz,'r--');
subplot(2,1,2)
step(H0);hold on
step(Hz,'r--');

% derivative G wrt theta
v2 = [];
for kk=0:na-1
    v2 = [z^kk;v2]; 
end
p1 = (poly2sym([1 thetasym(1:na)],z))^(-1);
p2 = -p1^(2);

v1          = sym(zeros(na+nb,na));
v1(1:na,:)  = repmat(GCsym,na,1); 

for kk=na+1:na+nb
   v1(kk,kk-nb) = 1;
end

dG = [];
for kk=1:na
    temp = simplify(v1(kk,:)*p2*v2(kk)*v2); 
    dG   = [dG;temp];
end
for kk=na+1:na+nb
    temp = simplify(v1(kk,:)*p1*v2); 
    dG   = [dG;temp];
end
for kk=na+nb+1:na+nb+nc
    dG   = [dG;0];
end

% check
DG = simplify(jacobian(Gzsym,thetasym));

% dG and DG should be the same
dG; pretty(DG);

% derivative H wrt theta
v1          = sym(zeros(na+nc,na));
v1(1:na,:)  = repmat(HCsym,na,1); 

for kk=na+1:na+nc
    v1(kk,kk-nc) = 1;
end

dH = [];
for kk=1:na
    temp = simplify(v1(kk,:)*p2*v2(kk)*v2);
    dH   = [dH;temp];
end
for kk=na+1:na+nb
    dH   = [dH;0];
end
for kk=na+1:na+nc
    temp = simplify(v1(kk,:)*p1*v2);
    dH   = [dH;temp];
end

% check
DH = simplify(jacobian(Hzsym,thetasym));

% dH and DH should be the same
dH; pretty(DH);

dGz = sym2tf(subs(dG,thetasym, theta0),h)
DGz = sym2tf(subs(DG,thetasym, theta0),h)

dHz = sym2tf(subs(dH,thetasym, theta0),h)
DHz = sym2tf(subs(DH,thetasym, theta0),h)


%% Symbolic state space from armax (parameters in the B matrix)
clear;clc;

h    = 1;
t    = (0:h:100)';

wn   = .5;
zeta = .1;
sys0 = ss(c2d(tf(wn^2,[1 2*wn*zeta wn^2]),h));

u    = sin(wn*t);
y    = lsim(sys0,u,t);

na   = 3;
nb   = 2;
nc   = 2;
nk   = 1;

sys                    = armax(iddata(y,u,h),[na nb nc nk]);  
[den,numG,numH,~,~]    = polydata(sys); % D is not zero here due to direct feedthrough noise in output

Gz             = tf(numG,den,h);
Hz             = tf(numH,den,h);

% From here we define symbolic transfers
thetasym       = [];
for kk=1:na
    thetasym   = [thetasym sym(strcat('a1',num2str(kk)))];    
end
for kk=na-nb+1:na
    thetasym   = [thetasym sym(strcat('gc1',num2str(kk)))];    
end
for kk=na-nc+1:na
    thetasym   = [thetasym sym(strcat('hc1',num2str(kk)))];    
end

Asym                  = sym(diag(ones(na-1,1),-1));
Asym(1,:)             = -thetasym(1:na);
Asym                  = transpose(Asym);
Csym                  = sym([1 zeros(1,na-1)]);
GBsym                 = sym(zeros(na,1));
GBsym(na-nb+1:end,1)  = thetasym(na+1:na+nb);
HBsym                 = sym(zeros(na,1));
HBsym(na-nc,1)        = sym(1);           
HBsym(na-nc+1:end,1)  = thetasym(na+nb+1:na+nb+nc);

theta0                = [den(2:end) nonzeros(numG)' nonzeros(numH(2:end))'];
A0                    = double(subs(Asym,thetasym(1:na), theta0(1:na)));
GB0                   = double(subs(GBsym,thetasym(na+1:na+nb), theta0(na+1:na+nb))); 
HB0                   = double(subs(HBsym,thetasym(na+nb+1:na+nb+nc), theta0(na+nb+1:na+nb+nc))); 
C0                    = [1 zeros(1,na-1)];
G0                    = ss(A0,GB0,C0,0,h);
H0                    = ss(A0,HB0,C0,0,h);

z                     = sym('z');
Gzsym                 = simplify(Csym/(z*eye(na)-Asym))*GBsym;
Hzsym                 = simplify(Csym/(z*eye(na)-Asym))*HBsym;


figure(1);clf
subplot(2,1,1)
step(G0);hold on
step(Gz,'r--');
subplot(2,1,2)
step(H0);hold on
step(Hz,'r--');

% derivative G wrt theta
v2 = [];
for kk=0:na-1
    v2 = [z^kk;v2]; 
end
p1 = (poly2sym([1 thetasym(1:na)],z))^(-1);
p2 = -p1^(2);

v1          = sym(zeros(na+nb,na));
v1(1:na,:)  = repmat(GBsym',na,1); 

for kk=na+1:na+nb
   v1(kk,kk-nb) = 1;
end

dG = [];
for kk=1:na
    temp = simplify(v1(kk,:)*p2*v2(kk)*v2); 
    dG   = [dG;temp];
end
for kk=na+1:na+nb
    temp = simplify(v1(kk,:)*p1*v2); 
    dG   = [dG;temp];
end
for kk=na+nb+1:na+nb+nc
    dG   = [dG;0];
end

% check
DG = simplify(jacobian(Gzsym,thetasym));

% dG and DG should be the same
dG; pretty(DG);

% derivative H wrt theta
v1          = sym(zeros(na+nc,na));
v1(1:na,:)  = repmat(HBsym',na,1); 

for kk=na+1:na+nc
    v1(kk,kk-nc) = 1;
end

dH = [];
for kk=1:na
    temp = simplify(v1(kk,:)*p2*v2(kk)*v2);
    dH   = [dH;temp];
end
for kk=na+1:na+nb
    dH   = [dH;0];
end
for kk=na+1:na+nc
    temp = simplify(v1(kk,:)*p1*v2);
    dH   = [dH;temp];
end

% check
DH = simplify(jacobian(Hzsym,thetasym));

% dH and DH should be the same
dH; pretty(DH);

dGz = sym2tf(subs(dG,thetasym, theta0),h)
DGz = sym2tf(subs(DG,thetasym, theta0),h)

dHz = sym2tf(subs(dH,thetasym, theta0),h)
DHz = sym2tf(subs(DH,thetasym, theta0),h)



%% Symbolic state space from n4sid

clear;clc;

h   = 1;
t   = (0:h:100)';

wn   = .5;
zeta = .1;
G0   = ss(c2d(tf(wn^2,[1 2*wn*zeta wn^2]),h));
H0   = ss(c2d(tf(wn^2,[1 2*wn*zeta wn^2]),h));

u    = sin(wn*t);
w    = 5*randn(length(t),1);
y    = lsim([G0 H0],[u w],t);

nx        = 4;
[sys,x0]  = n4sid(iddata(y,u,h),nx,'form','canonical');

thetasym       = [];
for kk=1:nx
    thetasym   = [thetasym sym(strcat('a',num2str(kk)))];    
end
for kk=nx+1:2*nx
    thetasym   = [thetasym sym(strcat('b',num2str(kk)))];    
end
for kk=2*nx+1:3*nx
    thetasym   = [thetasym sym(strcat('k',num2str(kk)))];    
end


Asym            = sym(diag(ones(nx-1,1),1));
Asym(end,:)     = thetasym(1:nx);
Bsym            = thetasym(nx+1:2*nx);
Ksym            = thetasym(2*nx+1:3*nx);
Csym            = sym(zeros(1,nx));
Csym(1)         = 1;

z               = sym('z');
Abar            = simplify(inv(z*eye(nx)-Asym));
pretty(Abar(1,:))


