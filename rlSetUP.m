% script rlSetUp
% this script generates input-hiddden (CH)
% and hidden-output (CO) matrices with
% normally distributed random elements for
% use with rlDistRep; nin, nhid and nout
% are the numbers of input, hidden and
% output units, respectivley
%

nin=2;
nhid=100;
nout=1;

b=1;

CH=randn(nhid,nin+1);
CO=randn(nout,nhid+1);


