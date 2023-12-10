function RP = hprnpt(m,n,prob)
% function RP = hprnpt(m,n,prob)
% this function will generate a set of
% m random 0-1 patterns n states long,
% with a probability prob that any 
% state will be a 1
%
RP=rand(m,n);
RP=RP<prob;
RP=double(RP);
