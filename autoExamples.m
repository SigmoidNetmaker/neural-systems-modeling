% autoExamples.m
% this script runs through the auto-association examples

% % first pattern set
% P = [ 1 1 1 1 0 0 0 0 0 0
%       0 0 0 0 0 0 1 1 1 1 ]
% autoConnectivity
% 
% % easy recall examples
% yInitial=P(1,:)';
% YHB1=synchUp(yInitial,HB,10);
% [r,c]=size(YHB1);
% YHB1Im=zeros(r,c,3);
% YHB1Im(:,:,1)=YHB1;
% YHB1Im(:,:,2)=YHB1;
% YHB1Im(:,:,3)=YHB1;
% 
% yInitial=P(2,:)';
% YHB2=synchUp(yInitial,HB,10);
% [r,c]=size(YHB2);
% YHB2Im=zeros(r,c,3);
% YHB2Im(:,:,1)=YHB2;
% YHB2Im(:,:,2)=YHB2;
% YHB2Im(:,:,3)=YHB2;
% 
% yInitial=[1 1 0 0 0 0 0 0 0 0]';
% YHBinc=synchUp(yInitial,HB,10);
% [r,c]=size(YHBinc);
% YHBincIm=zeros(r,c,3);
% YHBincIm(:,:,1)=YHBinc;
% YHBincIm(:,:,2)=YHBinc;
% YHBincIm(:,:,3)=YHBinc;
% 
% yInitial=[0.1 0 0 0 0 0 0 0 0 0]';
% YHBweak=synchUp(yInitial,HB,10);
% [r,c]=size(YHBweak);
% YHBweakIm=zeros(r,c,3);
% YHBweakIm(:,:,1)=YHBweak;
% YHBweakIm(:,:,2)=YHBweak;
% YHBweakIm(:,:,3)=YHBweak;
% 
% clf
% subplot(221)
% image(YHB1Im)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'A','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% subplot(222)
% image(YHB2Im)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'B','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% subplot(223)
% image(YHBincIm)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'C','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% subplot(224)
% image(YHBweakIm)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'D','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% return

% % corrupted recall examples
% yInitial=[1 1 1 1 0 0 0 0 0 1]';
% YHBcorr=synchUp(yInitial,HB,10);
% [r,c]=size(YHBcorr);
% YHBcorrIm=zeros(r,c,3);
% YHBcorrIm(:,:,1)=YHBcorr;
% YHBcorrIm(:,:,2)=YHBcorr;
% YHBcorrIm(:,:,3)=YHBcorr;
% 
% yInitial=[1 1 1 1 0 0 0 0 0 1]';
% YPOcorr=synchUp(yInitial,PO,10);
% [r,c]=size(YPOcorr);
% YPOcorrIm=zeros(r,c,3);
% YPOcorrIm(:,:,1)=YPOcorr;
% YPOcorrIm(:,:,2)=YPOcorr;
% YPOcorrIm(:,:,3)=YPOcorr;
% 
% clf
% subplot(221)
% image(YHBcorrIm)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'A','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% subplot(222)
% image(YPOcorrIm)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'B','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% return

% % second set of patterns
% P = [ 1 1 1 1 1 0 0 0 0 0 
%       1 0 1 0 1 0 1 0 1 0]
% autoConnectivity
% 
% yInitial=[1 1 1 1 1 0 0 0 0 0]';
% % yInitial=[1 0 1 0 1 0 1 0 1 0]';
% YPOhard=synchUp(yInitial,HB,10);
% [r,c]=size(YPOhard);
% YPOhardIm=zeros(r,c,3);
% YPOhardIm(:,:,1)=YPOhard;
% YPOhardIm(:,:,2)=YPOhard;
% YPOhardIm(:,:,3)=YPOhard;
% 
% yInitial=[1 1 1 1 1 0 0 0 0 0]';
% % yInitial=[1 0 1 0 1 0 1 0 1 0]';
% YPRhard=synchUp(yInitial,PR,10);
% [r,c]=size(YPRhard);
% YPRhardIm=zeros(r,c,3);
% YPRhardIm(:,:,1)=YPRhard;
% YPRhardIm(:,:,2)=YPRhard;
% YPRhardIm(:,:,3)=YPRhard;
% 
% clf
% subplot(221)
% image(YPOhardIm)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'A','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% subplot(222)
% image(YPRhardIm)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'B','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% return

