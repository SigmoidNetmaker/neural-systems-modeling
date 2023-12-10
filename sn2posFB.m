% sn2posFB.m
% this script sets up two simple model neurons, 
% with positive feedback, in series;

% set time vector and number of time steps
tend=100;
t=0:tend;
nts=tend+1;

% set feedback and input weights
v11=1;
v21=0;
w11=0.95;
w12=0;
w21=0.5;
w22=0.6;

% set up input
x=zeros(1,nts);
start=(nts-1)/10+1;
x(start)=1;

% set up outputs
y=zeros(2,nts);

% construct connectivity matrix
c=[v11,w11,w12;v21,w21,w22];

% find outputs
for i=2:nts,
    z=[x(i-1);y(:,i-1)];
    y(:,i)=c*z;
end

% plot results
clf
subplot(211)
plot(t,x)
axis([0 tend 0 1.1])
xlabel('time step')
ylabel('input')
title('Two Linear Units With Positive Feedback')
subplot(212)
plot(t,y)
xlabel('time step')
ylabel('outputs')
axis([0 tend 0 1.1])

