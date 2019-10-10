function [a,b,c,d] = butter(n,Wn,hs)
%BUTTER Compute discrete Butterworth system
%
%    [a,b,c,d] = butter(n,Wn,hs)
%
%    Inputs:
%      n  - integer specifying filter order
%      Wn - matrix with filter corner frequencies, scalar for low-pass and
%           highpass, vector for band-bass, and 2x2 for band-stop with [0
%           W1; W2 NF].
%      hs - optional flag indicating Wn scalar is for a high pass filter
%
%    Outputs:
%       a - nxn matrix specifying A in x_n+1 = A x_n + B u_n
%       b - nx1 matrix specifying B in x_n+1 = A x_n + B u_n
%       c - 1xn matrix specifying C in y_n = C x_n + D u_n
%       d - 1xn matrix specifying D in y_n = C x_n + D u_n
%
%    See also ctrluis.toolstrip.dataprocessing.tfilt

%   Copyright 1986-2013 The MathWorks, Inc.

if nargin < 3, hs = []; end

if length(Wn)>1,
    if all(Wn<0 | Wn>1)
        ctrlMsgUtils.error('Controllib:dataprocessing:errInvalidBand1')
    end
    if Wn(1)>=Wn(2)
        ctrlMsgUtils.error('Controllib:dataprocessing:errInvalidBand2')
    end
    
    if Wn(1)<0, Wn(1) = 0; end
    if Wn(2)>1, Wn(2) = 1; end
    if abs(Wn(1))<1e4*eps
        Wn = Wn(2);
    elseif abs(Wn(2)-1)<1e4*eps,
        Wn = Wn(1);
        if isempty(hs)
            hs = 'high';
        else
            hs = [];
        end
    end
end
btype = 1;
if ~isempty(hs),btype=3;end

if length(Wn) == 2
    btype = btype + 1;
end

% step 1: get analog, pre-warped frequencies
fs = 2;
u = 2*fs*tan(pi*Wn/fs);

% step 2: convert to low-pass prototype estimate
if btype == 1   % lowpass
    Wn = u;
elseif btype == 2       % bandpass
    Bw = u(2) - u(1);
    Wn = sqrt(u(1)*u(2));   % center frequency
elseif btype == 3       % highpass
    Wn = u;
elseif btype == 4       % bandstop
    Bw = u(2) - u(1);
    Wn = sqrt(u(1)*u(2));   % center frequency
end

% step 3: Get N-th order Butterworth analog lowpass prototype
p = exp(sqrt(-1)*(pi*(1:2:2*n-1)/(2*n) + pi/2)).';
k = real(prod(-p));

% Transform to state-space
% Remove Inf.
p = p(isfinite(p));

% Group into complex pairs
np = length(p);
%nz= 0;%= length(z);
p = cplxpair(p,1e6*np*norm(p)*eps + eps);

% Initialize state-space matrices for running series
a=[]; b=[]; c=zeros(1,0); d=1;

% If odd number of poles only, convert the pole at the
% end into state-space.
%  H(s) = 1/(s-p1) = 1/(s + den(2))
if rem(np,2)
    a = p(np);
    b = 1;
    c = 1;
    d = 0;
    np = np - 1;
end

% Now we have an even number of poles and zeros, although not
% necessarily the same number - there may be more poles%.
%   H(s) = (s^2+num(2)s+num(3))/(s^2+den(2)s+den(3))
% Loop through rest of pairs, connecting in series to build the model.
i = 1;

% Take care of any left over unmatched pole pairs.
%   H(s) = 1/(s^2+den(2)s+den(3))
while i < np
    den = real(poly(p(i:i+1)));
    wns = sqrt(prod(abs(p(i:i+1))));
    if wns == 0, wns = 1; end
    t = diag([1 1/wns]);    % Balancing transformation
    a1 = t\[-den(2) -den(3); 1 0]*t;
    b1 = t\[1; 0];
    c1 = [0 1]*t;
    d1 = 0;
    %       [a,b,c,d] = series(a,b,c,d,a1,b1,c1,d1);
    % Next lines perform series connection
    ma1 = size(a,1);
    na2 = size(a1,2);
    a = [a zeros(ma1,na2); b1*c a1]; %#ok<AGROW>
    b = [b; b1*d]; %#ok<AGROW>
    c = [d1*c c1];
    d = d1*d;
    
    i = i + 2;
end
% Apply gain k:
c = c*k;
d = d*k;

% step 4: Transform to lowpass, bandpass, highpass, or bandstop of desired Wn
wo = Wn;
if btype == 1           % Lowpass
    at = wo*a;
    bt = wo*b;
    ct = c;
    dt = d;
elseif btype == 2       % Bandpass
    nb = size(b,2);
    [mc,ma] = size(c);
    % Transform lowpass to bandpass
    q = wo/Bw;
    at = wo*[a/q eye(ma); -eye(ma) zeros(ma)];
    bt = wo*[b/q; zeros(ma,nb)];
    ct = [c zeros(mc,ma)];
    dt = d;
elseif btype == 3       % Highpass
    at =  wo*eye(size(a))/a;
    bt = -wo*(a\b);
    ct = c/a;
    dt = d - c/a*b;
elseif btype == 4       % Bandstop
    nb = size(b,2);
    [mc,ma] = size(c);
    % Transform lowpass to bandstop
    q = wo/Bw;
    at =  [wo/q*eye(size(a))/a wo*eye(ma); -wo*eye(ma) zeros(ma)];
    bt = -[wo/q*(a\b); zeros(ma,nb)];
    ct = [c/a zeros(mc,ma)];
    dt = d - c/a*b;
    
end
a=at;b=bt;c=ct;d=dt;

% step 5: Use Bilinear transformation to find discrete equivalent:
t = 1/fs;
r = sqrt(t);
t1 = eye(size(a)) + a*t/2;
t2 = eye(size(a)) - a*t/2;
ad = t2\t1;
bd = t/r*(t2\b);
cd = r*c/t2;
dd = c/t2*b*t/2 + d;
a = ad;b = bd; c = cd; d = dd;
end