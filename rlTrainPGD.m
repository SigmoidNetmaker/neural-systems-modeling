% script rlTrainPGD.m
% this script trains pattern associating
% networks using parallel gradient descent; 
% the script is written for networks having
% only one output unit, but the method can
% be used for any number of output units;
% PI is the matrix of input patterns, 
% PO is the matrix of output patterns, 
% O is the actual output vector, CM is 
% the connectivity vector, purt is the
% weight purturbation, psize is the fixed
% purturbation size; a is the learning 
% rate, its is the number of iterations, 
% and newerr is new error; in this version 
% all weights are purturbed at the same 
% sime; parameters are not reset, so 
% rerunning the algorithm will pick-up 
% where the previous run left off


% determine numbers of inputs, 
% outputs, and patterns
[npat,nin]=size(PI);
[npat,nout]=size(PO);

% make initially random 
% connectivity matrix
CM=rand(nout,nin);

% set output hold vector
O=zeros(npat,nout);

% set learning parameters
its=10000;
a=0.01;
psize=0.005;
tol=0.1;
maxErr=10;
count=0;

% determine initial error
O=CM*PI';
O=1./(1+(exp(-O)));
error=sum(abs(PO-O'));

% trian network
while maxErr>tol,
    purt=psize*sign(randn(nout,nin));
    CM=CM+purt;
    O=CM*PI';
    O=1./(1+(exp(-O)));
    newerr=sum(abs(PO-O'));
    delerr=newerr-error;
    delw=delerr./purt;
    CM=CM - a*delw;
    error=newerr;
    maxErr=max(error);
    count=count+1;
end

% determine output
O=CM*PI';
O=1./(1+(exp(-O)));
[PO O']
count

            
        
