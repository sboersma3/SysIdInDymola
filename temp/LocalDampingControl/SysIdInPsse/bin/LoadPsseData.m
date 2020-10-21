function [signals,ops] = LoadPsseData(ops)

Nid          = ops.Nid;
N            = ops.N;
ny1          = ops.ny1;
ny2          = ops.ny2;
sigma_e      = ops.sigma_e;
directory    = ops.directory;

temp         = readmatrix(strcat(directory,'results.txt'));
if ops.European
    temp      = temp(7:end-1,:);
    temp      = temp(:,all(~isnan(temp)));
    data_2    = temp';
    save(strcat(directory,'SimRes.mat'),'data_2');
else
    temp      = temp(6:2:end,:);
    temp      = temp(:,all(~isnan(temp)));
end

signals.t    = temp(:,1);
signals.e    = sigma_e*randn(size(temp,1),1);
signals.u    = detrend(temp(:,end));
signals.y    = detrend((temp(:,ny1)-temp(:,ny2)))+signals.e; 


% get excitation frequencies
for kk=1:N
    temp                = readmatrix(strcat(directory,'input',num2str(kk),'.txt'));
    signals.Ai(kk,:)    = temp(:,1);
    signals.wi(kk,:)    = temp(:,3);
end
ops.Nw     = size(temp,1);



