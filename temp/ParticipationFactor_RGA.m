%% Participation factors

clear;clc

addpath(genpath('bin'));

h                   = 0.01;
t                   = 0:h:20-h;
ops.Nid             = length(t);
ops.w               = linspace(0.1,200,30);
ops.wlog            = logspace(log10(0.1),log10(100),100);
ops.Nw              = length(ops.w);

% define true system
z                   = tf('z',h);

temp                = load(strcat('C:\Users\s.boersma\Documents\MATLAB\Dymola\results\SingleMachineInfiniteBus\',"LinRes",num2str(10),'.mat'));
G                   = minreal(c2d(ss(temp.ABCD(1:temp.nx,1:temp.nx), temp.ABCD(1:temp.nx,temp.nx+1:end),...
    temp.ABCD(temp.nx+1:end,1:temp.nx),temp.ABCD(temp.nx+1:end,temp.nx+1:end)),h));
G0                  = G(1,2);
H0                  = G(1,4);



[right,ev,left]      = eig(G0.A);     % returns diagonal matrix ev  of eigenvalues and matrix right whose columns are the corresponding right eigenvectors, so that A*right = right*ev.
left1                = inv(right);   % Left eigenvectors
(abs(left.*(right')))'              % Participation factors
