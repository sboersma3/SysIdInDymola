%  This routine, given a square matrix Q, and a value r, will generate a string
%  of N complex numbers, such that if they are plotted, the ellipse (or
%  hyperbola) x'*Q*x = r will be shown.
%  Notice this is only any good for ellipses centred on the origin.
%  ax1 and ax2 are complex vectors that allow the axes of the ellipse to be
%  drawn.
%
%       Usage is:
%
%       z = ellipse(Q,r,np);
%
%       Written by Brett Ninness
%
%       First written 12/7/90
%

function z = ellipse(Q,r,np); 

%  get eigenvectors and eigenvalues

[evec,eval] = eig(Q);

%  Normalise the eigenvectors before forming P

e1 = evec(:,1);
e2 = evec(:,2);
e1 = e1/sqrt(e1(1)^2 + e1(2)^2);
e2 = e2/sqrt(e2(1)^2 + e2(2)^2);
P = [e1,e2];

%  Generate ellipse in new co-ordinate system  z = Px

t = 0:2*pi/(np-1):2*pi;
t = t(1:np);

z1 = sqrt(r/eval(1,1))*cos(t);
z2 = sqrt(r/eval(2,2))*sin(t);

%  Convert back to old co-ordinate system

x = P*[z1;z2];

%  Turn the whole thing into complex numbers now

j = sqrt(-1);
z = x(1,:) + j*x(2,:);





