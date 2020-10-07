clear;clc

addpath(genpath('bin'));

ops.directory   = 'results\Nordic44\';

% load linear model
sys   = load(strcat(ops.directory,'linear\linearN44'));
% load excitation signal
input = load(strcat(ops.directory,'InputDymola'));

t     = 0:input.h:input.N*input.ll-input.h;
Nt    = floor(length(t)/size(input.A,1));
T     = zeros(size(input.A,1),Nt);
for ll = 1:size(input.A,1)
        T(ll,:) = t((ll-1)*Nt+1:ll*Nt);
end
U     = zeros(size(input.A,1),size(T,2));
u     = [];
for ll = 1:size(input.A,1)
    for kk=1:size(input.A,2)
        U(ll,:) = U(ll,:) + input.A(ll,kk)*sin(input.B(kk,ll)*T(ll,:)+input.C(kk,ll));
    end
    u     = [u U(ll,:)];
end
clear U T kk ll

% generate noise
rng(5)
sigma_e = .02;
e       = sigma_e*randn(1,Nt*input.N);

% append vectors with one element
t       = [t t(end)+input.h];
u       = [u u(end)];
e       = [e sigma_e*randn];

% perform experiment on linear model
y       = lsim(sys.G,u,t) + lsim(sys.H,e,t);
y       = y';

% check results experiment
figure(1);clf
subplot(2,1,1)
plot(t,u,'r--');grid;hold on;
plot(t,e,'k')
for kk=1:input.N
   vline(kk*input.ll,'k--') 
end
subplot(2,1,2)
plot(t,y);grid
for kk=1:input.N
   vline(kk*input.ll,'k--') 
end

% store experiment data in Dymola format
 
for kk=1:input.N
   data_2 = [t((kk-1)*Nt+1:kk*Nt);
             u((kk-1)*Nt+1:kk*Nt);
             y((kk-1)*Nt+1:kk*Nt);
             e((kk-1)*Nt+1:kk*Nt)]; 

   str    = strcat('SimRes',num2str(kk*input.ll));       
   if kk==input.N
       f      = [t(end);u(end);y(end);e(end)]; 
       data_2 = [data_2 f];
   end
   save(strcat(ops.directory,str),'data_2')
end

fileID     = fopen(strcat(ops.directory,'parameters.txt'),'w');
formatSpec = 'N %4.2f \nll %4.2f \nh %4.2f\nM %4.2f\nK %4.2f\nsigma_u  %4.2f\nsigma_y  %4.2f\nsigma_load  %4.2f';
fprintf(fileID,formatSpec,input.N,input.ll,input.h,size(input.A,2),1,0,0,sigma_e);
fclose(fileID);