% itrel.m
% script for iterative relaxation 
% of the winner-take-all network
% the row vectors in and k must 
% have the same length

[m,n]=size(k);
xp=zeros(n,1);
xc=zeros(n,1);
nits=20;
% rate=0.1;
rate=1;
sat=10;
OUT=zeros(n,nits);
for i=1:nits;
   xc = V*in' + rate*W*xp;
   ind=find(xc<0);
   xc(ind)=zeros(size(ind));
   ind=find(xc>sat);
   xc(ind)=sat*(ones(size(ind)));
   xp=xc;
   OUT(:,i)=xc;
end

