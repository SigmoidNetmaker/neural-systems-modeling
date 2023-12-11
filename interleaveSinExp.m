% interleaveSinExp.m
% this script trains a back-prop network on sine and exp
% and trys to learn both through interleaving
%

% set up inputs and outputs
% the range from 0 to pi is
% divided into 43 places and
% sine is computed on odd values
% and exponential on even values
nPts=43;
x=linspace(0,pi,nPts)';
sOut=sin(x);
eOut=exp(-x);
indx=1:nPts;
odd=find(rem(indx,2)~=0);
even=find(rem(indx,2)==0);
oddIn=zeros(nPts,1);
evenIn=zeros(nPts,1);
oddIn(odd)=1;
evenIn(even)=1;
fnIn=zeros(nPts,1);
fnIn(odd)=x(odd);
fnIn(even)=x(even);
InPat=[oddIn evenIn fnIn];
fnOut=zeros(nPts,1);
fnOut(odd)=sOut(odd);
fnOut(even)=eOut(even);
DesOut=fnOut;

% train with backprop
backPropTrain

% clear plot window
clf
plot(indx,DesOut,'+',indx,Out,'*')
% axis([-0.3 3.5 -0.05 1.05])
xlabel('input')
ylabel('output')
title('trying to interleave')

