

function [Afu,Bfu,Cfu,Dfu]=detFu(Gi)

[Ag,Bg,Cg,Dg]=ssdata(Gi);


ng=size(Ag,1);

%Def

Afu=[zeros(1,7+ng);zeros(1,7),Cg;0,1,zeros(1,5+ng);0,0,1,zeros(1,4+ng);1,zeros(1,6+ng);
    zeros(1,4),1,zeros(1,2+ng);zeros(1,5),1,zeros(1,1+ng);Bg,zeros(ng,6),Ag];

Bfu=[1;zeros(6+ng,1)];

Cfu=[zeros(1,7),-Cg;0,-1,zeros(1,5+ng);0,0,-1,zeros(1,4+ng);zeros(1,3),-1,zeros(1,3+ng);
    zeros(1,5),1,zeros(1,1+ng);zeros(1,6),1,zeros(1,ng)];

Dfu=zeros(6,1);