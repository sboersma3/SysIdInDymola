function [P] = kroprod(A, B)

% function [P] = kroprod(A, B)
%
% calcul du produit de kronecker des matrices A et B
%
% GG production

[p, q] = size(A);
P = [];

for i = 1:p,
   
   tmp = [];
   
   for j = 1:q,
     tmp = [tmp, A(i,j)*B];
   end
   
   P = [P; tmp];
end
