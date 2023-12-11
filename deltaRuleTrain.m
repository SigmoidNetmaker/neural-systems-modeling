% script deltaRuleTrain.m
% this script trains a two-layered network of units
% with the squashing activation funciton to associate 
% patterns using the delta rule 

a=1; % set the learning rate
tol=0.1; % set the tolerance
nIts=100000; % set the maximum number of allowed iterations
[nPat,nIn]=size(InPat); % find numbers of patterns and inputs 
[nPat,nOut]=size(DesOut); % find numbers of patterns and outputs 
V=rand(nOut,nIn)*2-1; % set initially random connectivity matrix
maxErr=10; % set the maximum error to an initially high value

for c=1:nIts, % for each learning iteration
   pIndx=ceil(rand*nPat); % choose pattern pair at random
   d=DesOut(pIndx,:)'; % set desired output d to chosen output
   x=InPat(pIndx,:)'; % set input x to chosen input pattern
   q=V*x; % find the weighted sum q of the inputs
   y=1./(1+exp(-q)); % squash that to compute the output y
   dy=y.*(1-y); % compute the derivative of the squashing function
   e=d-y; % find the error e for the chosen input
   g=e.*dy; % find output error signal g
   deltaV=a*g*x'; % compute delta rule weight update  
   V=V+deltaV;  % apply the weight update
   if rem(c,(5*nPat))==0, % after several updates check maximum error
      Q=(V*InPat')'; % compute the weighted input sum for all patterns
      Out=1./(1+exp(-Q)); % squash to compute output for all patterns
      maxErr=max(abs(DesOut-Out)); % find max error over all patterns
   end % end the check
   if maxErr<tol, break, end % break if max error is below tolerance
end % end learning loop


V
Out


 
   