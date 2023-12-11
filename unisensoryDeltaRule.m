% script unisensoryDeltaRule.m
% this script trains a single sigmoidal unit to estimate 
% unisensory target probability

nIn=1; nOut=1; % set numbers of units
a=0.1; b=1.0; % set learning rate and bias
nIts=100000; % set number of iterations

mev1=6; mev0=3; % set likelihood means
sdv1=1; sdv0=1; % set likelihood standard deviations
pt1=1/2; pt0=1-pt1; % set target present prior
cumPrior=cumsum([pt1 pt0]); % find cumulative prior
maxV=9; % set maximum visual sensory input size
nVals=30; % set number of visual sensory input values
vis=linspace(0,maxV,nVals)'; % set vector of visual inputs

V=rand(nOut,nIn+1)*2-1; % set initial connectivity matrix
deltaV=zeros(nOut,nIn+1); % zero the change weight matrix

% train network using the delta-rule
for c=1:nIts,
    % choose target present or absent at random by prior
    indxVec=find(cumPrior>=rand); choose=indxVec(1);
    if choose==1, inV=randn*sdv1+mev1; d=1;
    elseif choose==2, inV=randn*sdv0+mev0; d=0; end
    x=[inV b]'; % set input with bias appended
    y=1./(1+exp(-V*x)); % compute the output unit response
    dy=y.*(1-y); % compute the derivative of the squashing function
    e=d-y; % find the error for the chosen input
    g=e.*dy; % find output error signal
    deltaV=a*g*x'; % compute delta rule weight update  
    V=V+deltaV;  % apply the weight update
end % end training loop

% find network output 
Inb=[vis b*ones(nVals,1)]; % append bias to all visual inputs
Out=(1./(1+exp(-V*Inb')))'; % find output response to all patterns



% compute the Gaussian likelihoods distributions
pvt1=(1/(sdv1*sqrt(2*pi)))*exp(-1/2*((vis-mev1)/sdv1).^2);
pvt0=(1/(sdv0*sqrt(2*pi)))*exp(-1/2*((vis-mev0)/sdv0).^2);
pvt1=pvt1/sum(pvt1); % normalize
pvt0=pvt0/sum(pvt0); % normalize

% compute unconditional probability of the input
pv=pvt1*pt1+pvt0*pt0;

% compute the posterior probabilities
pt1v=(pvt1./pv)*pt1;
pt0v=(pvt0./pv)*pt0;

% plot results
fs=14; % set font size
lw=2; % set line width
clf
subplot(211)
plot(vis,pt1v,'k',vis,Out,'ko','linewidth',lw)
axis([0 maxV 0 1.1])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('visual input')
ylabel('posterior or output')
text(0.2,1,'A','fontsize',fs)
subplot(212)
plot(vis,pvt0,'k',vis,pvt1,'k','linewidth',lw)
axis([0 maxV 0 0.2])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
ylabel('likelihoods ')
xlabel('visual input')
text(0.2,0.18,'B','fontsize',fs)
text(2.4,0.15,'absent','fontsize',fs)
text(5.3,0.15,'present','fontsize',fs)


   