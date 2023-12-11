% infoCOMP.m
% this funciton takes the input probability distribution pX and
% the conditional probability table condi as arguments, and computes
% input entropy hX, output entropy hY, and mutual information mi 

function [hX hY mi] = infoCOMP(pX,condi) % declare function

[nY nX]=size(condi); % find numbers of input and output states

% compute input entropy (input information content)
log2pX=zeros(nX,1); % zero the log2 input probability vector
log2pX(find(pX~=0))=log2(pX(find(pX~=0))); % log2 of nonzeros
hX=-sum(pX.*log2pX); % compute the input entropy

% find joint and marginal probability distributions
joint=zeros(nY,nX); % zero the joint probability table
for j=1:nX, joint(:,j)=condi(:,j)*pX(j); end % compute the joint
pY=sum(joint')'; % compute marginal of the output

% compute output entropy (output information content)
log2pY=zeros(nY,1); % zero the log2 output probability vector
log2pY(find(pY~=0))=log2(pY(find(pY~=0))); % log2 of nonzeros
hY=-sum(pY.*log2pY); % compute the output entropy

% compute mutual information
pprod=pY*pX'; % compute matrix of probability products
jprat=zeros(nY,nX); % zero the ratio of joint to prob product matrix
jprat(find(pprod~=0))=joint(find(pprod~=0))./pprod(find(pprod~=0));
ljprat=zeros(nY,nX); % zero matrix for log2 of joint to prob prod ratio
ljprat(find(jprat~=0))=log2(jprat(find(jprat~=0))); % log2 of ratio
mi=sum(sum(joint.*ljprat)); % compute mutual information

