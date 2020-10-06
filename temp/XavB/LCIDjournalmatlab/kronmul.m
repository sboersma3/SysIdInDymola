function [a,b,c,d]=kronmul(k,a1,b1,c1,d1)

a=kroprod(eye(k),a1);

b=kroprod(eye(k),b1);
c=kroprod(eye(k),c1);
d=kroprod(eye(k),d1);