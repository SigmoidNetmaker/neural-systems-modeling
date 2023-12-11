% script tdmds.m
% this script produces a simulation of
% the mesencehpalic dopamine system

% set numbers of inputs, time steps, 
% and trials, and learning rate;
% zero weights and values
a=0.3;
ntrials=200;
ntimes=50;

x=zeros(ntimes,1);
y=zeros(ntimes,1);
v=zeros(ntimes,1);
r=zeros(ntimes,1);
z=zeros(ntimes,1);
tcourse=zeros(ntrials,ntimes);

% set time of cue and reward
qtime=10;
rtime=30;

% set input and reward vectors
x(qtime:rtime-1)=1;

% perform TD learning -- reward
% presentation times can be varied
for i=1:ntrials,
    r(rtime)=1;
    if i==ntrials/2, r(rtime)=0; end
    y=[0; diff(v.*x)];
    z=y+r;
    v=v+a*[z(2:ntimes);z(1)];
    tcourse(i,:)=z';
end
    
% plot out results
clf
mesh(tcourse)
view([-10,20])
title('Simulation of Mesencephalic Dopamine Neuron Responses')
xlabel('Time Step')
ylabel('Trial')
zlabel('TD Error')

