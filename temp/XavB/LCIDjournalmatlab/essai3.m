%Figure comparing Jr with white noise with the optimal signal (M=10) for different N
%*************

N=500:500:6000;

Jrwn=[22.5036,9.5878,5.4586,3.4483,2.2639,1.4847,0.9335,0.5234,0.2063,0,0,0];

Jropt=[9.9108,3.7788,2.0146,1.2357,0.7981,0.5181,0.3234,0.1805,0.0710,0,0,0];

figure(1)
plot(N,Jrwn,'rx',N,Jropt,'bo',N,Jrwn,'r',N,Jropt,'b')
xlabel('N')
ylabel(' P_{u_r}+P_{y_r}')
axis([0,6000,0,25])

% figure(2)
% plot(N,Jrwn./Jropt,'kx')
% axis([0,5000,2,3])
% xlabel('N')
% ylabel('ratio Jr')