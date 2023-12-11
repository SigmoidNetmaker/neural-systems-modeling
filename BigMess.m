% BigMess.m
% this script will set up a single-layer network with
% random input and feedback connections and compute the 
% output to a pulse or step input

nIn=10; % set number of input units
nOut=10; % set number of output units

scw=0.5; % enter scale for feedback weights

inFlag=1; % set input flag (1 for pulse, 2 for step)

cut=0; % set cut-off 
sat=1000; % set saturation

tEnd=100; % set the last time step value
nTs=tEnd+1; % find the number of time steps

x=zeros(nIn,nTs); % open (define) an input hold matrix
start=11; % set a start time for the input
if inFlag==1, % if the input should be a pulse
    x(:,start)=ones(nIn,1); % then set input at only one time point
elseif inFlag==2, % if the input instead should be a step, then 
    x(:,start:nTs)=ones(nIn,nTs-start+1); % keep it up until the end
end % end the conditional

y=zeros(nOut,nTs); % open (define) an output hold vector

V=randn(nOut,nIn); % construct random feed-forward weight matrix
W=randn(nOut)*scw;% construct and scale random feedback weight matrix

for t=2:nTs, % at every time step (skipping the first)
    y(:,t)=W*y(:,t-1) + V*x(:,t-1); % compute the output
    y(:,t)=max(y(:,t),cut); % impose the cut-off constraint
    y(:,t)=min(y(:,t),sat); % impose the saturation constraint
end % end the for loop

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot results (frills)
clf
subplot(221)
colormap([0 0 0])
mesh(V,'linewidth',2)
xlabel('in num','fontsize',14)
ylabel('out num','fontsize',14)
zlabel('feed-for wt','fontsize',14)
text(0.5,9,4,'A','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(222)
mesh(x)
axis([0 nTs 0 nIn 0 1.1]) 
xlabel('time step','fontsize',14)
ylabel('in num','fontsize',14)
zlabel('input','fontsize',14)
text(60,9,0.9,'C','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(223)
mesh(W,'linewidth',2)
xlabel('out num','fontsize',14)
ylabel('out num','fontsize',14)
zlabel('feed-bk wt','fontsize',14)
text(0.5,9,1.6,'B','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(224)
mesh(y)
axis([0 nTs 0 nOut 0 sat+10]) 
xlabel('time step','fontsize',14)
ylabel('out num','fontsize',14)
zlabel('output','fontsize',14)
text(5,9,900,'D','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)

% plot results (no frills)
% subplot(221)
% mesh(V)
% xlabel('in num')
% ylabel('out num')
% zlabel('weight')
% subplot(222)
% mesh(x)
% axis([0 nTs 0 nIn 0 1.1]) 
% xlabel('time step')
% ylabel('in num')
% zlabel('input')
% subplot(223)
% mesh(W)
% xlabel('out num')
% ylabel('out num')
% zlabel('weight')
% subplot(224)
% mesh(y)
% axis([0 nTs 0 nOut 0 sat+10]) 
% xlabel('time step')
% ylabel('out num')
% zlabel('output')


