% info1byN.m
% this script computes mutual information between one input unit and 
% N output units with a stochastic input-output relationship

nOut=25; % set the number of output units
px1=0.5; % set probability that input unit is one
px0=1-px1; % find probability that input unit is zero
py0x0=0.8; % set conditional prob of output 0 given input 0
py1x1=0.8; % set conditional prob of output 1 given input 1
py1x0=1-py0x0; % find conditional prob of output 1 given input 0
py0x1=1-py1x1; % find conditional prob of output 0 given input 1

% find the conditional probability of output given input
nY=2^nOut; % compute number of output states 
pyx0=1; % start off prob y given x0 vector at one
pyx1=1; % start off prob y given x1 vector at one
for i=1:nOut, % for as many iterations as output units
    pyx0=kron([py0x0 py1x0],pyx0); % kronecker for x0
    pyx1=kron([py0x1 py1x1],pyx1); % kronecker for x1
end  % end loop for conditional output given input probability
condi=[pyx0' pyx1']; % assemble conditional probability table

% compute input probability distribution and info measures
pX=[px0;px1]; % assemble input probability distribution
[hX hY mi]=infoCOMP(pX,condi);




% show the input entropy and the input-output mutual information
% condi
% joint 
hX % input entropy
hY % output entropy
mi % input-output mutual information








