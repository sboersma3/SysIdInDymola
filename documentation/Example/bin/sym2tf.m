function G = sym2tf(g,Td)
%SYM2TF - Symbolic Transfer Function to Numerical Transfer Function
%conversion
%
% Syntax:  G = sym2tf(g)
%
% Inputs:
%    g - Symbolic Transfer Function representation
%
% Outputs:
%    G - Numeric Transfer Function representation
%
% Example: 
%    syms p
%    g11=(p + 2)/(p^2 + 2*p + 1);
%    g12=(p - 1)/(p^2 + 5*p + 6);
%    g21=(p - 1)/(p^2 + 3*p + 2);
%    g22=(p + 2)/(p + 1);
%    g=[g11 g12; g21 g22];
%    G=sym2tf(g)
%
% See also: tf2sym, ss2sym
%
% Author: Oskar Vivero Osornio
% email: oskar.vivero@gmail.com
% Created: February 2006; 
% Last revision: 25-March-2006;

% May be distributed freely for non-commercial use, 
% but please leave the above info unchanged, for
% credit and feedback purposes

%------------- BEGIN CODE -------------
if nargin == 1
    Td = 0;
end
[n,m]=size(g);
for i=1:n
    for j=1:m
        [num,den]=numden(g(i,j)*sym('1'));
        num_n=sym2poly(num);
        den_n=sym2poly(den);        
        
        if (any(num_n==Inf) || any(den_n==Inf ))
            num_n=sym2poly(num/1e+150);
            den_n=sym2poly(den/1e+150);          
        end
        
        if (any(num_n==Inf) || any(den_n==Inf ))
            num_n=sym2poly(num/1e+300);
            den_n=sym2poly(den/1e+300);          
        end
        coeff=den_n(1);
        num_n=num_n/coeff;
        den_n=den_n/coeff;
        
        G(i,j)=tf(num_n,den_n,Td);
    end
end
%------------- END OF CODE --------------