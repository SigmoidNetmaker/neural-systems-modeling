% script rlver.m
% this script verifies pattern associating
% networks constructed using reinforcement
% learning; CM is the connectivity matrix, 
% v is the state vector, PI is the input 
% pattern matrix and O is the matrix of 
% actual outputs to PI
%
[p,q]=size(PI');
[m,n]=size(CM);
O=zeros(m,q);
O=CM*PI';
O=1./(1+(exp(-O)));
O=O';
[PO O]

