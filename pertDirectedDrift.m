% pertDirectedDrift.m
% this script trains two-layered pattern associating networks using 
% parallel weight perturbation via the directed drift algorithm;
% the initial weight matrix V and input InPat and desired output 
% DesOut patterns must be supplied in the workspace

[nPat,nIn]=size(InPat); % determine number of input units
[nPat,nOut]=size(DesOut); % determine number of output units
Out=zeros(nPat,nOut); % set up output hold array
a=0.01; % set learning rate
tol=0.1; % set error tolerance within which training is adequate
count=0; % set the iteration counter to zero
countLimit=100000; % set count limit over which training stops

Q=V*InPat'; % find the weighted input sums for all patterns
Out=1./(1+exp(-Q)); % squash to find the output for all patterns
error=sum(sum(abs(DesOut-Out'))); % initial error over all patterns

while error>tol, % while actual error is over tolerance
    Pert=a*sign(randn(nOut,nIn)); % weight perturbation matrix
    % Pert=a*randn(nOut,nIn); % weight perturbation matrix
    holdV=V; % hold the current weight matrix
    V=V+Pert; % apply perturbation of all weights in parallel
    Q=V*InPat'; % find the weighted input sum for all the patterns
    Out=1./(1+exp(-Q)); % squash to find the output for all patterns
    newErr=sum(sum(abs(DesOut-Out'))); % new error over all patterns
    if newErr>=error, % if the perturbation increases the error
        V=holdV; % then remove the weight perturbation matrix
    elseif newErr<error, % leave perturbation if it decreased error 
        error=newErr; % save new error as the error
    end % end conditional
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
% Pert=a*randn(nOut,nIn); 

        
