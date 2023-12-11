% squashDerivSquash.m
% this script illustrates the squashing function
% and the derivative of the squashing funciton

net=linspace(-5,5,100);
squash=1 ./ (1+exp(-net));
deriv=squash.*(1-squash);

lw=2; % set line width
fs=14; % set font size
subplot(121)
plot(net,squash,'k','linewidth',lw)
axis square
set(gca,'fontsize',fs)
set(gca,'linewidth',lw)
set(gca,'xtick',[-5 -2.5 0 2.5 5])
set(gca,'ytick',[0 0.25 0.5 0.75 1])
xlabel('net input')
ylabel('squash output')
text(-4.5,0.92,'A','fontsize',fs+2) 
subplot(122)
plot(net,deriv,'k','linewidth',lw)
axis square
axis([-5 5 0 0.3])
set(gca,'fontsize',fs)
set(gca,'linewidth',lw)
set(gca,'xtick',[-5 -2.5 0 2.5 5])
set(gca,'ytick',[0 0.05 0.15 0.25])
xlabel('net input')
ylabel('squash derivative')
text(-4.5,0.275,'B','fontsize',fs+2) 

