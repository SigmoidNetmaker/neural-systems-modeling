% pbnDeltaRule.m
% this script uses the delatRule to train a single unit with a 
% feedback connection to simulate the responses of PBN neurons
% (note: this script runs predictCorrectSetUp first)

predictCorrectSetUp % run predictCorrectSetUp
nUnit=1; % set number of units (one in this case)
nIn=nSpace+2; % number of inputs (all SSC, one DSC, one bias)
a=0.1; % set learning rate
b=1; % set bias input to unit
nIts=20000; % set number of training iterations 
SACstart=40; % set saccade start position
lightInt=200; % set light flip interval for training

% train while simulating close-order tracking
M=0.2*(rand(nUnit,nIn+nUnit)-0.5); % random initial weight matrix
TposHld=zeros(1,nIts); % zero target position hold vector
SSChld=zeros(1,nIts); % zero SSC response hold vector
xSSC=zeros(nSpace,1); % zero the input from SSC
Tpos=0; SSC=0; DSC=0; y=0; d=0; % zero initial values
z=[b;xSSC;DSC;y]; % set initial state vector
lightFlip=1; % set light flag to begin training on lit target
for t=1:nIts, % for each training cycle
    TposHld(t)=Tpos; % save current target position
    SSChld(t)=SSC; % save current SSC input value
    q=M*z; % find weighted input to hidden and output units
    y=1./(1+exp(-q)); % squash responses of hid and out
    e=d-y; % compute error
    dSquash=y*(1-y); % derivative of squash
    deltaM=a*e*dSquash*z'; % find delta M
    M=M+deltaM; % update the connectivity matrix
    if rem(t,lightInt)==0, lightFlip=1-lightFlip; end % lit/unlit
    if Tpos>=SACstart, % if a resetting saccade is to be made,
        Tpos=0; SSC=0; DSC=1; % reset target and SC
        xSSC=zeros(nSpace,1); % reset SSC input vector to zero
    else   % otherwise advance target according to P(T(t)|T(t-1))
        pT=pTTpre(:,Tpos+shift); % find shifted prior
        cpT=cumsum([0 pT']); % compute the cumulative prior
        indxVec=find(cpT<=rand); % generate random deviate
        Tpos=indxVec(length(indxVec)); % find actual target position
        if Tpos<nSpace/3, Tpos=nSpace; end % keep target in bounds
        Tpos=Tpos-shift; % take account of shift about zero
        SSC=0; xSSC=zeros(nSpace,1); DSC=0; % zero SSC and DSC 
        if lightFlip==1, % if the target is lit
            pVT=pVTon(:,Tpos+shift); % find shifted likelihood
            cpVT=cumsum([0 pVT']); % compute cumulative likelihood
            indxVec=find(cpVT<=rand); % generate random deviate
            SSCindx=indxVec(length(indxVec)); % actual active SSC unit
            if SSCindx<nSpace/3, SSCindx=nSpace; end % bounded
            SSC=SSCindx-shift; % take account of shift
            xSSC(SSCindx)=1; % set SSC input vector
        end % end target lit conditional
    end % end tracking loop
    z=[b;xSSC;DSC;y]; % reset state vector
    if Tpos>=CellPrefT, d=1; % set desired output to one
    else d=0; end % or set desired output to zero
end % end training loop

% following training, find pbn network responses for a lit target
xSSC=zeros(nSpace,1); DSC=0; y=0; % zero initial values
pbnCellOn=zeros(nTpos,nUnit); % zero response hold vector
for t=1:nTpos, % step through target positions in testing range
    Tpos=TposVec(t); % set next target position
    SSC=Tpos; % for testing SSC value equals target position
    SSCindx=SSC+shift; % take shift into account
    xSSC=zeros(nSpace,1); % zero SSC vector
    xSSC(SSCindx)=1; % set element of SSC input vector
    z=[b;xSSC;DSC;y]; % reset state vector
    q=M*z; y=1./(1+exp(-q)); % compute output and squash it
    pbnCellOn(t,:)=y; % store y output
end % end lit target testing loop



% find pbn network responses for target that blinks off
xSSC=zeros(nSpace,1); DSC=0; y=0; % zero initial values
pbnCellOff=zeros(nTpos,nUnit); % zero response hold vector
for t=1:nTpos, % step through target positions in testing range
    Tpos=TposVec(t); % set next target position
    if t>=lightOff & t<=lightOn, % if target is unlit
        SSC=0; xSSC=zeros(nSpace,1); % set SSC input to zero
    else SSC=Tpos; % else set SSC value equal to target position
        SSCindx=SSC+shift; % take account of shift
        xSSC=zeros(nSpace,1); % zero the SSC input vector
        xSSC(SSCindx)=1; % set element of SSC input vector
    end % end lit/unlit conditional
    z=[b;xSSC;DSC;y]; % reset state vector
    q=M*z; y=1./(1+exp(-q)); % compute output and squash it
    pbnCellOff(t,:)=y; % store y output
end % end target blink off testing loop

% remove feedback and/or bias
mNoF=M;
mNoF(164)=0; % remove feedback
mNoF(1)=0; % remove bias

% find pbn responses without feedback for a lit target
xSSC=zeros(nSpace,1); DSC=0; y=0; % zero initial values
pbnCellOnNoF=zeros(nTpos,nUnit); % zero response hold vector
for t=1:nTpos, % step through target positions in testing range
    Tpos=TposVec(t); % set next target position
    SSC=Tpos; % for testing SSC value equals target position
    SSCindx=SSC+shift; % take shift into account
    xSSC=zeros(nSpace,1); % zero SSC vector
    xSSC(SSCindx)=1; % set element of SSC input vector
    z=[b;xSSC;DSC;y]; % reset state vector
    q=mNoF*z; % compute output
    y=1./(1+exp(-q)); % squash output
    pbnCellOnNoF(t,:)=y; % store y output
end % end lit target testing loop

% find pbn responses without feedback for target that blinks off
xSSC=zeros(nSpace,1); DSC=0; y=0; % zero initial values
pbnCellOffNoF=zeros(nTpos,nUnit); % zero response hold vector
for t=1:nTpos, % step through target positions in testing range
    Tpos=TposVec(t); % set next target position
    if t>=lightOff & t<=lightOn, % if target is unlit
        SSC=0; xSSC=zeros(nSpace,1); % set SSC input to zero
    else SSC=Tpos; % else set SSC value equal to target position
        SSCindx=SSC+shift; % take account of shift
        xSSC=zeros(nSpace,1); % zero the SSC input vector
        xSSC(SSCindx)=1; % set element of SSC input vector
    end % end lit/unlit conditional
    z=[b;xSSC;DSC;y]; % reset state vector
    q=mNoF*z; % compute output
    y=1./(1+exp(-q)); % squash output
    pbnCellOffNoF(t,:)=y; % store y output
end % end target blink off testing loop

% shift CellPrefT
CellPrefT=CellPrefT+shift; 

% find target posteriors for a series 
% target displacements in the light
% set hold vectors
prob=zeros(1,nTpos);
% set initial values of target position, target prediction,
% estimated target position and pervious estimate
Tpos=0;
Test=0;
pTV=ones(nSpace,1)/nSpace;
% move target and compute position estimates
for t=1:nTpos,
    pT=pTTpre*pTV; % find new prior (prediction)
    pVT=pVTon(:,Tpos+shift);
    pV=pVT'*pT;  % compute unconditional probability (evidence)
    pTV=pVT/pV.*pT;  % compute target posterior probability
    [maxpTV,Test]=max(pTV); % take new estimate as max posterior
    Test=Test-shift;  % take account of shift about zero
    pTVcellShift=circshift(pTV,-CellPrefT);  % shift posterior
    prob(t)=sum(pTVcellShift(1:round(nSpace/2-1))); % pbn
    Tpos=Tpos+1;   % advance target
end
probOn=prob;

% find target posteriors for a lighted target that goes off
prob=zeros(1,nTpos); % set PBN cell response hold vector
Tpos=0; % start the target at zero position
Test=0; % zero the target position estimate
pTV=ones(nSpace,1)/nSpace;
for t=1:nTpos, % for each target position
    pT=pTTpre*pTV; % find new prior (prediction)
    if t>=lightOff & t<=lightOn,  % lights out interval
        pVT=pVToff; % shift "off" likelihood 
    else pVT=pVTon(:,Tpos+shift); end % shift "on" likelihood 
    pV=pVT'*pT;  % compute unconditional probability (evidence)
    pTV=pVT/pV.*pT;  % compute target posterior probability
    [maxpTV,Test]=max(pTV); % take new estimate as max posterior
    Test=Test-shift;  % take account of shift about zero
    pTVcellShift=circshift(pTV,-CellPrefT); % shift posterior
    prob(t)=sum(pTVcellShift(1:round(nSpace/2-1))); % pbn
    Tpos=Tpos+1;   % advance target by one space unit
end % end target off loop
probOff=prob;

% set vector of training cycles
tsteps=1:nIts;  
% adjust light times
lightOff=lightOff-2;
lightOn=lightOn-1;

% plot tracking
figure(1)
CellPrefT=CellPrefT-shift; 
clf
plot(tsteps(1:100),TposHld(1:100),'k','linewidth',2)
hold
plot(tsteps(1:100),SSChld(1:100),'ko','linewidth',2)
plot(tsteps(1:100),ones(1,100)*CellPrefT,'k--','linewidth',2)
hold
legend('target position','SSC observation',...
    'PBN preference',4)
xlabel('time step','fontsize',14)
ylabel('target position','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

% plot out weights and responses
figure(2)
clf
subplot(211)
plot(82:112,M(82:112),'k*','linewidth',2)
axis([82 112 -1.5 1.5])
set(gca,'xtick',[82 87 92 97 102 107 112])
xlabel('connection weight number','fontsize',14)
ylabel('weight value','fontsize',14)
text(82.65,1.15,'A','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)
subplot(212)
plot(TposVec,pbnCellOn(:,nUnit),'k',...
    TposVec,pbnCellOff(:,nUnit),'k--',...
    TposVec,probOn,'ko',...
    TposVec,probOff,'kx',...
    [lightOff,lightOff],[-0.1,1.1],'k-.',...
    [lightOn,lightOn],[-0.1,1.1],'k-.',...
    'linewidth',2)
axis([0 nTpos-1 -0.1 1.1])
legend('lit unit','unlit unit','lit prob','unlit prob',4)
xlabel('target position (space units)','fontsize',14)
ylabel('PBN response','fontsize',14)
text(11.5,0.1,'unlit interval','fontsize',14)
text(0.65,0.97,'B','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

% plot responses with and without feedback
figure(3)
clf
plot(TposVec,pbnCellOn(:,nUnit),'r',...
    TposVec,pbnCellOff(:,nUnit),'g',...
    TposVec,pbnCellOnNoF(:,nUnit),'c',...
    TposVec,pbnCellOffNoF(:,nUnit),'b',...
    [lightOff,lightOff],[-0.1,1.1],'k-.',...
    [lightOn,lightOn],[-0.1,1.1],'k-.')
axis([0 nTpos-1 -0.1 1.1])
legend('lit','unlit','lit noF','unlit noF',4)
xlabel('target position (space units)','fontsize',14)
ylabel('PBN response','fontsize',14)
text(11.5,0.1,'unlit interval','fontsize',14)

