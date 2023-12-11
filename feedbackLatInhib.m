% feedbackLatInhib.m
% this script implements the feedback lateral inhibition examples

% set parameters
r=25;
s=-r:r;
[m,n]=size(s);
V=eye(n);

% the following set of three parameters work OK for r=25
gsd=3.0;
dsd=15.0;
dwt=0.3;

% the following set of three parameters were optimized 
% using the GA in TNSM
% gsd=1.0;
% dsd=22.0;
% dwt=0.2;

% make the lateral connectivity matrix
g=gaussPro(s,gsd);
d=gaussPro(s,dsd);
p=g-(dwt*d);
pCenter=p;
p=[p(r+1:n) p(1:r)];
W=shiftLam(p);

% colormap([0 0 0])
% clf
% subplot(121)
% plot(s,pCenter,'k','linewidth',2)
% axis square
% axis([-r-1 r+1 -0.3 0.75])
% % set(gca,'xtick',[-20 -10 0 10 20])
% xlabel('space','fontsize',14)
% ylabel('weight','fontsize',14)
% text(-r+3,0.65,'A','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% subplot(122)
% mesh(W,'linewidth',0.1)
% axis square
% axis([0 n+1 0 n+1 -0.3 0.75])
% % set(gca,'xtick',[0 25 50])
% % set(gca,'ytick',[0 25 50])
% xlabel('in num','fontsize',14)
% ylabel('out num','fontsize',14)
% zlabel('weight','fontsize',14)
% text(0,n-5,0.64,'B','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% return

% colormap([0 0 0])
% clf
% mesh(W,'linewidth',0.1)
% axis square
% axis([0 52 0 52 -0.3 0.75])
% title('Figure 3.15B')
% return

% uncomment the next statement for the 1/2 sine input
% x=(2*sin(pi*(0:(n-1))/(n-1)))';
% 
% rate=0.1;
% winnersTakeAll
% yLowRate=y;
% rate=1;
% winnersTakeAll
% yHighRate=y;
% 
% clf
% subplot(121)
% plot(s,yLowRate(:,1:19),'k')
% hold
% plot(s,yLowRate(:,20),'k','linewidth',2)
% hold
% axis square
% axis([-r-1 r+1 0 2.5])
% % set(gca,'xtick',[-20 -10 0 10 20])
% xlabel('space','fontsize',14)
% ylabel('output responses','fontsize',14)
% text(-r+3,2.25,'A','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% subplot(122)
% plot(s,yHighRate(:,1:19),'k')
% hold
% plot(s,yHighRate(:,20),'k','linewidth',2)
% hold
% axis square
% axis([-r-1 r+1 0 10.2])
% % set(gca,'xtick',[-20 -10 0 10 20])
% % set(gca,'ytick',[0 2.5 5 7.5 10])
% xlabel('space','fontsize',14)
% ylabel('output responses','fontsize',14)
% text(-r+3,9.25,'B','fontsize',14) 
% set(gca,'fontsize',14)
% set(gca,'linewidth',2)
% 
% return

% uncomment the next statements for the signal in noise input
% where the signal is at the middle
rate=1;
signal=zeros(n,1);
signal(r:r+2)=ones(3,1);
noise=rand(n,1);
x=signal+noise;
rl=r+1;

% uncomment the next statements for the signal in noise input
% where the signal is at the middle and noise is large
% rate=1;
% signal=zeros(n,1);
% signal(r:r+2)=ones(3,1);
% noise=rand(n,1);
% x=signal+noise*5;
% rl=r+1;

% uncomment the next statements for the signal in noise input
% where the signal is at a random location
% rate=1;
% rl=ceil(rand*(n-13))+8;
% signal=zeros(n,1);
% signal(rl-1:rl+1)=ones(3,1);
% noise=rand(n,1);
% x=signal+noise;

% uncomment the next statements for the signal in noise input
% where the signal is at an arbitrary location
% rate=1;
% signal=zeros(n,1);
% signal(17:19)=1; rl=18;
% % signal(37:39)=1; rl=38;
% noise=rand(n,1);
% x=signal+noise;

% iterate relaxation in the network and plot results
winnersTakeAll

clf
subplot(211)
plot(s,y(:,1:19),'k')
hold
plot(s,y(:,20),'k','linewidth',2)
hold
axis([(1-n)/2 r 0 11])
xlabel('space','fontsize',14)
ylabel('output responses','fontsize',14)
text(-24,9.8,'A','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)
subplot(212)
plot(s,x,'k',rl-r-1,2.2,'k*','linewidth',2)
axis([(1-n)/2 r -0.5 3])
xlabel('space','fontsize',14)
ylabel('input activities','fontsize',14)
text(-24,2.6,'B','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

return

rate=1;
dwt=0.1;
p=g-(dwt*d);
p=[p(r+1:n) p(1:r)];
W=shiftLam(p);
signal=zeros(n,1);
signal(rl-1:rl+1)=ones(3,1);
noise=rand(n,1);
x=signal+noise;
rl=r+1;
winnersTakeAll
yBlowUp=y;

clf
subplot(211)
plot(s,yBlowUp(:,2:19),'k')
hold
plot(s,yBlowUp(:,20),'k','linewidth',2)
hold
axis([-r r -1 12])
% set(gca,'xtick',[-20 -10 0 10 20])
% set(gca,'ytick',[0 2.5 5 7.5 10])
xlabel('space','fontsize',14)
ylabel('output responses','fontsize',14)
text(-r-1,11,'A','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)
subplot(212)
plot(s,x,'k',rl-r-1,2.2,'k*','linewidth',2)
axis([-r r -0.5 3])
xlabel('space','fontsize',14)
ylabel('input responses','fontsize',14)
text(-r-1,2.6,'B','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)








