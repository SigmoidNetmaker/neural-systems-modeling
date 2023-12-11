
% KohonenSOM.m
% this script implements a self-organizing map using the 
% basic Kohonen algorithm; pattern array InPat must already 
% be available in the workspace

nOut=3; % set the number of output units
a=1; % set the learning rate
dec=1; % set the learning rate decrement
nHood=0; % set the neighborhood size
nIts=100; % set the number of iterations
[nPat,nIn]=size(InPat); % find number of patterns and of input units
V=rand(nOut,nIn); % set initially random connectivity matrix
for c=1:nIts, % for each learning iteration
   pIndx=ceil(rand*nPat); % choose an input pattern at random
   x=InPat(pIndx,:)'; % set input vector x to chosen pattern
   y=V*x; % compute output to chosen input pattern
   [winVal winIndx]=max(y); % find the index of the winning output
   fn=winIndx-nHood; % find first neighbor in training neighborhood
   ln=winIndx+nHood; % find last neighbor in training neighborhood
   if fn < 1, fn=1; end % keep first neighbor in bounds
   if ln > nOut, ln=nOut; end % keep last neighbor in bounds
   for h=fn:ln, % for all units in training neighborhood
      hld=V(h,:)+a*x'; % apply Kohonen update
      V(h,:)=hld/norm(hld); % normalize new weight vector
      a=a*(dec); % decrement the learning rate
   end % end neighbor training loop
end % end learning loop
Out=(V*InPat')'; % find the output for all input patterns

SOMoutImage


