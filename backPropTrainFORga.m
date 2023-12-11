% backPropTrainFORga.m
% this script trains a three-layered network of sigmoidal units
% to associate patterns using back-propagation;
% note, this version is for training with gaHidden

a=0.1; % set learning rate
b=1; % set bias
tol=0.1; % set tolerance
V=rand(nHid,nIn+1)*2-1; % set initial input-hidden connectivity matrix
U=rand(nOut,nHid+1)*2-1; % set initial hidden-output matrix
deltaV=zeros(nHid,nIn+1); % define change weight in-hid matrix
deltaU=zeros(nOut,nHid+1); % define change weight hid-out matrix
maxErr=10; % set the maximum error to an initially high value

for c=1:maxIts, % for each learning iteration
    pindx=ceil(rand*nPat); % choose an input pattern at random
    x=[InPat(pindx,:) b]'; % append the bias to the input vector
    y=1 ./(1+(exp(-V*x))); % compute the hidden unit response
    y=[y' b]'; % append the bias to the hidden unit vector
    z=1 ./(1+(exp(-U*y))); % compute the output unit response
    e=DesOut(pindx,:)-(z'); % find the error vector
    if max(abs(e))>tol, % train if any error exceeds tolerance
        x=x';y=y';z=z'; % convert column to row vectors
        zg=(z.*(1-z)).*e; % compute the output gradient
        deltaU=a*zg'*y; % compute the change in hidden-output weights
        yg=(y.*(1-y)).*(zg*U); % compute the hidden gradient
        deltaV=a*yg(1:nHid)'*x; % change in input-hidden weights
        U=U+deltaU; V=V+deltaV; % update the hid-out and in-hid weights
    end % end the training conditional
    if rem(c,(5*nPat))==0, % every so often check network performance
        Inb=[InPat b*ones(nPat,1)]; % append bias to all input patterns
        Hid=(1./(1+exp(-V*Inb')))'; % find hid response to all patterns
        Hidb=[Hid b*ones(nPat,1)]; % append bias to all hidden vectors
        Out=(1./(1+exp(-U*Hidb')))'; % out response to all patterns
        maxErr=max(abs(abs(DesOut-Out))); % max error over all patterns
    end % end check conditional
    if maxErr<tol, break, end % break if all errors within tolerance
end % end training loop


   