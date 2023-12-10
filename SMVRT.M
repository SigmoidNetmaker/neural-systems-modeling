% script smvrt.m
% this script will verify the tonotopic
% self-organizing feature mag;
% vf is a vector of 10 verifying frequencies
% in the range [1-2], cf and qf are central
% frequencies and qulaity factors as assigned
% previously and O is a matrix
% holding all of the outputs
%
O=zeros(10);
vf=linspace(1,2,10);
for i=1:10,
   ip=exp(-abs(cf-vf(i))/qf);
   O(i,:)=(CM*ip')';
end;