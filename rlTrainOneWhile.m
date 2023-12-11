% script rlTrainOneWhile.m
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
% each weight is purturbed one at a time 
% while the others are held constant; 
% parameters are not reset, so rerunning 
% the algorithm will pick-up where the 
% previous run left off
%

% determine numbers of inputs, 
% outputs, and patterns
[nout,nin]=size(CM);
[npat,nin]=size(PI);

% set output hold vector
O=zeros(npat,nout);

% set learning parameters
a=0.01;
tol=0.1;
count=0;
maxErr=10;

% make initially random 
% connectivity matrix
CM=randn(nout,nin);

% determine initial error
O=CM*PI';
O=1./(1+(exp(-O)));
error=sum(abs(PO-O'));

% trian network
while maxErr>tol,
    purt=randn*a;
    % purt=sign(randn)*a;
    wChoose=ceil(nin*rand);
    holdCM=CM(wChoose);
    CM(wChoose)=holdCM+purt;
    O=CM*PI';
    O=1./(1+(exp(-O)));
    newerr=sum(abs(PO-O'));
    if newerr>=error,
        CM(wChoose)=holdCM;
    elseif newerr<error,
        error=newerr;
    end
    O=CM*PI';
    O=1./(1+(exp(-O)));  
    maxErr=max(abs(PO-O'));
    count=count+1;
end

% determine output
O=CM*PI';
O=1./(1+(exp(-O)));
[PO O']
count




        
