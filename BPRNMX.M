% script bprnmx
% this script generates input-hiddden (CH)
% and hidden-output (CO) matrices with
% random elements between -1 and +1,
% for use with bpbpt.m;  ni, nh and no
% are the numbers of input, hidden and
% output units, respectivley
%

% ni=2;
% nh=2;
% no=1;

CH=rand(nh,ni+1)-(ones(nh,ni+1)*0.5);
CH=CH*2;
CO=rand(no,nh+1)-(ones(no,nh+1)*0.5);
CO=CO*2;


