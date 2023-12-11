% pbnPredictCorrect.m
% this script implements a predictor-corrector model of PBN neurons
% as they respond to a moving visual stimulus that stays illuminated
% or that is un-illuminated during its motion
% (note: this script runs predictCorrectSetUp first)

predictCorrectSetUp % run predictCorrecSetUP
CellPrefT=CellPrefT+shift; % shift PBN cell preferred T position

% find target posteriors for a lighted target that stays on
TposHld=zeros(1,nTpos); % set target position hold vector
TestHldOn=zeros(1,nTpos); % set target estimate hold vector
pbnCellOn=zeros(1,nTpos); % set PBN cell response hold vector
Tpos=0; % start the target at zero position
Test=0; % zero the target position estimate
pTV=ones(nSpace,1)/nSpace; % set posterior to uniform initially
for t=1:nTpos, % for each time step
    pT=pTTpre*pTV; % find new prior (prediction)
    pVT=pVTon(:,Tpos+shift); % get likelihood at current target
    pV=pVT'*pT;  % compute unconditional probability (evidence)
    pTV=pVT/pV.*pT;  % compute target posterior probability
    [maxpTV,Test]=max(pTV); % take new estimate as max posterior
    Test=Test-shift;  % take account of shift about zero
    pTVcellShift=circshift(pTV,-CellPrefT); % shift posterior
    pbnCellOn(t)=sum(pTVcellShift(1:round(nSpace/2-1))); % pbn
    TposHld(t)=Tpos;   % save target position
    TestHldOn(t)=Test;   % save estimate for lights on
    Tpos=Tpos + 1;   % advance target one space unit per time step
end % end target on loop

% find target posteriors for a lighted target that goes off
TestHldOff=zeros(1,nTpos); % set target estimate hold vector
pbnCellOff=zeros(1,nTpos); % set PBN cell response hold vector
pTVseriesOff=zeros(nSpace,nTpos); % zero prediction series matrix
Tpos=0; % start the target at zero position
Test=0; % zero the target position estimate
pTV=ones(nSpace,1)/nSpace; % set posterior to uniform initially
for t=1:nTpos, % for each time step
    pT=pTTpre*pTV; % find new prior (prediction)
    if t>=lightOff & t<=lightOn,  % lights out interval
        pVT=pVToff; % set to "off" likelihood 
    else pVT=pVTon(:,Tpos+shift); end % set to "on" likelihood 
    pV=pVT'*pT;  % compute unconditional probability (evidence)
    pTV=pVT/pV.*pT;  % compute target posterior probability
    pTVseriesOff(:,t)=pTV; % save prediction in series matrix
    [maxpTV,Test]=max(pTV); % take new estimate as max posterior
    Test=Test-shift;  % take account of shift about zero
    pTVcellShift=circshift(pTV,-CellPrefT); % shift posterior
    pbnCellOff(t)=sum(pTVcellShift(1:round(nSpace/2-1))); % pbn
    TestHldOff(t)=Test;   % save estimate for lights off
    Tpos=Tpos+1;   % advance target one space unit per time step
end % end target off loop



% plot pbn Cell response
figure(4)
clf
lightOff=lightOff-2;
lightOn=lightOn-1;
subplot(211)
plot(TposVec,TposHld,'k',TposVec,TestHldOn,'ko',...
    TposVec,TestHldOff,'kx','linewidth',2);
legend('target position','estimate lit',...
    'estimate unlit',4)
xlabel('target position (space units)','fontsize',14)
ylabel('target estimates','fontsize',14)
text(0.5,26.5,'A','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)
subplot(212)
plot(TposVec,pbnCellOn,'k',TposVec,pbnCellOff,'k--',...
    [lightOff,lightOff],[-2,2],'k-.',...
    [lightOn,lightOn],[-2,2],'k-.','linewidth',2)
axis([0 nTpos-1 -0.1 1.1])
text(11.5,0.05,'unlit interval','fontsize',14)
legend('lit','unlit',4)
xlabel('target position (space units)','fontsize',14)
ylabel('PBN response','fontsize',14)
text(0.5,0.95,'B','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

figure(5)
clf
plot((1:161)-shift,pTVseriesOff(:,[1:2:nTpos]),'k',...
    [lightOff,lightOff],[-2,2],'k-.',...
    [lightOn,lightOn],[-2,2],'k-.','linewidth',2)
axis([-20 60 0 0.16])
xlabel('target position (space units)','fontsize',14)
ylabel('target posterior','fontsize',14)
text(11.8,0.152,'unlit','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)


