% infoSOMbackground.m
% this script trains an SOM network and finds the conditional 
% probability table between input and winner-take-all output

nX=20; % set the number of input states and 
stf=1; % set the input spatial tuning field
nIn=nX+stf*2; % find the number of input units
nOut=30; % set the number of output units
bg=0.1; % set the input background rate
nHood=0; % set neighborhood size for SOM
a=1; nIts=1000; % set learning rate and iterations for SOM
V=rand(nOut,nIn); % randomize connectivity matrix
for i=1:nOut, V(i,:)=V(i,:)/norm(V(i,:)); end % normalize V

for c=1:nIts, % for each SOM training iteration
   x=ones(nIn,1)*bg; % set the input background activity
   rTpos=ceil(rand*nX); % choose a target location at random
   x(rTpos:rTpos+stf*2)=ones(stf*2+1,1); % set input driven activity
   y=V*x;  % compute the output vector
   [winVal winIndx]=max(y); % find the maximal output response
   fn=winIndx-nHood; % set the first neighbor for SOM training
   ln=winIndx+nHood; % set the last neighbor for SOM training
   if fn < 1, fn=1; end % keep the first neighbor in bounds
   if ln > nOut, ln=nOut; end % keep last neighbor in bounds
   for h=fn:ln, % for each output unit in neighborhood
       hld=V(h,:)+a*x'; % update its weight vector
       V(h,:)=hld/norm(hld); % normalize weight vector
   end % end neighborhood loop
end % end training loop

condi=zeros(nOut,nX); % zero the conditional probability matrix
for s=1:nX,  % for each input state
    x=ones(nIn,1)*bg; % set the input background activity
    x(s:s+stf*2)=ones(stf*2+1,1); % set input driven activity
    y=V*x;  % compute the output vector
    y=double(y==max(y)); % find with winning outputs
    condi(:,s)=y/sum(y); % share conditional prob among winners
end % end loop for finding conditional probability matrix
[maxprob,pref]=max(condi); % find preferred inputs for each output
pX=ones(nX,1)/nX; % find input (uniform) probability 
[hX hY mi]=infoCOMP(pX,condi) % find informational measures
% find estimated distortion
d=fsolve(@(d)log2(nX)+d*log2(d)+(1-d)*log2(1-d)-d*log2(nX-1)-mi,...
    [0.5],optimset('Display','off')); d=real(d);  


% report the input entropy and the input-output mutual information
% and the high prob output for each input state
hX
hY
mi
d
pref'











