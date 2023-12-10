% itlin.m
% script for iterating the
% lateral inhibition model
% k is a row vector with 
% size of a row of IN;
% uk is the unit kill
% column vector
xp=zeros(size(k))';
xc=zeros(size(k))';
a=0.1; b=1-a;
for i=1:60,
   u=IN(:,i);
   xc=a*(V*u) + a*(W*xp) + b*xp;
   xc=xc .* uk;
   xp=xc;
   OUT(:,i)=xc;
end