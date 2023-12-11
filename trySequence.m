% script trySequence.m
% this script trys to get a Hopfield covariance network to produce
% a sequence of three stable states (3 patterns 50 units)

nIts=250;

P=zeros(3,50);
P(1,[1:2:49])=1;
P(2,[1:5 11:15 21:25 31:35 41:45])=1;
P(3,[2:2:50])=1;

[nPat,nUnits] = size(P);
HP=(2*P-1)'*(2*P-1);
MSK = (ones(nUnits) - eye(nUnits));
HP = HP .* MSK;

y=P(1,:)';
Ypat1=AsynchUp(y,HP,nIts);
[r,c]=size(Ypat1);
Yimage1=zeros(r,c,3);
Yimage1(:,:,1)=Ypat1;
Yimage1(:,:,2)=Ypat1;
Yimage1(:,:,3)=Ypat1;

y=P(2,:)';
Ypat2=AsynchUp(y,HP,nIts);
[r,c]=size(Ypat2);
Yimage2=zeros(r,c,3);
Yimage2(:,:,1)=Ypat2;
Yimage2(:,:,2)=Ypat2;
Yimage2(:,:,3)=Ypat2;

y=P(3,:)';
Ypat3=AsynchUp(y,HP,nIts);
[r,c]=size(Ypat3);
Yimage3=zeros(r,c,3);
Yimage3(:,:,1)=Ypat3;
Yimage3(:,:,2)=Ypat3;
Yimage3(:,:,3)=Ypat3;

AsimConnectivity
y=P(1,:)';
Yseq=AsynchUp(y,HP,nIts);
[r,c]=size(Yseq);
YimageS=zeros(r,c,3);
YimageS(:,:,1)=Yseq;
YimageS(:,:,2)=Yseq;
YimageS(:,:,3)=Yseq;


clf
subplot(221)
image(Yimage1)
set(gca,'yticklabel',[50,100,150,200,250])
set(gca,'fontsize',12,'fontweight','bold')
xlabel('units','fontsize',14,'fontweight','normal')
ylabel('updates','fontsize',14,'fontweight','normal')
text(-3,-1,'A','fontsize',14)
subplot(222)
image(Yimage2)
set(gca,'yticklabel',[50,100,150,200,250])
set(gca,'fontsize',12,'fontweight','bold')
xlabel('units','fontsize',14,'fontweight','normal')
% ylabel('updates','fontsize',14,'fontweight','normal')
text(-3,-1,'B','fontsize',14)
subplot(223)
image(Yimage3)
set(gca,'yticklabel',[50,100,150,200,250])
set(gca,'fontsize',12,'fontweight','bold')
xlabel('units','fontsize',14,'fontweight','normal')
ylabel('updates','fontsize',14,'fontweight','normal')
text(-3,-1,'C','fontsize',14)
subplot(224)
image(YimageS)
set(gca,'yticklabel',[50,100,150,200,250])
set(gca,'fontsize',12,'fontweight','bold')
xlabel('units','fontsize',14,'fontweight','normal')
% ylabel('updates','fontsize',14,'fontweight','normal')
text(-3,-1,'D','fontsize',14)




