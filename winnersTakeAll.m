% winnersTakeAll.m
% script for iterative relaxation of the winners-take-all network;
% feedforward weight matrix V, and recurrent weight matrix W must 
% already be available in workspace

nTs=20; % set number of iterations
rate=1; % set the rate parameter
cut=0; % set the cutoff level (usually zero)
sat=10; % set the saturation level (usually ten)
[nUnits,dum]=size(W); % find the number of units in the network
y=zeros(nUnits,nTs); % zero the output y array

for t = 2:nTs % for each time step
   y(:,t) = rate*W*y(:,t-1) + V*x; % update y
   y(:,t) = max(y(:,t),cut); % impose the cutoff 
   y(:,t) = min(y(:,t),sat); % impose the saturation
end % end the t loop

