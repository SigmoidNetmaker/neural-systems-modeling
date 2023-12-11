% backPropTrain.m
% this script trains a three-layered network of units
% with the squashing activation funciton to associate 
% patterns using backpropagation

a=0.25; % set the learning rate
tol=0.1; % set the tolerance
b=1; % set the bias
nIts=100000; % set the maximum number of allowed iterations
nHid=2; % set the number of hidden units
[nPat,nIn]=size(InPat); % find number of patterns and number of inputs 
[nPat,nOut]=size(DesOut); % find number of patterns and number of outputs 
V=rand(nHid,nIn+1)*2-1; % set initial input-hidden connectivity matrix
U=rand(nOut,nHid+1)*2-1; % set initial hidden-output connectivity matrix
deltaV=zeros(nHid,nIn+1); % define input-hidden change matrices
deltaU=zeros(nOut,nHid+1); % define hidden-output change matrices
maxErr=10; % set the maximum error to an initially high value

for c=1:nIts, % for each learning iteration
    pIndx=ceil(rand*nPat); % choose pattern pair at random
    d=DesOut(pIndx,:); % set desired output to chosen output
    x=[InPat(pIndx,:) b]'; % append the bias to the input vector
    y=1./(1+exp(-V*x)); % compute the hidden unit response
    y=[y' b]'; % append the bias to the hidden unit vector
    z=1./(1+exp(-U*y)); % compute the output unit response
    e=d-z'; % find the error vector
    if max(abs(e))>tol, % train if any error exceeds tolerance
        x=x';y=y';z=z'; % convert column to row vectors
        zg=e.*(z.*(1-z)); % compute the output error signal
        yg=(y.*(1-y)).*(zg*U); % compute hidden error signal
        deltaU=a*zg'*y; % compute the change in hidden-output weights
        deltaV=a*yg(1:nHid)'*x; % compute change in input-hidden weights
        U=U+deltaU; % update the hidden-output weights
        V=V+deltaV; % update the input-hidden weights
     end % end the training conditional
    if rem(c,(5*nPat))==0, % every so often check network performance
        Inb=[InPat b*ones(nPat,1)]; % append bias to all input patterns
        Hid=(1./(1+exp(-V*Inb')))'; % find hid response to all patterns
        Hidb=[Hid b*ones(nPat,1)]; % append bias to all hidden vectors
        Out=(1./(1+exp(-U*Hidb')))'; % find out response to all patterns
        maxErr=max(abs(abs(DesOut-Out))); % max error over all patterns
    end % end check conditional
    if maxErr<tol, break, end % break if all errors within tolerance
end % end training loop



[InPat DesOut Out]
V
U
c
maxErr

% return

% commands for plotting nonuniform distributed representation
% fs=18; % set font size
% lw=2; % set line width
% clf
% plot(Hid(2,:),Hid(3,:),'k*', Out(2,:),Out(3,:),'k+','markersize',8)
% hold
% plot([0 1],[0 1],'k--','linewidth',1)
% hold
% set(gca,'linewidth',lw)
% set(gca,'fontsize',fs)
% xlabel('response to input one','fontsize',fs)
% ylabel('response to input two','fontsize',fs)

% commands for pursuit/vestibular simulation
% HidPG=-(Hid(2,:)-Hid(1,:))/0.1;
% HidVG=(Hid(4,:)-Hid(1,:))/0.1;
% OutPG=-(Out(2,:)-Out(1,:))/0.1;
% OutVG=(Out(4,:)-Out(1,:))/0.1;
% clf
% plot(HidPG,HidVG,'k*', OutPG,OutVG,'k+','markersize',8)
% hold
% plot([-1.1 1.1],[-1.1 1.1],'k--','linewidth',1)
% hold
% axis([-1.1 1.1 -1.1 1.1])
% xlabel('pursuit gain')
% ylabel('vestibular gain')



   