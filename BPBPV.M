% script bpbpv.m
% this script verifies pattern associating
% networks constructed using backpropagation;
% CH and CO are the connectivity matrices 
% connecting input and hidden to hidden and
% output units, respectivley, in, hid and out
% are input, hidden and output unit activity 
% vectors, respectively, b is bias activity,
% PI is the input pattern matrix and O and H
% are the matrices of hidden and output 
% responses to PI
%
[p,q]=size(PI);
[m,n]=size(CO);
O=zeros(p,m);
H=zeros(p,n-1);
for i=1:p,
   in=[PI(i,:) b]';
   hid=CH*in;
   hid=1 ./(1+(exp(-hid)));
   hid=[hid' b]';
   out=CO*hid;
   out=1 ./(1+(exp(-out)));
   O(i,:)=out';
   H(i,:)=(hid(1:n-1,:))';
end;

% [PI PO O]


