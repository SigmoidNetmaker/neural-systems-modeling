% info2by2.m
% this script illustrates information transmission in a 
% neural network with two input units and two output units 

px1=0.5; px2=0.5; % set input probabilities
% set network connectivity
V=[1,1;1,1]; % complete connectivity
% V=[1,1;0,1]; % almost-complete connectivity
% V=[1,0;0,1]; % identity connectivity
% V=[0,1;1,0]; % flipped-identity connectivity
% V=[1,0;0,0]; % minimal connectivity

% find network responses and set conditional probability table
thr=0.7; % set threshold
InPat=[0,0;1,0;0,1;1,1];% set input patterns
Out=zeros(4,2); % zero output array
y=zeros(2,1); % zero output vector
condi=zeros(4); % zero conditional probability matrix
for l=1:4, % for each input pattern (letter l indexes patterns)
    x=InPat(l,:)'; % set input x to next pattern
    q=V*x; % find the weighted input sum q
    y=q>thr; % find thresholded output y
    if y==[0;0], condi(1,l)=1; % output 0,0 is state one
    elseif y==[1;0], condi(2,l)=1; % output 1,0 is state two
    elseif y==[0;1], condi(3,l)=1; % output 0,1 is state three
    elseif y==[1;1], condi(4,l)=1; end % output 1,1 is state four
    Out(l,:)=y'; % save output in output array
end % end of network response and conditional probability loop

% compute the input probability distribution
pX=zeros(4,1); % zero the input probability vector
pX(1)=(1-px1)*(1-px2); % find the probability of input state one
pX(2)=px1*(1-px2); % find the probability of input state two
pX(3)=(1-px1)*px2; % find the probability of input state three
pX(4)=px1*px2; % find the probability of input state four

% compute informational measures using function infoCOMP
[hX hY mi]=infoCOMP(pX,condi);

% show the input and output matrices
InPat'
Out'

% show the conditional probability matrix
condi

% show the input entropy and the input-output mutual information
hX % input entropy
hY % output entropy
mi % input-output mutual information


