% midDopeRanRew.m
% this script simulates the mesencehpalic dopamine system

a=0.3; % set learning rate
nTrials=200; % set number of trials
nTimes=50; % set number of time points per trial

x=zeros(nTimes,1); % set input unit vector
y=zeros(nTimes,1); % set difference unit vector
v=zeros(nTimes,1); % set weigth (value) vector
r=zeros(nTimes,1); % set reward vector
z=zeros(nTimes,1); % set prediction unit vector
Tcourse=zeros(nTrials,nTimes); % time course hold array

qTime=10; % set time of cur
rTime=30; % set reference reward time

x(qTime:rTime-1)=1; % set input responses

for tr=1:nTrials, % for each learning trail
    r=zeros(nTimes,1); % set reward vector
    % rJitter=rTime-ceil(6*rand)-1;
    rJitter=rTime-ceil(3*rand); % jitter the reward time
    r(rJitter)=1; % set the reward at reward time
    y=[0; diff(v.*x)]; % find the response of difference unit
    z=y+r; % find the response of prediction error unit
    v=v+a*x.*[z(2:nTimes);0]; % update the weights (values)
    Tcourse(tr,:)=z'; % save the prediction unit time course
end % end learning trial loop

% plot out results
fs=14; % set font size
lw=2; % set line width
clf
mesh(Tcourse)
view([10,20])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('time step')
ylabel('trial')
zlabel('prediction error')

