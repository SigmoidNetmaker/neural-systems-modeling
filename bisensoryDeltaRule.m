% bisensoryDeltaRule.m
% this script trains a single sigmoidal unit to estimate 
% bisensory target probability

nIn=2; nOut=1; % set numbers of units
a=0.1; b=1.0; % set learning rate and bias
nIts=100000; % set number of iterations

mev1=4; mev0=2; % set target present and absent visual means
mea1=3; mea0=2; % set target present and absent auditory means
sdv1=1; sdv0=1;  % set target present and absent visual variances
sda1=1; sda0=1; % set target present and absent auditory variances
r1=0; r0=0; % set target present and absent correlation coefficients
pt1=1/2; pt0=1-pt1; % set target present prior
cumPrior=cumsum([pt1 pt0]); % find cumulative prior
maxVal=9; nVals=30; % set max and number of sensory input values
sVal=linspace(0,maxVal,nVals)'; % set sensory value vector

% construct target present and absent correlation matrices
C1=[sdv1,0;sda1*r1,sda1*sqrt(1-r1^2)];
C0=[sdv0,0;sda0*r0,sda0*sqrt(1-r0^2)];

V=rand(nOut,nIn+1)*2-1; % set initial connectivity matrix
deltaV=zeros(nOut,nIn+1); % zero the change weight matrix

% train network using the delta-rule
for c=1:nIts,
    % choose target present or absent at random by prior
    indxVec=find(cumPrior>=rand); choose=indxVec(1);
    if choose==1, inVA=C1*randn(2,1)+[mev1;mea1]; d=1;
    elseif choose==2, inVA=C0*randn(2,1)+[mev0;mea0]; d=0; end
    x=[inVA' b]'; % set input with bias appended
    y=1./(1+exp(-V*x)); % compute the output response
    dy=y.*(1-y); % compute derivative of squashing function
    e=d-y; % find the error for the chosen input
    g=e.*dy; % find output error signal
    deltaV=a*g*x'; % compute delta rule weight update  
    V=V+deltaV;  % apply the weight update
end % end training loop

bVec=b*ones(nVals,1); % set bias vector
Vspont=ones(nVals,1)*mev0; Aspont=ones(nVals,1)*mea0; % set spont
Inb=[sVal sVal bVec; sVal Aspont bVec; Vspont sVal bVec]; % input
Out=(1./(1+exp(-V*Inb')))'; % compute output to all inputs
Out=reshape(Out,nVals,3)'; % reshape Out into a 2D array

% compute unitMSE for output 
if max(Out(2,:)) > max(Out(3,:)),
    unitMSE=((Out(1,:)-Out(2,:))./Out(2,:))*100;
else unitMSE=((Out(1,:)-Out(3,:))./Out(3,:))*100; end
[maxunitMSE indxN]=max(unitMSE);






% compute the 2D Gaussian likelihood distributions
[vis,aud]=ndgrid(sVal); % make all visual/auditory value pairs
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

% extract both-driven and spontaneous-driven likelihoods
pvat1=diag(D2pvat1); pvat0=diag(D2pvat0); pva=diag(D2pva);
pvaSPt1=D2pvat1(:,spontAindx); pvaSPt0=D2pvat0(:,spontAindx);
pvaSP=D2pva(:,spontAindx);
pvSPat1=D2pvat1(spontVindx,:); pvSPat0=D2pvat0(spontVindx,:);
pvSPa=D2pva(spontVindx,:);

% compute posterior probabilities
pt1va=(pvat1./pva)*pt1; % both driven
pt1vaSP=(pvaSPt1./pvaSP)*pt1; % V driven, A spontaneous
pt1vSPa=(pvSPat1./pvSPa)*pt1; % A driven, V spontaneous

% compute BayesMSE as percentage of max driv/spont probability
if max(pt1vaSP) > max(pt1vSPa),
    BayesMSE=((pt1va-pt1vaSP)./pt1vaSP)*100;
else BayesMSE=((pt1va-pt1vSPa')./pt1vSPa')*100; end
[maxBayesMSE indxB]=max(BayesMSE);


% plot results
fs=14; % set font size
lw=2; % set line width
figure(1)
clf
subplot(211)
plot(sVal,pt1va,'k',sVal,pt1vaSP,'k',sVal,pt1vSPa,'k',...
    sVal,Out(1,:),'ko',sVal,Out(2,:),'ks',...
    sVal,Out(3,:),'k^','linewidth',lw)
axis([0 maxVal 0 1.1])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
ylabel('posteriors or outputs')
xlabel('visual and auditory input')
text(0.2,1,'A','fontsize',fs)
subplot(212)
plot(sVal(indxN:nVals),unitMSE(indxN:nVals),'k*')
axis([0 maxVal 0 maxunitMSE+maxunitMSE/10])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
ylabel('percentage MSE')
xlabel('visual and auditory input')
text(0.2,maxunitMSE,'B','fontsize',fs)

% show max Bayes MSE
maxBayesMSE
maxunitMSE




   