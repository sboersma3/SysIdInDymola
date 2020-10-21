
function gp = matsys(A,B,C,D,Cz,Dz,Nh,varargin)

Am  = A;
Bm  = B;
Cm  = C;
Cmz = Cz;
Dm  = D;
Dmz = Dz;

A  = Am;
Ai = A;
AA = Ai;
for ii = 2:Nh
    Ai = A*Ai;
    AA = [AA;Ai];
end
gp.A = AA;


AiB = Bm;
BB  = kron(eye(Nh),AiB);
for ii = 1:Nh-1
    AiB = A*AiB;
    BB = BB+kron(diag(ones(Nh-ii,1),-ii),AiB);
end
gp.B = BB;


C  = Cm;
A  = Am;
Ai = eye(size(Am,1));
CC = C;
for ii = 2:Nh
    Ai = A*Ai;
    CC = [CC;C*Ai];
end
gp.C = CC;

A    = Am;
Ai   = eye(size(Am,1));
DD   = kron(eye(Nh),Dm);
for ii = 1:Nh-1
    DD = DD+kron(diag(ones(Nh-ii,1),-ii),Cm*Ai*Bm);
    Ai = A*Ai;
end
gp.D = DD;

Cz  = Cmz;
A   = Am;
Ai  = eye(size(Am,1));
CCz = Cz;
for ii = 2:Nh
    Ai  = A*Ai;
    CCz = [CCz;Cz*Ai];
end
gp.Cz = CCz;

Cz   = Cmz;
A    = Am;
Ai   = eye(size(Am,1));
DDz  = kron(eye(Nh),Dmz);
for ii = 1:Nh-1
    DDz = DDz+kron(diag(ones(Nh-ii,1),-ii),Cz*Ai*Bm);
    Ai  = A*Ai;
end
gp.Dz = DDz;

if ~isempty(varargin)
    
    Acoup   = varargin{1};
    AiAcoup = Acoup;
    AAcoup  = kron(eye(Nh),AiAcoup);
    for ii = 1:Nh-1
        AiAcoup = A*AiAcoup;
        AAcoup = AAcoup+kron(diag(ones(Nh-ii,1),-ii),AiAcoup);
    end
    gp.Acoup = AAcoup; 
    
end

end

