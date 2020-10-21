function SaveAndPlotExcitationSignal(Ai,ops)

rng(4)
thetai          = 2*pi.*rand(1,length(ops.w)) - pi; % phase initial batch
A               = zeros(ops.N,length(ops.w));       % amplitudes all batches
for kk=1:ops.K
    A(kk,:)     = Ai;
end

for kk=ops.K+1:ops.N
    if ops.Optimal
        load(strcat(ops.directory,'OptimalInput.mat'))
        Aopt              = interp1(OptimalInput(:,1),OptimalInput(:,2),ops.w,'linear');  % project on earlier used frequency grid
        Aopt(isnan(Aopt)) = 0;
        A(kk,:)           = Aopt;
    else
        A(kk,:)           = A(kk-1,:);
    end
end
B   = repmat(ops.w,1,ops.N);    % frequencies all batches
C   = repmat(thetai',1,ops.N);  % phase all batches


h   = ops.h;
ll  = ops.ll;
N   = ops.N;
K   = ops.K;

for mm=1:ops.N
    % write input to .txt
    fid = fopen(strcat(ops.directory,'input',num2str(mm),'.txt'),'w');
    fprintf(fid,'%s\n','A phi omega');
    fclose(fid);
    fid = fopen(strcat(ops.directory,'input',num2str(mm),'.txt'),'a');
    for kk=1:length(ops.w)
        str = strcat(num2str(A(mm,kk)),', ',num2str(C(kk,mm)),', ',num2str(B(kk,mm)));
        fprintf(fid,'%s\n',str);
    end
    fclose(fid);
end

% write parameters to .txt
fid = fopen(strcat(ops.directory,'parameters.txt'),'w');
fprintf(fid,'%s\n','h Nt N');
fclose(fid);
fid = fopen(strcat(ops.directory,'parameters.txt'),'a');
str = strcat(num2str(h),', ',num2str(ll*N),', ',num2str(N));
fprintf(fid,'%s\n',str);
fclose(fid);




t     = 0:ops.h:ops.N*ops.ll-ops.h;
nt    = floor(length(t)/size(A,1));
T     = zeros(size(A,1),nt);
for ll = 1:size(A,1)
    T(ll,:) = t((ll-1)*nt+1:ll*nt);
end
U     = zeros(size(A,1),size(T,2));
u     = [];
for ll = 1:size(A,1)
    for kk=1:length(ops.w)
        U(ll,:) = U(ll,:) + A(ll,kk)*sin(ops.w(kk)*T(ll,:)+C(kk,ll));
    end
    u     = [u U(ll,:)];
end

disp(['Number of datapoints in the input per batch: ',num2str(length(u)/N)])
disp(' ')

ops.w = ops.w/2/pi;
U     = fft(u);
N     = length(u);
f     = (0:N-1)*(1/ops.h/N);
P     = abs(U).^2/N^2;


figure(100);clf
subplot(3,1,1)
plot(t(1:length(u)),u);grid
ylabel('$u(t)$','interpreter','latex')
xlabel('$t$ (sec)','interpreter','latex')
title('Excitation signal','interpreter','latex')

subplot(3,1,2)
plot(ops.w,Ai,'bo');grid
ylabel('$A_i$','interpreter','latex')
xlabel('$\omega$ (Hz)','interpreter','latex')
xlim([min(ops.w) max(ops.w)])
ylim([0 max(Ai)+0.5*max(Ai)])
title('Excitation signal spectrum','interpreter','latex')

subplot(3,1,3)
plot(f,P,'bo');grid
ylabel('$P = A_i^2/4$','interpreter','latex')
xlabel('$\omega$ (Hz)','interpreter','latex')
xlim([0 max(ops.w)])
ylim([0 max(P)+0.5*max(P)])
title('Excitation signal power','interpreter','latex')

prompt = 'Do you want to apply the signal to PSSE? y/n: ';
str    = input(prompt,'s');
if strcmp('y',str)
    if strcmp(ops.directory,'PSSE\European\')
        fid = fopen('PSSE\European\case_CE2016_SysID\Grid2030_SysID\Test_sim\InputEco4.py','wt');
        str = strcat('Nt=',num2str(ops.ll));
        fprintf(fid,str);
        str = '\nFREQ=( ';
        for kk=1:length(ops.w)
            if kk<length(ops.w)
                str = strcat(str,num2str(2*pi*ops.w(kk)),',');
            else
                str = strcat(str,num2str(2*pi*ops.w(kk)),')');
            end
        end
        fprintf(fid,str);
        str = '\nPHI=( ';
        for kk=1:length(ops.w)
            if kk<length(ops.w)
                str = strcat(str,num2str(thetai(kk)),',');
            else
                str = strcat(str,num2str(thetai(kk)),')');
            end
        end
        fprintf(fid,str);
        str = strcat('\nAMPLITUDE=',num2str(A(1)));
        fprintf(fid,str);
        fclose(fid);
        cd('PSSE\European\case_CE2016_SysID\Grid2030_SysID\Test_sim')
        system('Simul33_11.py &');
    else
        system('"C:\Program Files (x86)\PTI\PSSE33\PSSBIN\psse33.exe" -ini C:\Windows\psse3312.ini -pyver 27 &');
    end
end
