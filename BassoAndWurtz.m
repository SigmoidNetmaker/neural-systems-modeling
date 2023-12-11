% BassoAndWurtz.m
% this script simulates the Basso and Wurtz results

% set parameters
r=25;
s=-r:r;
[m,n]=size(s);
V=eye(n);
nTs=20;

% the following set of three parameters work OK for r=25
gvar=3.0;
dvar=15.0;
dwt=0.3;

% make the lateral connectivity matrix
g=gaussPro(s,gvar);
d=gaussPro(s,dvar);
p=g-(dwt*d);
pCenter=p;
p=[p(r+1:n) p(1:r)];
W=shiftLam(p);

% single signal of amplitude two in noise
rate=1;
signal=zeros(n,1);
signal(25:27)=2;
x=signal;
rl=r+1;
winnersTakeAll
xT1=x;
yT1=y;

% signal of amplitude two with four flanking signals of 
% amplitude one in noise
rate=1;
signal([7:9,13:15,19:21,31:33,37:39,43:45])=1;
x=signal;
rl=r+1;
winnersTakeAll
xT7=x;
yT7=y;

% show results
clf
subplot(325)
plot(s,yT1(:,3:19),'k')
hold
plot(s,yT1(:,20),'k','linewidth',2)
hold
axis([(1-n)/2 r 0 11])
xlabel('space','fontsize',14)
ylabel('output','fontsize',14)
text(-24,9.8,'E','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(326)
plot(s,yT7(:,3:19),'k')
hold
plot(s,yT7(:,20),'k','linewidth',2)
hold
axis([-r r 0 11])
xlabel('space','fontsize',14)
ylabel('output','fontsize',14)
text(-24,9.8,'F','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(323)
plot(s,yT1(:,3),'k','linewidth',2)
axis([(1-n)/2 r 0 7])
ylabel('output','fontsize',14)
text(-24,6.2,'C','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(324)
plot(s,yT7(:,3),'k','linewidth',2)
axis([(1-n)/2 r 0 7])
ylabel('output','fontsize',14)
text(-24,6.2,'D','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(321)
plot(s,xT1,'k','linewidth',2)
axis([(1-n)/2 r 0 2.5])
ylabel('input','fontsize',14)
text(-24,2.2,'A','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(322)
plot(s,xT7,'k','linewidth',2)
axis([(1-n)/2 r 0 2.5])
ylabel('input','fontsize',14)
text(-24,2.2,'B','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)


