% script bpdrv.m
% this script verifies pattern associating
% networks constructed using the delta rule;
% CM is the connectivity matrix, v is the
% state vector, PI is the input pattern matrix
% and O is the matrix of actual outputs to PI
%
[p,q]=size(PI);
[m,n]=size(CM);
O=zeros(p,m);
for i=1:p,
   O(i,:)=(CM*PI(i,:)')';
   O(i,:)=1/(1+(exp(-O(i,:))));
end;


