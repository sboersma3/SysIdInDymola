function radm=admS(W,gmod,cc,w)






fw=abs(frxav(W,w));

% gmod=frxav(Gmod,w);
% cc=frxav(C,w);






% calcul de radm

rr=abs(1+cc*gmod);

radm=(rr-inv(fw))/abs(cc);
