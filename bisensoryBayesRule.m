% bisensoryBayesRule.m
% this script computes bisensory target probability using Bayes Rule

mev1=4; mev0=2; % set target present and absent visual means
mea1=3; mea0=2; % set target present and absent auditory means
sdv1=1; sdv0=1;  % set target present and absent visual SDs
sda1=1; sda0=1; % set target present and absent auditory SDs
r1=0; r0=0; % set target present and absent correlation coefficients
pt1=1/2; pt0=1-pt1; % set target present prior
maxVal=9; nVals=30; % set max and number of sensory input values
sVal=linspace(0,maxVal,nVals); % set sensory value vector
[vis,aud]=ndgrid(sVal); % make all visual/auditory value pairs

% compute the 2D Gaussian likelihood distributions
D2pvat1=(1/(2*pi*sdv1*sda1*sqrt(1-r1^2)))* ...
    exp(-(1/(2*(1-r1^2)))*(((vis-mev1)/sdv1).^2 - ...
    2*r1*(((vis-mev1)/sdv1).*((aud-mea1)/sda1))+((aud-mea1)/sda1).^2));
D2pvat0=(1/(2*pi*sdv0*sda0*sqrt(1-r0^2)))*...
    exp(-(1/(2*(1-r0^2)))*(((vis-mev0)/sdv0).^2 - ...
    2*r0*(((vis-mev0)/sdv0).*((aud-mea0)/sda0))+((aud-mea0)/sda0).^2));
D2pvat1=D2pvat1/sum(sum(D2pvat1)); % normalize
D2pvat0=D2pvat0/sum(sum(D2pvat0)); % normalize

% compute unconditional probability (evidence) of V and A
D2pva=D2pvat1*pt1+D2pvat0*pt0;

% find closest spontaneous mean indices into 2D distributions
indices=find(sVal>=mev0); spontVindx=indices(1);
indices=find(sVal>=mea0); spontAindx=indices(1);

% extract cross-modal and modality-specific likelihoods
pvat1=diag(D2pvat1); pvat0=diag(D2pvat0); pva=diag(D2pva);
pvaSPt1=D2pvat1(:,spontAindx); pvaSPt0=D2pvat0(:,spontAindx);
pvaSP=D2pva(:,spontAindx);
pvSPat1=D2pvat1(spontVindx,:); pvSPat0=D2pvat0(spontVindx,:);
pvSPa=D2pva(spontVindx,:);

% compute posterior probabilities
pt1va=(pvat1./pva)*pt1; % cross-modal
pt1vaSP=(pvaSPt1./pvaSP)*pt1; % visual-specific
pt1vSPa=(pvSPat1./pvSPa)*pt1; % auditory-specific

% compute BayesMSE as percentage of max driv/spont probability
if max(pt1vaSP) > max(pt1vSPa),
    BayesMSE=((pt1va-pt1vaSP)./pt1vaSP)*100;
else BayesMSE=((pt1va-pt1vSPa')./pt1vSPa')*100; end
[maxBayesMSE indxB]=max(BayesMSE);





% plot results
clf
subplot(211)
plot(sVal,pt1va,'k',sVal,pt1vaSP,'r',sVal,pt1vSPa,'g')
axis([0 maxVal 0 1.1])
ylabel('target posterior probability')
xlabel('visual and auditory input')
subplot(212)
plot(sVal(indxB:nVals),BayesMSE(indxB:nVals),'o')
axis([0 maxVal 0 maxBayesMSE+maxBayesMSE/10])
ylabel('percentage MSE')
xlabel('visual and auditory input')

% show max Bayes MSE
maxBayesMSE



