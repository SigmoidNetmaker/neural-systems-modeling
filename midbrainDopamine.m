% midbrainDopamine.m
% this script simulates the midbrain dopamine system

a=0.3; % set learning rate
nTrials=200; % set number of trials
nTimes=50; % set number of time steps per trial

x=zeros(nTimes,1); % define input unit vector
y=zeros(nTimes,1); % define difference unit vector
v=zeros(nTimes,1); % define weight (value estimate) vector
r=zeros(nTimes,1); % define reward vector
z=zeros(nTimes,1); % define prediction unit vector
Tcourse=zeros(nTrials,nTimes); % define time course hold array

qTime=10; % set time of cue
rTime=30; % set time of reward

x(qTime:rTime-1)=1; % set input responses

for c=1:nTrials, % for each learning trial
    r(rTime)=1; % set the reward at reward time
    if c==nTrials/10, r(rTime)=0; end % withhold reward once
    y=[0; diff(v.*x)]; % find the response of difference unit
    z=y+r; % find the response of prediction error unit
    v=v+a*x.*[z(2:nTimes);0]; % update the weights (values)
    Tcourse(c,:)=z'; % save the prediction unit time course
end % end learning trial loop




[x(1:31) v(1:31) y(1:31) r(1:31) z(1:31)]


% plot out results
fs=14; % set font size
lw=2; % set line width
clf
colormap([0 0 0])
mesh(Tcourse)
view([10,20])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('time step')
ylabel('trial')
zlabel('prediction error')

