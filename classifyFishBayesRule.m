% ClassifyFishBayesRule.m
% this script classifies fish using Bayes Rule

% set likelihood parameters and class priors
me1=2; me2=4; me3=6; % set likelihood means
sd1=1; sd2=1; sd3=1; % set likelihood variances
pf1=1/3; pf2=1/3; pf3=1/3; % set priors (must sum to one)

% set fish lengths
maxLength=8; % set maximum fish length
nLengths=30; % set number of fish lengths
Lvec=linspace(0,maxLength,nLengths)'; % set length vector

% compute the (descretized) Gaussian likelihood densities
plf1=(1/(sd1*sqrt(2*pi)))*exp(-1/2*((Lvec-me1)/sd1).^2);
plf2=(1/(sd2*sqrt(2*pi)))*exp(-1/2*((Lvec-me2)/sd2).^2);
plf3=(1/(sd3*sqrt(2*pi)))*exp(-1/2*((Lvec-me3)/sd3).^2);
plf1=plf1/sum(plf1); % normalize
plf2=plf2/sum(plf2); % normalize
plf3=plf3/sum(plf3); % normalize

% compute unconditional probability of length (evidence)
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
plot(Lvec,pf1l,'k',Lvec,pf2l,'k',Lvec,pf3l,'k','linewidth',lw)
axis([0 maxLength 0 1.3])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
ylabel('posteriors')
xlabel('fish length')
text(0.2,1.15,'A','fontsize',fs)
text(0.6,0.85,'minnow','fontsize',fs)
text(3.4,0.6,'salmon','fontsize',fs)
text(6.3,0.85,'marlin','fontsize',fs)
subplot(212)
plot(Lvec,plf1,'k',Lvec,plf2,'k',Lvec,plf3,'k','linewidth',lw)
axis([0 maxLength 0 0.12])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
ylabel('likelihoods')
xlabel('fish length')
text(0.2,0.105,'B','fontsize',fs)
text(1.4,0.08,'minnow','fontsize',fs)
text(3.4,0.08,'salmon','fontsize',fs)
text(5.5,0.08,'marlin','fontsize',fs)




   