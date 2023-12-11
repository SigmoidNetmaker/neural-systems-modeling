% pertGradientParallel.m
% this script trains two-layered pattern associating networks using 
% parallel weight perturbations to estimate the error gradient;
% the initial weight matrix V and input InPat and desired output 
% DesOut patterns must be supplied in the workspace

[nPat,nIn]=size(InPat); % determine number of input units
[nPat,nOut]=size(DesOut); % determine number of output units
Out=zeros(nPat,nOut); % set up output hold array
a=0.01; % set learning rate
pSize=0.005; % set perturbation size
tol=0.1; % set error tolerance within which training is adequate
count=0; % set the iteration counter to zero
countLimit=100000; % set count limit over which training stops

Q=V*InPat'; % find the weighted input sums for all patterns
Out=1./(1+exp(-Q)); % squash to find the output for all patterns
error=sum(sum(abs(DesOut-Out'))); % initial error over all patterns

while error>tol, % while actual error is over tolerance
    Pert=pSize*sign(randn(nOut,nIn)); % parallel weight perturbation
    % Pert=pSize*randn(nOut,nIn); % parallel weight perturbation
    V=V+Pert; % apply perturbation of all weights in parallel
    Q=V*InPat'; % find the weighted input sum for all the patterns
    Out=1./(1+exp(-Q)); % squash to find the output for all patterns
    newErr=sum(sum(abs(DesOut-Out'))); % new error over all patterns
    delErr=newErr-error; % find change in error due to perturbation
    estGrad=delErr./Pert; % compute matrix of estimated gradients 
    deltaV=-a*estGrad; % compute matrix of weight changes
    V=V+deltaV; % apply weight change matrix to weight matrix
    error=newErr; % save new error as the error
    count=count+1; % increment the counter
    if count>countLimit, break, end % break if counter over limit
end % end training loop


Q=V*InPat'; % find the weighted input sums for all patterns
Out=1./(1+exp(-Q)); % squash to find the output for all patterns
[DesOut Out'] % show desired and actual output after training
V % show connectivity matrix
count % show number of training iterations


% replace the first statement of the while loop with the following
% statment to test performance with variable size perturbation
% Pert=pSize*randn(nOut,nIn);
            
        
