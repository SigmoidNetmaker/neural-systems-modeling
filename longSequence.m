% script longSequence.m
% this script looks as the behavior of the asymmetric, 
% sequential Hopfield network over a longer timeframe

nIts=750;

P=zeros(3,50);
P(1,[1:2:49])=1;
P(2,[1:5 11:15 21:25 31:35 41:45])=1;
P(3,[2:2:50])=1;

[nPat,nUnits] = size(P);

AsimConnectivity
y=P(1,:)';
Yseq=AsynchUp(y,HP,nIts);
[r,c]=size(Yseq);
YimageS=zeros(r,c,3);
YimageS(:,:,1)=Yseq;
YimageS(:,:,2)=Yseq;
YimageS(:,:,3)=Yseq;


clf
image(YimageS)
set(gca,'yticklabel',[100 200 300 400 500 600 700])
set(gca,'fontsize',12,'fontweight','bold')
xlabel('units','fontsize',14,'fontweight','normal')
ylabel('updates','fontsize',14,'fontweight','normal')



