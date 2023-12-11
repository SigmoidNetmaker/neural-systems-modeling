% script rltrain.m
% this script trains pattern associating
% networks using reinforcement learning; 
% the script works for networks having
% only one output unit;
% PI is the matrix of input patterns, 
% PO is the matrix of output patterns, 
% O is the actual output vector, CM is 
% the connectivity vector, v is the 
% state vector, itn is the number of 
% iterations, a is 
% the learning rate,
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
its=1000;
a=0.01;

% determine initial error
O=CM*PI';
O=1./(1+(exp(-O)));
error=sum(abs(PO-O'));

% trian network
for i=1:its,
    for j=1:nin,
        purt=randn*a;
        hold=CM(j);
        CM(j)=hold+purt;
        O=CM*PI';
        O=1./(1+(exp(-O)));
        newerr=sum(abs(PO-O'));
        if newerr>=error,
            CM(j)=hold;
        elseif newerr<error,
            error=newerr;
        end
    end
end

% determine output
O=CM*PI';
O=1./(1+(exp(-O)));
[PO O']
            
        
