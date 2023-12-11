% script rlTrainAllRanIn.m
% this script trains pattern associating
% networks using reinforcement learning; 
% the script is written for networks having
% only one output unit, but the method can
% be used for any number of output units;
% PI is the matrix of input patterns, 
% PO is the matrix of output patterns, 
% O is the actual output vector, CM is 
% the connectivity vector, purt is the
% weight purturbation, a is the learning 
% rate, its is the number of iterations, 
% and newerr is new error; in this version 
% all weights are purturbed at the same 
% sime; also in this version the inputs
% are presented one at a time in random
% order and weight updates are made after
% each input presentation; parameters are 
% not reset, so rerunning the algorithm 
% will pick-up where previous run left off
%
%

% determine numbers of inputs, 
% outputs, and patterns
[nout,nin]=size(CM);
[npat,nin]=size(PI);

% set output hold vector
O=zeros(npat,nout);

% set learning parameters
its=10000;
a=0.01;

% determine initial error
O=CM*PI';
O=1./(1+(exp(-O)));
error=abs(PO-O');

% trian network
for i=1:its,
    p=randperm(nin);
    in=PI(p(1),:)';
    purt=randn(nout,nin)*a;
    hold=CM;
    CM=hold+purt;
    out=CM*in;
    out=1./(1+(exp(-out)));
    newerr(p(1))=abs(PO(p(1))-out);
    if newerr(p(1))>=error(p(1)),
        CM=hold;
    elseif newerr(p(1))<error(p(1)),
        error(p(1))=newerr(p(1));
    end
end

% determine output
O=CM*PI';
O=1./(1+(exp(-O)));
[PO O']
            
        
