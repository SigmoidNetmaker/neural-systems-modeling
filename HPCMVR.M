% script hpcmvr.m
% this script will verify learning
% in the Hopfield covarience network;
% it will initialize the network to
% 0.5 times the idx row of P, update
% 100 times and print out the idx row
% of P next to the final state of
% the network
%
idx=1;
vh=P(idx,:)';
v=vh*(0.5);
O=hpcas(v,CM,100);
% [vh O(:,10)']

[P(idx,:)' O(10,:)']
