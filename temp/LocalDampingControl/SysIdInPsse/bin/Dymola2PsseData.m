function sys = Dymola2PsseData(ops)
% function that transform Dymola simulation data to PSS/E simulation data


% convert simulation parameters
temp  = strsplit(ops.directory,'/');
model = temp{2};

temp  = readtable(strcat('..\SysIdInDymola\results\',model,'\parameters.txt'));

N     = temp.Var2(1);
ll    = temp.Var2(2);
h     = temp.Var2(3);

temp  = table( [{'h'}; temp.Var2(3)],...
    [{'Nt'}; temp.Var2(1)*temp.Var2(2)],...
    [{'N'}; temp.Var2(1)]);

writetable(temp,strcat(ops.directory,'parameters.txt'));


% convert measurements
for kk=1:N
    temp     = load(strcat('..\SysIdInDymola\results\',model,"\SimRes",num2str(kk*ll),'.mat'),'data_2');   % load a batch
    Y{kk*ll} = temp.data_2;
end

signals.t         = Y{ll}(1,1:end);
signals.u         = Y{ll}(ops.Nu,1:end);
signals.y         = Y{ll}(ops.Ny,1:end);
for kk=2:N
    signals.t     = [signals.t, Y{kk*ll}(1,2:end)];
    signals.u     = [signals.u, Y{kk*ll}(ops.Nu,2:end)];
    signals.y     = [signals.y, Y{kk*ll}(ops.Ny,2:end)];
end
% to remove the wrapping error (needs to be checked)
dy  = diff(signals.y);
ind = find(abs(dy) > 1==1);
for kk=1:2:length(ind)-1; signals.y(ind(kk)+1:ind(kk+1)) = signals.y(ind(kk)+1:ind(kk+1)) - dy(ind(kk)); end
signals.y  = detrend(unwrap(signals.y)); % measured output

signals.u  = detrend(signals.u);         % excitation signal

% get linearization measurements
temp            = load(strcat('..\SysIdInDymola\results\',model,"\LinRes",num2str(1*ll),'.mat'));
sys.G           = ssbal(ss(temp.ABCD(1:temp.nx,1:temp.nx), temp.ABCD(1:temp.nx,temp.nx+1:end),...
    temp.ABCD(temp.nx+1:end,1:temp.nx),temp.ABCD(temp.nx+1:end,temp.nx+1:end)));
if ~isstable(sys.G)
    [sys.G,~] = stabsep(sys.G);
    disp('warning: linearized Dymola model not stable')
end
sys.Gid         = c2d(ssbal(sys.G(ops.ny,ops.nu)),h);
[~,D]           = eig(sys.Gid.a,'vector');
D               = [sort(D(imag(D)==0));sort(D(imag(D)~=0))];
sys.p           = D;                                    % poles
D               = [abs(sort(D(imag(D)==0)));sort(D(imag(D)~=0))];
sys.zeta        = abs(-real(log(D))./abs(log(D)));      % damping ratios
sys.zeta(isnan(sys.zeta)) = 1;
sys.wn          = abs(log(D)/h);                        % natural frequency


temp = [repelem(signals.t',2) repelem(signals.y',2) zeros(2*length(signals.y),1) repelem(signals.u',2)];
temp = [zeros(5,size(temp,2));temp];
writematrix(temp,strcat(ops.directory,'results.txt'),'Delimiter','tab');


% convert input
Ai = load(strcat('..\SysIdInDymola\results\',model,'\InputDymola.mat'),'A');
wi = load(strcat('..\SysIdInDymola\results\',model,'\InputDymola.mat'),'B');
Ai = Ai.A';
wi = wi.B;

for kk=1:N
    fileID = fopen(strcat(ops.directory,'input',num2str(kk),'.txt'),'w');
    fprintf(fileID,'%6s %6s %6s\n','A','phi','omega');
    for ll=1:length(Ai)
        fprintf(fileID,'%6.2f %6.2f %6.2f\n',[Ai(ll,kk) 0 wi(ll,kk)]);
    end
    fclose(fileID);
end