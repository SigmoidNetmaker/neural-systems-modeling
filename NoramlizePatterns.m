% script NormalizePatterns.m
% this script will normalize patterns
% stored in input pattern matrix InPat
%
[p,q]=size(InPat);
for i=1:p,
   InPat(i,:)=InPat(i,:)/norm(InPat(i,:));
end
