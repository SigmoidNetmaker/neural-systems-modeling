% script rlTrainAll.m
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
% sime; parameters are not reset, so 
% rerunning the algorithm will pick-up 
% where the previous run left off
%
%

% rerandomize CM here sometimes
% CM=rand(1,4)

% determine numbers of inputs, 
% outputs, and patterns
[nout,nin]=size(CM);
[npat,nin]=size(PI);

% set output hold vector
O=zeros(npat,nout);

% set learning parameters
its=5000;
a=0.01;

% determine initial error
O=CM*PI';
O=1./(1+(exp(-O)));
error=sum(abs(PO-O'));

% trian network
for i=1:its,
    purt=randn(nout,nin)*a;
    holdCM=CM;
    CM=holdCM+purt;
    O=CM*PI';
    O=1./(1+(exp(-O)));
    newerr=sum(abs(PO-O'));
    if newerr>=error,
        CM=holdCM;
    elseif newerr<error,
        error=newerr;
    end
end

% determine output
O=CM*PI';
O=1./(1+(exp(-O)));
[PO O']
            
CM
        
