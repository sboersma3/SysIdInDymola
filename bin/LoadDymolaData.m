function [sys,signals] = LoadDymolaData(ops)

N           = ops.N;
ll          = ops.ll;
h           = ops.h;
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
    sys{kk*ll}.G    = minreal(c2d(ss(temp.ABCD(1:temp.nx,1:temp.nx), temp.ABCD(1:temp.nx,temp.nx+1:end),...
        temp.ABCD(temp.nx+1:end,1:temp.nx),temp.ABCD(temp.nx+1:end,temp.nx+1:end)),h),[],false);
    sys{kk*ll}.Gid  = minreal(sys{kk*ll}.G(ny,nu),[],false);
    sys{kk*ll}.Hid  = minreal(sys{kk*ll}.G(ny,ne),[],false);
    [~,D]           = eig(sys{kk*ll}.Gid.a,'vector');
    D               = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
    sys{kk*ll}.p    = D;                                    % poles
    D               = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
    sys{kk*ll}.zeta = abs(-real(log(D))./abs(log(D)));      % damping ratios
    sys{kk*ll}.zeta(isnan(sys{kk*ll}.zeta)) = 1;
    sys{kk*ll}.wn   = abs(log(D)/h);                        % natural frequency
    sys{kk*ll}.Wc   = ctrb(sys{kk*ll}.G);
    sys{kk*ll}.Wo   = obsv(sys{kk*ll}.G);
end

signals.t         = Y{ll}(1,1:end);
signals.u         = Y{ll}(2,1:end);
signals.y         = Y{ll}(Ny,1:end);
for kk=2:N
    signals.t     = [signals.t, Y{kk*ll}(1,2:end)];
    signals.u     = [signals.u, Y{kk*ll}(2,2:end)];
    signals.y     = [signals.y, Y{kk*ll}(Ny,2:end)];
end
signals.y = detrend(unwrap(signals.y));
signals.u = detrend(signals.u);
signals.e = randn(size(signals.y));

if 0
    signals.t = (0:h:N*ll);
    Ai         = .1*ones(length(ops.w),1);    % amplitudes initial batch  
    signals.u  = 0;
    rng(4)
    for kk=1:length(ops.w)
        thetai(kk) = randn;
        signals.u  = signals.u + Ai(kk)*sin(ops.w(kk)*signals.t+thetai(kk));
    end
    signals.e = randn(size(signals.u));

    
    signals.y = (lsim(sys{1*ll}.Gid,signals.u,signals.t) + ...
        lsim(sys{1*ll}.Hid,ops.sigma*signals.e,signals.t))';
    
end