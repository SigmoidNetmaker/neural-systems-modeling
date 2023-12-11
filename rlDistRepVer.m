% script rlDistRepVer.m
% this script verifies pattern associating
% networks trained using reinforcement learning; 
% PI is the matrix of input patterns, 
% PO is the matrix of output patterns, 
% O is the actual output vector, H is the
% hidden unit response matrix; CH is 
% the input-hidden connectivity matrix, 
% CO is the hidden-output weight matrix;
%

% determine number patterns
[npat,dum]=size(PI);

% set output hold matrices
H=zeros(nhid,npat);
O=zeros(nout,npat);

% find hidden and output unit responses
B=b*ones(npat,1);
INb=[PI B]';
H=CH*INb;
H=1 ./(1+(exp(-H)));
Hb=[H' B]';
O=CO*Hb;
O=1 ./(1+(exp(-O)));

% show output
[PO O']
            
% plot out responses
plot(H(:,2), H(:,3), '*', O(:,2), O(:,3), '+')
axis([0 1.1 0 1.1])
xlabel('response to input 1')
ylabel('response to input 2')
title('Nonuniform Distributed Representation')
% title('Network with One Hidden Unit')


