
w=wter;
Si=Sid;
G=Gi;
H=Hi;
C=Ci;
vare=var_e_i;
%M=2;

sigma=9.4463;
corrvec= corrphiu(2:end);;
phiu=[];
phiy=[];

for jjj=1:5,

vecs=abs(frxav(Si,w(jjj)))^2;
vecgs=abs(frxav(G*Si,w(jjj)))^2;
veccsh=abs(frxav(C*Si*H,w(jjj)))^2;
vecsh=abs(frxav(Si*H,w(jjj)))^2;

vecconstpouru=veccsh*vare;
vecconstpoury=vecsh*vare;



veccos=[];
    for lll=1:M,
        veccos=[veccos,cos(lll*w(jjj))];
    end;
    veccos2=2*vecs*veccos;
    

phiu=[phiu,sigma*vecs+veccos2*corrvec+vecconstpouru];



    
    veccos3=2*vecgs*veccos;
    
    phiy=[phiy,sigma*vecgs+veccos3*corrvec+vecconstpoury];
    
end;

