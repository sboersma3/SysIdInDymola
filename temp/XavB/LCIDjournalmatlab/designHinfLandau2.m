
%function C=designHinfLandau(numGmod,denGmod)




gain=1;

%numW1=[0.527064 -0.472663];
numW1=[0.5165 -0.4632];
denW1=[1 -0.999455];
%numW2=[0.897902 -1.269527 0.787107];
numW2=[1];
 denW2=[10000];
%numW2=1;
%denW2=100;
k2=0.001;
%k2=0.01;

%calcul des relevant controllers
%**********************************
gggamma=1;
[Amod,Bmod,Cmod,Dmod]=dlinmod('Hinf4blcs',1);

if Dmod(3,3)~=0 error('mauvais conditionnement'); end;


%Pdis=pck(Amod,Bmod,Cmod,Dmod);

B1mod=Bmod(:,1:2);  B2mod=Bmod(:,3);
C1mod=Cmod(1:2,:);  C2mod=Cmod(3,:);
D11mod=Dmod(1:2,1:2);  D12mod=Dmod(1:2,3);
D21mod=Dmod(3,1:2);  D22mod=Dmod(3,3);
[acp,bcp,ccp,dcp,acl,bcl,ccl,dcl,hinfo,ak,bk1,bk2,ck1,ck2,dk11,dk12,dk21,dk22]=dhinf(Amod,B1mod,B2mod,C1mod,C2mod,D11mod,D12mod,D21mod,D22mod);
[numC,denC]=ss2tf(acp,bcp,ccp,dcp);
