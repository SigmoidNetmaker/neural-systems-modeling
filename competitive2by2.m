% competitive2by2.m
% this script trains a simple 2-by-2 input-output network
% using competitive, unsupervised learning

px1=0.5; px2=0.5; % set input probabilities
thr=0.7; % set threshold 
nIts=1000; % set number of training iterations
a=1; % set learning rate
InPat=[0,0;1,0;0,1;1,1]; % set input patterns
V=rand(2); % initialize x to y weights

% find responses and set conditional prob before training
y=zeros(2,1); % zero output vector
outBefore=zeros(4,2); % zero output array
condiB=zeros(4); % zero conditional probability table
for l=1:4, % for each input state (pattern)
    x=InPat(l,:)'; % set the input from patterns
    q=V*x; % compute the weighed input sum
    y=q>thr; % threshold the weighted input sum
    if y==[0;0], condiB(1,l)=1; % output 0,0 is state one
    elseif y==[1;0], condiB(2,l)=1; % output 1,0 is state two
    elseif y==[0;1], condiB(3,l)=1; % output 0,1 is state three
    elseif y==[1;1], condiB(4,l)=1; end % output 1,1 is state four
    outBefore(l,:)=y';  % save output in output array
end % end of network response and conditional probability loop

% train weights
for c=1:nIts, % for each training iteration
   x=[rand<px1; rand<px2]; % set the input
   y=V*x; % find the output
   [winVal,winIndx]=max(y); % find the winning output
   hld=V(winIndx,:)+a*x'; % update winner's weights
   V(winIndx,:)=hld/norm(hld); % normalize
end % end competitive training loop

% find responses and set conditional prob after training
y=zeros(2,1); % zero output vector
out=zeros(4,2); % zero output array
condi=zeros(4); % zero conditional probability table
for l=1:4, % for each input state (pattern, indexed by letter l)
    x=InPat(l,:)'; % set the input from patterns
    q=V*x; % compute the weighed input sum
    y=q>thr; % threshold the weighted input sum
    if y==[0;0], condi(1,l)=1; % output 0,0 is state one
    elseif y==[1;0], condi(2,l)=1; % output 1,0 is state two
    elseif y==[0;1], condi(3,l)=1; % output 0,1 is state three
    elseif y==[1;1], condi(4,l)=1; end % output 1,1 is state four
    out(l,:)=y';  % save output in output array
end % end of network response and conditional probability loop

% compute input probability distribution and info measures
pX=zeros(4,1);
pX(1)=(1-px1)*(1-px2); pX(2)=px1*(1-px2);
pX(3)=(1-px1)*px2; pX(4)=px1*px2;
[hX hY mi]=infoCOMP(pX,condi);


% compute info measures before training
[hX hYB miB]=infoCOMP(pX,condiB);

% print out weights
V

% print out input and output patterns
InPat'
outBefore'
out'

% print out input and output entropy 
% and input-output mutual information
hX
[hYB hY]
[miB mi]

