% direcSelecMultiSpeed.m
% this script sets up a direction selective network that can
% operate at multiple speeds; it is a modified version of 
% directionSelectivity; for ease of comparison the modificaitons
% were kept to a minimum; they consist mainly in allowing each 
% inhibitory input unit (xin) to inhibit all y units having lower
% indices, in allowing all xin and y units to excite themselves
% and so prolong their responses, in making z binary with a 
% nonzero threshold, and in changing the y units from binary
% with zero threshold to linear with a cutoff

dirFlag=0; % set direction flag (1 for on, 0 for off)
speedFlag=1; % set speed flag (1 slowest, 5 fastest)
nEx=30; % enter the number of excitatory input units
selfY=0.8; % set y self connection scale factor
selfXin=0.8; % set xin self connection scale factor
zThr=0.6; % set the z unit threshold

% make the connectivity matrices
VX=[zeros(nEx-1,1) eye(nEx-1)]; % connections to xin from xex
V=[eye(nEx-1) zeros(nEx-1,1) -triu(ones(nEx-1))]; % to y from all x
U=ones(1,nEx-1); % connections to z from y
WY=eye(nEx-1)*selfY; % connections to each y from itself
WXIN=eye(nEx-1)*selfXin; % connections to each xin from itself

% make input pattern matrices
d1s3=eye(nEx);
d1s5=zeros(nEx); d1s5(1:ceil(nEx/3),:)=d1s3(1:3:nEx,:);
d1s4=zeros(nEx); d1s4(1:ceil(nEx/2),:)=d1s3(1:2:nEx,:);
d1s2=zeros(nEx); d1s2(1:2:nEx,:)=d1s3(1:ceil(nEx/2),:);
d1s1=zeros(nEx); d1s1(1:3:nEx,:)=d1s3(1:ceil(nEx/3),:);
d0s1=fliplr(d1s1);
d0s2=fliplr(d1s2);
d0s3=fliplr(d1s3);
d0s4=fliplr(d1s4);
d0s5=fliplr(d1s5);

% set input
if dirFlag==1 & speedFlag==5,
    InPat=d1s5;
elseif dirFlag==1 & speedFlag==4,
    InPat=d1s4;
elseif dirFlag==1 & speedFlag==3,
    InPat=d1s3;
elseif dirFlag==1 & speedFlag==2,
    InPat=d1s2;
elseif dirFlag==1 & speedFlag==1,
    InPat=d1s1;
elseif dirFlag==0 & speedFlag==5,
    InPat=d0s5;
elseif dirFlag==0 & speedFlag==4,
    InPat=d0s4;
elseif dirFlag==0 & speedFlag==3,
    InPat=d0s3;
elseif dirFlag==0 & speedFlag==2,
    InPat=d0s2;
elseif dirFlag==0 & speedFlag==1,
    InPat=d0s1;
end

% find the output
yHld=zeros(nEx-1,nEx); % zero y response hold array
xinHld=zeros(nEx-1,nEx); % zero xIn response hold array
xex=zeros(nEx,1); % zero excitatory input vector
xin=zeros(nEx-1,1); % zero inhibitory input vector
xinP=zeros(nEx-1,1); % zero previous inhibitory input vector
y=zeros(nEx-1,1); % zero y unit vector
yP=zeros(nEx-1,1);  % zero previous y unit vector
z=zeros(nEx,1); % zero z unit vector
for t=1:nEx, % for each time step
    xex=InPat(t,:)'; % set the excitatory input vector
    x=[xex; xin]; % compose the whole input vector
    qy=WY*yP + V*x; % find the net input to the y units
    y=max(qy,0); % apply cutoff of zero to find y responses
    yHld(:,t)=y; % save the responses of the y units
    qz=U*y; % find the net input to the z unit
    z(t)=qz>zThr; % threshold the net input to find binary z
    xin=WXIN*xinP + VX*xex; % find inhibitory input response
    xinHld(:,t)=xin; % save the inhibitory input responses
    yP=y; % save the current y unit responses
    xinP=xin; % save the current xin unit responses
end % end output loop

% decide title
if dirFlag==1 & speedFlag==5,
    DIRtitle=('On-direction Faster Speed');
elseif dirFlag==1 & speedFlag==4,
    DIRtitle=('On-direction Fast Speed');
elseif dirFlag==1 & speedFlag==3,
    DIRtitle=('On-direction Medium Speed');
elseif dirFlag==1 & speedFlag==2,
    DIRtitle=('On-direction Slow Speed');
elseif dirFlag==1 & speedFlag==1,
    DIRtitle=('On-direction Slower Speed');
elseif dirFlag==0 & speedFlag==5,
    DIRtitle=('Off-direction Faster Speed');
elseif dirFlag==0 & speedFlag==4,
    DIRtitle=('Off-direction Fast Speed');
elseif dirFlag==0 & speedFlag==3,
    DIRtitle=('Off-direction Medium Speed');
elseif dirFlag==0 & speedFlag==2,
    DIRtitle=('Off-direction Slow Speed');
elseif dirFlag==0 & speedFlag==1,
    DIRtitle=('Off-direction Slower Speed');
end

% generate baseline
ts=(1:nEx)';
bl=zeros(nEx,1);

% plot dot movement and z output
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

% plot y and xIn unit responses
figure(2)
subplot(211)
plot(yHld')
axis([0 nEx 0 1.1])
xlabel('time step')
ylabel('y response')
subplot(212)
plot(xinHld')
axis([0 nEx 0 1.1])
xlabel('time step')
ylabel('xIn response')

% make pretty figure
figure(3)
clf
subplot(411)
spy(InPat',15,'k')
axis normal
axis([0 nEx -1 31])
xlabel('')
ylabel('light','fontsize',14)
text(28,5,'A','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(412)
plot(ts,z,'k*',ts,bl,'k--','linewidth',2)
axis([0 nEx -0.5 1.5])
set(gca,'ytick',[0 1])
ylabel('output','fontsize',14)
text(28,1.1,'B','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(413)
plot(yHld','k','linewidth',1.5)
axis([0 nEx 0 1.1])
ylabel('inter','fontsize',14)
text(28,0.87,'C','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(414)
plot(xinHld','k','linewidth',1.5)
axis([0 nEx 0 1.1])
xlabel('time step','fontsize',14)
ylabel('inhib in','fontsize',14)
text(28,0.87,'D','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

