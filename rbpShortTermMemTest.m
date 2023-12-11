% rbpShortTermMemTest.m
% this script tests the behavior of recurrent neural networks 
% trained using recurrent back-propagation to simulate short-
% term memory (this script uses values from rbpShortTermMemTrain)

b=1; % set bias
bg=0.01; % set background
sl=60; % set segment length
level=0.1:0.1:1; % set desired input item levels
Out=zeros(nUnits,sl,10); % zero actual output array
DesOut=zeros(10,sl); % zero desired output array
gate=zeros(1,sl); % set gate input to zero
gate(sl/3)=1; % set the "in" gate
gate(2*(sl/3))=1; % set the "out" gate

for l=1:10, % for each level 
    item=ones(1,sl)*bg; % set background of item input
    DesOut(l,:)=ones(1,sl)*bg; % set background of desired output
    item(sl/3)=level(l); % set item level
    DesOut(l,sl/3+2:2*(sl/3)+1)=ones(1,sl/3)*level(l); % desired out
    y=ones(nUnits,1)*bg; % set initial y value
    Out(:,1,l)=y; % set first y output value
    z=[b;item(1);gate(1);y]; % set initial state
    for t=2:sl, % for each time step
        q=M*z; % compute weighted input sum
        y=1./(1+exp(-q)); % squash weighted sum
        Out(:,t,l)=y; % store y output
        z=[b;item(t);gate(t);y]; % reset state
    end % end t loop
end % end l loop



% plot outputs at each item level
tVec=1:sl; % set time step vector
figure(1)
clf
subplot(5,2,1)
plot(tVec,DesOut(1,:),'k--',tVec,Out(nUnits,:,1),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.1','fontweight','bold')
ylabel('output','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,3)
plot(tVec,DesOut(2,:),'k--',tVec,Out(nUnits,:,2),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.2','fontweight','bold')
ylabel('output','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,5)
plot(tVec,DesOut(3,:),'k--',tVec,Out(nUnits,:,3),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.3','fontweight','bold')
ylabel('output','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,7)
plot(tVec,DesOut(4,:),'k--',tVec,Out(nUnits,:,4),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.4','fontweight','bold')
ylabel('output','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,9)
plot(tVec,DesOut(5,:),'k--',tVec,Out(nUnits,:,5),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.5','fontweight','bold')
ylabel('output','fontweight','bold')
xlabel('time steps','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,2)
plot(tVec,DesOut(6,:),'k--',tVec,Out(nUnits,:,6),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.6','fontweight','bold')
ylabel('output','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,4)
plot(tVec,DesOut(7,:),'k--',tVec,Out(nUnits,:,7),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.7','fontweight','bold')
ylabel('output','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,6)
plot(tVec,DesOut(8,:),'k--',tVec,Out(nUnits,:,8),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.8','fontweight','bold')
ylabel('output','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,8)
plot(tVec,DesOut(9,:),'k--',tVec,Out(nUnits,:,9),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 0.9','fontweight','bold')
ylabel('output','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(5,2,10)
plot(tVec,DesOut(10,:),'k--',tVec,Out(nUnits,:,10),'k',...
    'linewidth',2)
axis([0 sl 0 1.1])
text(2,0.85,'level 1.0','fontweight','bold')
ylabel('output','fontweight','bold')
xlabel('time steps','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')

% return

% plot hidden unit responses at two levels
% (note: the following is for eight-unit networks)
l1=5; l2=8;
figure(2)
clf
subplot(421)
plot(tVec,Out(1,:,l1),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(423)
plot(tVec,Out(2,:,l1),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(425)
plot(tVec,Out(3,:,l1),'k','linewidth',2)
% axis([0 sl 0 0.55])
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(427)
plot(tVec,Out(4,:,l1),'k','linewidth',2)
xlabel('time steps','fontweight','bold')
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(422)
plot(tVec,Out(5,:,l1),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(424)
plot(tVec,Out(6,:,l1),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(426)
plot(tVec,Out(7,:,l1),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(428)
plot(tVec,Out(8,:,l1),'k','linewidth',2)
xlabel('time steps','fontweight','bold')
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')

figure(3)
clf
subplot(421)
plot(tVec,Out(1,:,l2),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(423)
plot(tVec,Out(2,:,l2),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(425)
plot(tVec,Out(3,:,l2),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(427)
plot(tVec,Out(4,:,l2),'k','linewidth',2)
xlabel('time steps','fontweight','bold')
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(422)
plot(tVec,Out(5,:,l2),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(424)
plot(tVec,Out(6,:,l2),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(426)
plot(tVec,Out(7,:,l2),'k','linewidth',2)
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')
subplot(428)
plot(tVec,Out(8,:,l2),'k','linewidth',2)
xlabel('time steps','fontweight','bold')
ylabel('response','fontweight','bold')
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontweight','bold')

