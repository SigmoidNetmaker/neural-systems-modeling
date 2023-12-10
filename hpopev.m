% script hpopev.m
% this script creates and evaluates 
% optimal autoassociative networks;
% p is the probability that any pattern 
% element is a 1 (others are 0), pe is
% the  probability estimated in 
% constructing the connectivity matrix,
% n is the number of units in the network,
% m is the number of patterns
% 

% set parameters
n=30;
m=3;
p=0.1;
pe=0.4;

% construct m random patterns with 
% probability p that any element is a 1
P=rand(m,n);
P=P<p;

% construct the n element connectivity 
% matrix which is assumed optimal based
% on estimated probability pe
OP = zeros(n);
for k=1:m,
   opdw=(P(k,:)-pe)'*(P(k,:)-pe);
   OP = OP + opdw;
end,
MSK = (ones(n) - eye(n));
OP = OP .* MSK;

% test the network on each of the m
% patterns; do this by initializing the
% network with each of the patterns at half
% strength and updating asynchronously for
% itn=300 iterations, then save the result
itn=300;
OUT=zeros(m,n);
for i=1:m,
   v=(P(i,:)*0.5)';
   for j=1:itn,
      [sdrv rindx]=max(rand(1,n));
      v(rindx)=OP(rindx,:)*v;
      v(rindx)=v(rindx)>0;
   end;
   OUT(i,:)=v';
end;

% find the sum of the absolute difference
% between the network output and the
% original input patterns
D=sum(sum(abs(P-OUT)));

% print out probability p, estimated 
% probability pe, and the difference D
p
pe
D

