% classifyFishBackProp.m
% this script uses back-prop to train a network to classify fish

nIn=1; nHid=12; nOut=3; % set numbers of units
a=0.1; b=1; % set learning rate and bias
nIts=100000; % set number of training iterations 
me1=2; me2=4; me3=6; % set likelihood means
sd1=1; sd2=1; sd3=1; % set likelihood standard deviations
pf1=1/3; pf2=1/3; pf3=1/3; % set priors 
cumPrior=cumsum([pf1 pf2 pf3]); % find cumulative prior
maxLength=8; nLengths=30; % set max and number of fish lengths
Lvec=linspace(0,maxLength,nLengths)'; % length vector for testing
V=rand(nHid,nIn+1)*2-1; % set initial input-hidden weight matrix
U=rand(nOut,nHid+1)*2-1; % set initial hidden-output  matrix
deltaV=zeros(nHid,nIn+1); % define weight change matrix for V
deltaU=zeros(nOut,nHid+1); % define weight change matrix for U

for c=1:nIts, % for each iteration
    % choose a fish type at random according to prior distribution
    indxVec=find(cumPrior>=rand); choose=indxVec(1);
    if choose==1, lFish=randn*sd1+me1; d=[1 0 0];
    elseif choose==2, lFish=randn*sd2+me2; d=[0 1 0];
    elseif choose==3, lFish=randn*sd3+me3; d=[0 0 1]; end
    % update the states of the units and compute network error
    x=[lFish b]'; % set the input
    y=1./(1+(exp(-V*x))); y=[y' b]'; % compute hidden, append bias
    z=1./(1+(exp(-U*y))); % compute the output unit response
    e=d-z'; % find the error
    % train the network weights using back-propagation
    x=x';y=y';z=z'; % convert column to row vectors
    zg=(z.*(1-z)).*e; % compute the output error signal
    deltaU=a*zg'*y; % compute the change in hidden-output weights
    yg=(y.*(1-y)).*(zg*U); % compute the hidden error signal
    deltaV=a*yg(1:nHid)'*x; % compute change in input-hidden weights
    U=U+deltaU; V=V+deltaV; % update the hid-out and in-hid weights
end % end training loop

% find final unit responses
Inb=[Lvec b*ones(nLengths,1)]; % append bias to all input patterns
Hid=(1./(1+exp(-V*Inb')))'; % find hid response to all patterns
Hidb=[Hid b*ones(nLengths,1)]; % append bias to all hidden vectors
Out=(1./(1+exp(-U*Hidb')))'; % find out response to all patterns


 
 
 
% compute the (descretized) Gaussian likelihood densities
plf1=(1/(sd1*sqrt(2*pi)))*exp((-1/2)*((Lvec-me1)/sd1).^2);
plf2=(1/(sd2*sqrt(2*pi)))*exp((-1/2)*((Lvec-me2)/sd2).^2);
plf3=(1/(sd3*sqrt(2*pi)))*exp((-1/2)*((Lvec-me3)/sd3).^2);
plf1=plf1/sum(plf1); % normalize
plf2=plf2/sum(plf2); % normalize
plf3=plf3/sum(plf3); % normalize

% compute unconditional probability of length
pl=plf1*pf1+plf2*pf2+plf3*pf3;

% compute posterior probabilities
pf1l=(plf1./pl)*pf1;
pf2l=(plf2./pl)*pf2;
pf3l=(plf3./pl)*pf3;

% plot results
fs=14; % set font size
lw=2; % set line width
clf
subplot(211)
plot(Lvec,pf1l,'k',Lvec,pf2l,'k',Lvec,pf3l,'k',...
    Lvec,Out(:,1),'k^',Lvec,Out(:,2),'ks',Lvec,Out(:,3),'ko',...
    'linewidth',lw,'markersize',8)
axis([0 maxLength 0 1.3])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
ylabel('output responses')
xlabel('fish length')
text(0.2,1.16,'A','fontsize',fs)
subplot(212)
plot(Lvec,Hid,'k','linewidth',lw)
axis([0 maxLength 0 1.3])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
ylabel('hidden responses')
xlabel('fish length')
text(0.2,1.15,'B','fontsize',fs)




   