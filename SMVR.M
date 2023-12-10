% script smvr.m
% this script verifies self-organized maps
% constructed with the stripped-down Kohonen;
% CM is the connectivity matrix, v is the
% state vector, P is the pattern matrix and
% O is the matrix of outputs to P
%
[p,q]=size(P);
[m,n]=size(CM);
O=zeros(p,m);
for i=1:p,
   O(i,:)=(CM*P(i,:)')';
end
O
