function results = TestIdentifiedModel(syshat,signals,ops)

N    = ops.N;
Nb   = ops.Nb;
Nid  = ops.Nid;
ll   = ops.ll;
h    = ops.h;

u    = signals.u;
y    = signals.y;

for kk=1:floor(N/Nb)    
    t1                          = (kk-1)*Nid+1;
    t2                          = kk*Nid;   
    yi                          = y(t1:t2)';
    ui                          = u(t1:t2)';   
    data                        = iddata(yi,ui,h);

    [E,R]                       = resid(data,syshat{kk*ll*Nb}.sys);   
    results{kk*ll*Nb}.E         = E;
    results{kk*ll*Nb}.R         = R;
    
    conf99                      = sqrt(2)*erfcinv(2*.01/2);
    results{kk*ll*Nb}.lconf     = -conf99/sqrt(length(yi));
    results{kk*ll*Nb}.uconf     = conf99/sqrt(length(yi));
    results{kk*ll*Nb}.tau       = 0:1:size(R,1)-1;
    
    % check if correlation test is satisfied
    temp = abs(R(:,1,1)) > results{kk*ll*Nb}.uconf;
    temp = temp + abs(R(:,1,2)) > results{kk*ll*Nb}.uconf;
    if sum(temp)~=0
       disp(' ')
       disp(['check the correlation functions for batch ', num2str(kk)])
       disp(' ')
    end

end

