function [sys,signals] = LoadDymolaData(ops)

N           = ops.N;
ll          = ops.ll;
h           = ops.h_new;
nu          = ops.nu;
ne          = ops.ne;
ny          = ops.ny;
Ny          = ops.Ny;
directory   = ops.directory;


for kk=1:N
    temp     = load(strcat(directory,"SimRes",num2str(kk*ll),'.mat'),'data_2');   % load a batch
    Y{kk*ll} = temp.data_2;
end

% load linearization data
for kk=1:N
    temp            = load(strcat(directory,"LinRes",num2str(kk*ll),'.mat'));
    if kk==2
        temp        = load(strcat(directory,"LinRes",num2str(1*ll),'.mat'));
    end
    
    % works for other networks
    sys{kk*ll}.G    = ssbal(ss(temp.ABCD(1:temp.nx,1:temp.nx), temp.ABCD(1:temp.nx,temp.nx+1:end),...
        temp.ABCD(temp.nx+1:end,1:temp.nx),temp.ABCD(temp.nx+1:end,temp.nx+1:end)));
    sys{kk*ll}.Gid  = c2d(ssbal(sys{kk*ll}.G(ny,nu)),h);
    sys{kk*ll}.Hid  = c2d(ssbal(sys{kk*ll}.G(ny,ne)),h);    
    
    [~,D]           = eig(sys{kk*ll}.Gid.a,'vector');
    D               = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
    sys{kk*ll}.p    = D;                                    % poles
    D               = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
    sys{kk*ll}.zeta = abs(-real(log(D))./abs(log(D)));      % damping ratios
    sys{kk*ll}.zeta(isnan(sys{kk*ll}.zeta)) = 1;
    sys{kk*ll}.wn   = abs(log(D)/h);                        % natural frequency
    sys{kk*ll}.nr   = size(D(imag(D)==0),1);
    sys{kk*ll}.ni   = size(sort(D(imag(D)~=0)),1)/2;
end

signals.t         = Y{ll}(1,1:end);
signals.u         = Y{ll}(2,1:end);
signals.y         = Y{ll}(Ny,1:end);
for kk=2:N
    signals.t     = [signals.t, Y{kk*ll}(1,2:end)];
    signals.u     = [signals.u, Y{kk*ll}(2,2:end)];
    signals.y     = [signals.y, Y{kk*ll}(Ny,2:end)];
end
signals.y  = detrend(unwrap(signals.y)); % measured output  
signals.u  = detrend(signals.u);         % excitation signal
signals.e  = randn(size(signals.y));     % reconstructed noise signal

signals.Pu = rms(signals.u)^2;           % power in excitation signal
signals.Py = rms(signals.y)^2;           % power in measurement

% get excitation frequencies            
A          = load(strcat(directory,'InputDymola.mat'),'A');
B          = load(strcat(directory,'InputDymola.mat'),'B');
signals.Ai = A.A; 
signals.wi = B.B';

% the following can be used to replace the nonlinear Dymola output with
% linear Dymola output (works only when there is one batch (i.e., N=1)
% and when ops.h_new=ops.h)
if 0    
    signals.y = (lsim(sys{1*ll}.Gid,signals.u,signals.t) + ...
        lsim(sys{1*ll}.Hid,ops.sigma*signals.e,signals.t))';
end

