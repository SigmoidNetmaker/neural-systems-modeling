% sn1posFB.m
% this script sets up a simple, single
% model neuron with positive feedback;
% parameters:
% v: input weight
% w: feedback weight
% x: input vector
% y: output vector
% t: time vector
% tend: last time point
% inflag: input flag

% set input flag
% (1 for impulse, 2 for step)
inflag=1; 

% enter cut-off and saturation
cut=0;
sat=10;

% set time step and end time in seconds
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

% find outputs
for i=2:nts,
    y(i)=w*y(i-1) + v*x(i-1);
    if y(i)<cut, y(i)=0; end
    if y(i)>sat, y(i)=sat; end
end

% plot results
clf
subplot(211)
plot(t,x)
axis([0 tend 0 1.1])
xlabel('time step')
ylabel('input')
title('Single Unit With Positive Feedback')
subplot(212)
plot(t,y)
% axis([0 tend 0 12])
xlabel('time step')
ylabel('output')

