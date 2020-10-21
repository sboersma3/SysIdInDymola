function syshat = get_spectrum_input(syshat,signals,ops,kk)

syshat.Ai  = signals.Ai(kk*ops.Nb,:)';
syshat.wi  = signals.wi(kk*ops.Nb,:)';
