% script bphpv.m
% this script verifies pattern associating
% Hopfield networks constructed using bphpt.m;
% CM is the connectivity matrix, v is the
% state vector, PI is the input pattern matrix
% and O is the matrix of actual outputs to PI
%
[p,q]=size(PI);
[m,n]=size(CM);
O=zeros(p,m);
for i=1:p,
   O(i,:)=(CM*PI(i,:)')';
end;
O=O>1;
[PI PO O]


% more elegant alternative
O2=zeros(p,m);
O2=(CM*PI')';
O2=O2>1;
[PI PO O2]


