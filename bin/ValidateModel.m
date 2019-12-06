function ValidateModel(syshat,signals,ops)

if ops.N>1
    
    y         = signals.y(1:floor(1*ops.ll*ops.Nb/ops.h));
    u         = signals.u(1:floor(1*ops.ll*ops.Nb/ops.h));
    
    [~,fit,~] = compare(iddata(y',u',ops.h),syshat{2*ops.ll*ops.Nb}.sys);
    
    disp(' ')
    disp(['fit of validation dataset is ', num2str(fit),'%'])
    disp(' ')
    
end
