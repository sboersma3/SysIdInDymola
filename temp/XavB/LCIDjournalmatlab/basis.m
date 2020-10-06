
% Basis [1 ... z^-k]
function [a,b,c,d]=basis(k)

a=[zeros(1,k);eye(k-1),zeros(k-1,1)];

b=[1;zeros(k-1,1)];

c=[zeros(1,k);eye(k)];

d=[1;zeros(k,1)];