function U = get_optimal_timeseries_input(u0,h,Nid,w,RBopt)

% optimal time-domain signal
M           = length(RBopt)-1;
B           = [1;zeros(M-1,1)];
A           = [zeros(1,M-1),0;eye(M-1),zeros(M-1,1)];
C           = RBopt(2:end);
D           = 0.5*RBopt(1);
T           = dare(A',C',zeros(M,M),-D-D',-B,eye(M));
Omega       = D+D'-C*T*C';
K           = -(A*T*C'-B)*inv(Omega);

[numW,denW] = ss2tf(A,K,C,1);

vare        = Omega;
W           = tf(numW,denW,1);
        
er          = sqrt(vare)*randn(Nid,1);

U           = filter(W.num{1}, W.den{1}, er);
           
    
    

% t    = (0:5*Nid-1)*h; % here 5 times length is chosen, so that initial condition can be set
% U    = zeros(1,length(t));
% 
% 
% % force the excitation signal to start at correct initial condition (aditionally we could look at the derivative)
% [~,ind] = min(abs(U(1:length(t)-(Nid-1))-u0));
% 
% U        = U(ind:ind+Nid-1);
% 
% if sign(U(1))~=sign(u0)
%     U = -1*U;
% end
