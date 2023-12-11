% itemGate.m
% this script generates items to be remembered and gates that 
% signal when the item is to be remembered; the output can be
% used to train models of short-term memory
%

% set number of time steps
nTs=20;
tStep=1:nTs;

% set proportion of gates
pGate=0.5;

% set hold vectors
itemHold=zeros(1,nTs);
gateHold=zeros(1,nTs);
doutHold=zeros(1,nTs);

% generate training signals
itemPre=0.01;
gatePre=0;
doutPre=0.01;
itemHold(1)=itemPre;
gateHold(1)=gatePre;
doutHold(1)=doutPre;
for i=2:nTs,
    item=rand;
    if gatePre==1,
        dout=itemPre;
        gate=0;
    elseif gatePre==0;
        dout=doutPre;
        gate=rand<pGate;
    end
    itemPre=item;
    gatePre=gate;
    doutPre=dout;
    itemHold(i)=item;
    gateHold(i)=gate;
    doutHold(i)=dout;
end

% plot signals
clf
subplot(311)

bar(tStep,itemHold,'k')
axis([0 nTs+1 0 1.1])
text(0.5,0.93,'A','fontsize',14)
ylabel('items','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)

subplot(312)
bar(tStep,gateHold,'k')
axis([0 nTs+1 0 1.1])
text(0.5,0.93,'B','fontsize',14)
ylabel('gates','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)

subplot(313)
bar(tStep,doutHold,'k')
axis([0 nTs+1 0 1.1])
text(0.5,0.93,'C','fontsize',14)
ylabel('memory','fontsize',14)
xlabel('time steps','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)






