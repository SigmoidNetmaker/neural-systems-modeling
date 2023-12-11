% covarPatAssoc.m 
% this script trains two-layered binary networks
% to associate patterns using the covarience rule

[nPat,nIn]=size(InPat); % find number of patterns and number of inputs 
[nPat,nOut]=size(DesOut); % find number of patterns and number of outputs
V=zeros(nOut,nIn); % initialize connectivity matrix V to all zeros
for i=1:nOut, % for each output unit
   for j=1:nIn, % for each input unit
      for l=1:nPat, % for each pattern 
         deltaV=((2*DesOut(l,i))-1)*((2*InPat(l,j))-1); % weight update
         V(i,j) = V(i,j) + deltaV; % apply weight update
      end, % end pattern loop
   end, % end input unit loop
end; % end output unit loop

Out=zeros(nPat,nOut); % define an array to hold the output responses
for l=1:nPat, % for each pattern
   Out(l,:)=(V*InPat(l,:)')'; % find the weighted input sum
   Out(l,:)=Out(l,:)>0; % apply threshold to convert to binary
end; % end pattern loop

V % show the trained weight matrix
Out % show the trained output responses


% tighter alternatives to above
% V=(2*DesOut-1)'*(2*InPat-1); % compute weight matrix V in one step
% Out=(V*InPat')'>0; % compute thresholded output responses in one step

