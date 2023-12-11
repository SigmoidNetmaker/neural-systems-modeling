% oneUnitWithPosFB.m
% this script simulates a single model neuron with positive feedback

% set input flag (1 for impulse, 2 for step)
inFlag=1; 

cut=-Inf; % set cut-off
sat=Inf; % set saturation

tEnd=100; % set last time step
nTs=tEnd+1; % find the number of time steps

v=1; % set the input weight
w=0.95; % set the feedback weight

x=zeros(1,nTs); % open (define) an input hold vector
start=11; % set a start time for the input
if inFlag==1, % if the input should be a pulse
    x(start)=1; % then set the input at only one time point
elseif inFlag==2, % if the input instead should be a step, then 
    x(start:nTs)=ones(1,nTs-start+1); % keep it up until the end
end % end the conditional

y=zeros(1,nTs); % open (define) an output hold vector

for t=2:nTs, % at every time step (skipping the first)
    y(t)=w*y(t-1) + v*x(t-1); % compute the output
    if y(t)<cut, y(t)=cut; end % impose the cut-off constraint
    if y(t)>sat, y(t)=sat; end % impose the saturation constraint
end % end the for loop


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot results (frills)
lw=3; % set line width
fs=18; % set font size
tBase=0:tEnd; % set time base vector

clf
subplot(2,1,1)
plot(tBase,x,'k','linewidth',lw)
axis([0 tEnd 0 1.1])
xlabel('time step','fontsize',fs)
ylabel('input','fontsize',fs)
text(2,0.92,'A','fontsize',fs+2) 
set(gca,'fontsize',fs)
set(gca,'linewidth',lw)

subplot(2,1,2)
plot(tBase,y,'k','linewidth',lw)
% axis([0 tEnd 0 12])
axis([0 tEnd 0 1.1])
xlabel('time step','fontsize',fs)
ylabel('output','fontsize',fs)
text(2,0.92,'B','fontsize',fs+2) 
% text(2,9.95,'B','fontsize',fs) 
set(gca,'fontsize',fs)
set(gca,'linewidth',lw)

% plot results (no frills)
% clf
% subplot(2,1,1)
% plot(tBase,x)
% axis([0 tEnd 0 1.1])
% xlabel('time step')
% ylabel('input')
% subplot(212)
% plot(tBase,y)
% % axis([0 tEnd 0 12])
% xlabel('time step')
% ylabel('output')

