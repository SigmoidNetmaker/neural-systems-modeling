% infoMax2by2.m
% this script trains a simple 2-by-2 input-output network
% using the Bell/Sejnowski infomax algorithm

px1=0.5; px2=0.5; % set input probabilities
thr=0.51; % set threshold 
nSam=3000; % set number of samples
a=0.01; % set learning rate
sam=zeros(2,nSam); % zero the input sample array
sam(1,:)=rand(1,nSam)<px1; % generate input one samples
sam(2,:)=rand(1,nSam)<px2; % generate input two samples
InPat=[0,0;1,0;0,1;1,1]; % set input patterns
V=rand(2); % initialize x to y weights
b=rand(2,1); % initialize bias vector

% find responses and set conditional prob Before training
y=zeros(2,1); % zero output vector
outBefore=zeros(4,2); % zero output array
condiB=zeros(4); % zero conditional probability table
for l=1:4, % for each input state (pattern)
    x=InPat(l,:)'; % set the input from patterns
    q=V*x+b; % compute the weighed input sum
    y=1./(1+exp(-q)); % squash the sum to find output
    y=y>thr; % threshold the output for comparison
    if y==[0;0], condiB(1,l)=1; % output 0,0 is state one
    elseif y==[1;0], condiB(2,l)=1; % output 1,0 is state two
    elseif y==[0;1], condiB(3,l)=1; % output 0,1 is state three
    elseif y==[1;1], condiB(4,l)=1; end % output 1,1 is state four
    outBefore(l,:)=y';  % save output in output array
end % end of network response and conditional probability loop

% train weights using the Bell-Sejnowski algorithm
for c=1:nSam, % for every learning cycle
   x=sam(:,c); % set the input from training samples
   q=V*x+b; % compute the weighed input sum
   y=1./(1+exp(-q)); % squash the sum to find output
   delV=a*(inv(V')+(1-2*y)*x'); % compute x-y weight updates
   delb=a*(1-2*y);  % compute bias updates
   V=V+delV;  % update x-y weights
   V(find(V<0))=0; % remove negative x-y weights
   b=b+delb; % update bias vector
end  % end training loop

% find responses and set conditional prob after training
y=zeros(2,1); % zero output vector
out=zeros(4,2); % zero output array
condi=zeros(4); % zero conditional probability table
for l=1:4, % for each input state (pattern)
    x=InPat(l,:)'; % set the input from patterns
    q=V*x+b; % compute the weighed input sum
    y=1./(1+exp(-q)); % squash the sum to find output
    y=y>thr; % threshold the output for comparison
    if y==[0;0], condi(1,l)=1; % output 0,0 is state one
    elseif y==[1;0], condi(2,l)=1; % output 1,0 is state two
    elseif y==[0;1], condi(3,l)=1; % output 0,1 is state three
    elseif y==[1;1], condi(4,l)=1; end % output 1,1 is state four
    out(l,:)=y'; % save output in output array
end % end of network response and conditional probability loop

% compute input probability distribution and info measures
pX=zeros(4,1);
pX(1)=(1-px1)*(1-px2); pX(2)=px1*(1-px2);
pX(3)=(1-px1)*px2; pX(4)=px1*px2;
[hX hY mi]=infoCOMP(pX,condi);


% find info measures for before training
[hXB hYB miB]=infoCOMP(pX,condiB);

% print out weights
V
b

% print out input and output patterns
InPat'
outBefore'
out'

% print out input and output entropy 
% and input-output mutual information
hX
[hYB hY]
[miB mi]


