
w=logspace(-3,pi,200);
load coucou
load coucou2

subplot(1,3,1); loglog(w,phiuwm,'b',w,phiuw,'r'); xlabel('\omega'); ylabel(' \Phi_r'); axis([w(1),w(end),1e-4,1e2]);

subplot(1,3,2); loglog(w,phiurom,'b',w,phiuro,'r'); xlabel('\omega'); ylabel('\Phi_{u_r}'); axis([w(1),w(end),1e-4,1e2]);

subplot(1,3,3); loglog(w,phiyrom,'b',w,phiyro,'r'); xlabel('\omega'); ylabel('\Phi_{y_r}'); axis([w(1),w(end),1e-6,1e3]);