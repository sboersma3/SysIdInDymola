function U = get_optimal_timeseries_input(u0,h,Nid,w,Phi)

Nw   = length(w);        
A    = sqrt(Phi);     


t    = (0:5*Nid-1)*h; % here 5 times length is chosen, so that initial condition can be set
U    = zeros(1,length(t));
for kk=1:Nw
    U = U + A(kk)*cos(w(kk)*t);
end

% force the excitation signal to start at correct initial condition (aditionally we could look at the derivative)
[~,ind] = min(abs(U(1:length(t)-(Nid-1))-u0));

U        = U(ind:ind+Nid-1);

if sign(U(1))~=sign(u0)
    U = -1*U;
end
