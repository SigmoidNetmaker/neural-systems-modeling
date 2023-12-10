% sn1posFB.m
% this script sets up a simple, single
% model neuron with positive feedback;
% parameters:
% v: input weight
% w: feedback weight
% c: connectivity matrix
% x: input vector
% y: output vector
% yc: current output
% yp: previous output
% z: state vector
% t: time vector
% tend: last time point
% inflag: input flag

% set input flag
% (1 for impulse, 2 for step)
inflag=1; 

% set time step, time constant,
% and end time in seconds
% (tau should be at least ten 
% times greater than del)
tend=100;
t=0:tend;
nts=tend+1;

% set feedback and input weights
v=1;
w=0.95;

% set up input
x=zeros(1,nts);
start=(nts-1)/10+1;
if inflag==1,
    x(start)=1;
elseif inflag==2,
    x(start:nts)=ones(1,nts-start+1);
end

% set up outputs
y=zeros(1,nts);

% construct connectivity matrix
c=[v,w];

% find outputs
for i=2:nts,
    z=[x(i-1);y(i-1)];
    y(i)=c*z;
end

% plot results
clf
subplot(211)
plot(t,x)
axis([0 tend 0 1.1])
xlabel('time step')
ylabel('input')
title('Single Linear Unit With Positive Feedback')
subplot(212)
plot(t,y)
if inflag==1
    axis([0 tend 0 1.1])
elseif inflag==2
    axis([0 tend 0 22])
end
xlabel('time step')
ylabel('output')