% % third pattern set
% P = [ 1 0 1 0 1 0 1 0 1 0
%       1 0 0 1 1 1 1 0 0 1 ]
% autoConnectivity
% 
% % asynchronous recall examples
% yInitial=[0 0 1 0 1 0 1 0 1 0]';
% YHP1=synchUp(yInitial,HP,10);
% [r,c]=size(YHP1);
% YHP1Im=zeros(r,c,3);
% YHP1Im(:,:,1)=YHP1;
% YHP1Im(:,:,2)=YHP1;
% YHP1Im(:,:,3)=YHP1;
% 
% yInitial=[0 0 0 0 1 0 1 0 1 0]';
% YHP2=synchUp(yInitial,HP,10);
% [r,c]=size(YHP2);
% YHP2Im=zeros(r,c,3);
% YHP2Im(:,:,1)=YHP2;
% YHP2Im(:,:,2)=YHP2;
% YHP2Im(:,:,3)=YHP2;
% 
% yInitial=[0 0 0 0 1 0 1 0 1 0]';
% YHP3=AsynchUp(yInitial,HP,100);
% [r,c]=size(YHP3);
% YHP3Im=zeros(r,c,3);
% YHP3Im(:,:,1)=YHP3;
% YHP3Im(:,:,2)=YHP3;
% YHP3Im(:,:,3)=YHP3;
% 
% yInitial=[0 0 0 0 1 0 1 0 1 0]';
% YHP4=AsynchUp(yInitial,HP,100);
% [r,c]=size(YHP4);
% YHP4Im=zeros(r,c,3);
% YHP4Im(:,:,1)=YHP4;
% YHP4Im(:,:,2)=YHP4;
% YHP4Im(:,:,3)=YHP4;
% 
% clf
% subplot(221)
% image(YHP1Im)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'A','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% subplot(222)
% image(YHP2Im)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'B','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[2,4,6,8,10])
% subplot(223)
% image(YHP3Im)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'C','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[20,40,60,80,100])
% subplot(224)
% image(YHP4Im)
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-0.5,0,'D','fontsize',14)
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[20,40,60,80,100])
% return

% % random patterns
% P = double(rand(3,20)>0.5);
% autoConnectivity
% HPhold=HP;
% 
% yInitial=0.5*P(1,:)';
% Yintact=AsynchUp(yInitial,HP,100);
% [r,c]=size(Yintact);
% YintactIm=zeros(r,c,3);
% YintactIm(:,:,1)=Yintact;
% YintactIm(:,:,2)=Yintact;
% YintactIm(:,:,3)=Yintact;
% 
% [dum,nUnits] = size(HP);
% shotgun = rand(nUnits) > 0.25;
% HP = HP .* shotgun;
% 
% yInitial=0.5*P(1,:)';
% Ylesion1=AsynchUp(yInitial,HP,100);
% [r,c]=size(Ylesion1);
% Ylesion1Im=zeros(r,c,3);
% Ylesion1Im(:,:,1)=Ylesion1;
% Ylesion1Im(:,:,2)=Ylesion1;
% Ylesion1Im(:,:,3)=Ylesion1;
% 
% [dum,nUnits] = size(HP);
% shotgun = rand(nUnits) > 0.25;
% HP = HP .* shotgun;
% 
% yInitial=0.5*P(1,:)';
% Ylesion2=AsynchUp(yInitial,HP,100);
% [r,c]=size(Ylesion2);
% Ylesion2Im=zeros(r,c,3);
% Ylesion2Im(:,:,1)=Ylesion2;
% Ylesion2Im(:,:,2)=Ylesion2;
% Ylesion2Im(:,:,3)=Ylesion2;
% 
% [dum,nUnits] = size(HP);
% shotgun = rand(nUnits) > 0.25;
% HP = HP .* shotgun;
% 
% yInitial=0.5*P(1,:)';
% Ylesion3=AsynchUp(yInitial,HP,100);
% [r,c]=size(Ylesion3);
% Ylesion3Im=zeros(r,c,3);
% Ylesion3Im(:,:,1)=Ylesion3;
% Ylesion3Im(:,:,2)=Ylesion3;
% Ylesion3Im(:,:,3)=Ylesion3;
% 
% clf
% subplot(221)
% image(YintactIm)
% set(gca,'xtick',[5,10,15,20])
% set(gca,'xticklabel',[5,10,15,20])
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[20,40,60,80,100])
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-1,0,'A','fontsize',14)
% subplot(222)
% image(Ylesion1Im)
% set(gca,'xtick',[5,10,15,20])
% set(gca,'xticklabel',[5,10,15,20])
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[20,40,60,80,100])
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% % ylabel('updates','fontsize',14)
% text(-1,0,'B','fontsize',14)
% subplot(223)
% image(Ylesion2Im)
% set(gca,'xtick',[5,10,15,20])
% set(gca,'xticklabel',[5,10,15,20])
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[20,40,60,80,100])
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% ylabel('updates','fontsize',14)
% text(-1,0,'C','fontsize',14)
% subplot(224)
% image(Ylesion3Im)
% set(gca,'xtick',[5,10,15,20])
% set(gca,'xticklabel',[5,10,15,20])
% set(gca,'ytick',[3,5,7,9,11])
% set(gca,'yticklabel',[20,40,60,80,100])
% set(gca,'fontsize',14)
% xlabel('units','fontsize',14)
% % ylabel('updates','fontsize',14)
% text(-1,0,'D','fontsize',14)
% return

