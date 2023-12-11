% directionSelectivity.m
% this script implements a simple direction selective network

dirFlag=0; % set direction flag (1 for on, 0 for off)
nEx=30; % enter the number of excitatory input units

% make the connectivity matrices
VX=[zeros(nEx-1,1) eye(nEx-1)]; % connections to xin from xex
V=[eye(nEx-1) zeros(nEx-1,1) -eye(nEx-1)]; % to y from all x
U=ones(1,nEx-1); % connections to z from y

% make input pattern matrix
if dirFlag==1, % for "on" pattern
    InPat=eye(nEx); % the identity matrix
elseif dirFlag==0, % for "off" pattern
    InPat=fliplr(eye(nEx)); % the flipped identity matrix
end % end input pattern conditional

% find the output
xex=zeros(nEx,1); % define excitatory input vector
xin=zeros(nEx-1,1); % define inhibitory input vector
y=zeros(nEx-1,1); % define y unit vector
z=zeros(nEx,1); % define z unit vector
for t=1:nEx, % for each time step
    xex=InPat(t,:)'; % set the excitatory input vector
    x=[xex; xin]; % compose the whole input vector
    q=V*x; % find the net input to the y units
    y=q>0; % binarize q to find y with a threshold of zero
    z(t)=U*y; % find the response of the z unit
    xin=VX*xex; % update the inhibitory input vector
end % end output loop



% decide title
if dirFlag==1,
    DIRtitle=('On-direction Selectivity');
elseif dirFlag==0,
    DIRtitle=('Off-direction Selectivity');
end

% generate baseline
ts=(1:nEx)';
bl=zeros(nEx,1);

% plot output
figure(1)
clf
subplot(211)
spy(InPat')
axis normal
xlabel('time step')
ylabel('dot position')
title(DIRtitle)
subplot(212)
plot(ts,z,'*',ts,bl,'--')
axis([0 nEx -1 2])
xlabel('time step')
ylabel('response')

return

figure(2)
inOn=eye(nEx);
inOff=fliplr(inOn);
zOff=zeros(nEx,1);
zOn=ones(nEx,1);
zOn(nEx)=0;
clf

subplot(411)
spy(inOff,15,'k')
axis normal
axis([0 nEx -1 31])
xlabel('')
ylabel('light','fontsize',14)
text(0.5,5,'A','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(412)
plot(ts,zOff,'k*',ts,bl,'k--','linewidth',2)
axis([0 nEx -0.5 1.5])
set(gca,'ytick',[0 1])
ylabel('response','fontsize',14)
text(0.5,1.1,'B','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(413)
spy(inOn,15,'k')
axis normal
axis([0 nEx -1 31])
xlabel('')
ylabel('light','fontsize',14)
text(0.5,10,'C','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(414)
plot(ts,zOn,'k*',ts,bl,'k--','linewidth',2)
axis([0 nEx -0.5 1.5])
set(gca,'ytick',[0 1])
xlabel('time step','fontsize',14)
ylabel('response','fontsize',14)
text(0.5,0.5,'D','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)







