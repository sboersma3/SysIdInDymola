function [uopt,Ai,P] = OptimalInputDesign(syshat,u0,ops)


syshat          = get_Fu_and_Fe(syshat);

[PHIopt,vecC,C,P] = get_optimal_spectrum_input(syshat,ops);

uopt            = get_optimal_timeseries_input(u0,syshat.h,ops.Nid,ops.w,PHIopt);
Ai              = sqrt(PHIopt);