% try to get a simple WD demo
% it oscillates with synchUp but works stochastically with AsynchUp
P = [ 1 1 1 1 1 0 0 0 0 0 
      1 0 1 0 1 0 1 0 1 0];
autoConnectivity

yInitial=[1 1 1 1 0 0 0 0 0 1]';
YHBWDdense=AsynchUp(yInitial,HB,100);
% YHBWDdense=synchUp(yInitial,HB,10);
[r,c]=size(YHBWDdense);
YHBWDdenseIm=zeros(r,c,3);
YHBWDdenseIm(:,:,1)=YHBWDdense;
YHBWDdenseIm(:,:,2)=YHBWDdense;
YHBWDdenseIm(:,:,3)=YHBWDdense;

yInitial=[1 1 1 1 0 0 0 0 0 1]';
YHPWDdense=AsynchUp(yInitial,HP,100);
% YHPWDdense=synchUp(yInitial,HP,10);
[r,c]=size(YHPWDdense);
YHPWDdenseIm=zeros(r,c,3);
YHPWDdenseIm(:,:,1)=YHPWDdense;
YHPWDdenseIm(:,:,2)=YHPWDdense;
YHPWDdenseIm(:,:,3)=YHPWDdense;

P = [ 1 1 0 0 0 0 0 0 0 0 
      0 0 0 1 0 1 0 0 0 0];
autoConnectivity

yInitial=[1 0 0 0 0 0 0 0 0 1]';
YHBWDsparse=AsynchUp(yInitial,HB,100);
% YHBWDsparse=synchUp(yInitial,HB,10);
[r,c]=size(YHBWDsparse);
YHBWDsparseIm=zeros(r,c,3);
YHBWDsparseIm(:,:,1)=YHBWDsparse;
YHBWDsparseIm(:,:,2)=YHBWDsparse;
YHBWDsparseIm(:,:,3)=YHBWDsparse;

yInitial=[1 0 0 0 0 0 0 0 0 1]';
YHPWDsparse=AsynchUp(yInitial,HP,100);
% YHPWDsparse=synchUp(yInitial,HP,10);
[r,c]=size(YHPWDsparse);
YHPWDsparseIm=zeros(r,c,3);
YHPWDsparseIm(:,:,1)=YHPWDsparse;
YHPWDsparseIm(:,:,2)=YHPWDsparse;
YHPWDsparseIm(:,:,3)=YHPWDsparse;

clf
subplot(221)
image(YHBWDdenseIm)
set(gca,'fontsize',14)
xlabel('units','fontsize',14)
ylabel('updates','fontsize',14)
set(gca,'ytick',[3,5,7,9,11])
set(gca,'yticklabel',[20,40,60,80,100])
text(-0.5,0,'A','fontsize',14)
subplot(222)
image(YHPWDdenseIm)
set(gca,'fontsize',14)
xlabel('units','fontsize',14)
ylabel('updates','fontsize',14)
set(gca,'ytick',[3,5,7,9,11])
set(gca,'yticklabel',[20,40,60,80,100])
text(-0.5,0,'B','fontsize',14)
subplot(223)
image(YHBWDsparseIm)
set(gca,'fontsize',14)
xlabel('units','fontsize',14)
ylabel('updates','fontsize',14)
set(gca,'ytick',[3,5,7,9,11])
set(gca,'yticklabel',[20,40,60,80,100])
text(-0.5,0,'C','fontsize',14)
subplot(224)
image(YHPWDsparseIm)
set(gca,'fontsize',14)
xlabel('units','fontsize',14)
ylabel('updates','fontsize',14)
set(gca,'ytick',[3,5,7,9,11])
set(gca,'yticklabel',[20,40,60,80,100])
text(-0.5,0,'D','fontsize',14)
return





