% unisensoryBayesRule.m
% this script computes unisensory target probability using Bayes Rule

% set likelihood parameters and target priors
mev1=6; mev0=3; % set target present and absent likelihood means
sdv1=1; sdv0=1; % set target present and absent likelihood SDs
pt1=1/2; pt0=1-pt1; % set target present prior

% set range of sensory input values
maxV=9; % set maximum sensory input value
nVals=30; % set number of sensory input values
vis=linspace(0,maxV,nVals); % set sensory vector

% compute the Gaussian likelihoods distributions
pvt1=(1/(sdv1*sqrt(2*pi)))*exp(-1/2*((vis-mev1)/sdv1).^2);
pvt0=(1/(sdv0*sqrt(2*pi)))*exp(-1/2*((vis-mev0)/sdv0).^2);
pvt1=pvt1/sum(pvt1); % normalize
pvt0=pvt0/sum(pvt0); % normalize

% compute unconditional probability of input (evidence)
pv=pvt1*pt1+pvt0*pt0;

% compute the posterior probabilities
pt1v=(pvt1./pv)*pt1;
pt0v=(pvt0./pv)*pt0;



% plot results
clf
subplot(211)
plot(vis,pvt0,vis,pvt1)
ylabel('visual input likelihoods')
xlabel('visual input')
subplot(212)
plot(vis,pt1v)
axis([0 maxV 0 1.1])
ylabel('target posterior probability')
xlabel('visual input')


   