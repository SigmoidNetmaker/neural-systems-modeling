% script infoMaxBBS.m
% this script implements blind
% source separation using the
% information maximization
% algorithm of Bell and Sejnowski
% for two neurons
%

% set parameters
n=2;
nSam=1000;
sig=zeros(n,nSam);
mix=zeros(n,nSam);
out=zeros(n,nSam);
f=0.5;
tenp=(1/f)*10;
t=linspace(0,tenp,nSam);

% compute input signals
sig(1,:)=sin(2*pi*f*t)*0.5;
sig(2,:)=rand(1,nSam)-0.5;

% initialize network parameters
V=[0.03 0.02; 0.01 0.04];
b=[0.02; 0.03];
bat=100;
B=zeros(2,bat);
nIts=2000;
a=0.1;

% set mixing matrix and compute
% mixed signals
A=[0.6 0.4; 0.5 0.5];
mix=A*sig;

% train weights
for i=1:nIts,
   for j=1:nSam/bat,
      B(1,:)=b(1)*ones(1,bat);
      B(2,:)=b(2)*ones(1,bat);
      x=mix(:,bat*(j-1)+1:bat*j);
      q=V*x+B;
      y=1./(1+exp(-q));
      delV=inv(V')+1/bat*((1-2*y)*x');
      delb=1/bat*sum(1-2*y,2);
      V=V+a*delV;
      b=b+a*delb;
   end
end

% print out weights
V
b

% examine trained output
B=zeros(2,nSam);
B(1,:)=b(1)*ones(1,nSam);
B(2,:)=b(2)*ones(1,nSam);
q=V*mix+B;
out=1./(1+exp(-q));

% plot results
clf
subplot(231)
plot(t,sig(1,:),'k','linewidth',2)
axis([0 10 -0.6 0.6])
ylabel('amplitude one','fontsize',14)
title('Signals','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(232)
plot(t,mix(1,:),'k','linewidth',1)
axis([0 10 -0.6 0.6])
title('Mixtures','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(233)
plot(t,out(1,:),'k','linewidth',2)
axis([0 10 0 1])
title('Outputs','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(234)
plot(t,sig(2,:),'k','linewidth',1)
axis([0 10 -0.6 0.6])
ylabel('amplitude two','fontsize',14)
xlabel('time (s)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(235)
plot(t,mix(2,:),'k','linewidth',1)
axis([0 10 -0.6 0.6])
xlabel('time (s)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(236)
plot(t,out(2,:),'k','linewidth',1)
axis([0 10 0 1])
xlabel('time (s)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)


