% script smnp.m
% this script will normalize patterns
% stored in input pattern matrix P
%
[p,q]=size(P);
for i=1:p,
   P(i,:)=P(i,:)/norm(P(i,:));
end
