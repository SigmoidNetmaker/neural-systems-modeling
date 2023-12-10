% sn2Integrator.m
% this script verifies recurrent
% networks of two units receiving
% two inputs

% set background
bg=0;

% set feedback and feedforward
% scale factors
wsc=0.99;
vsc=0.5;

% construct connectivity matrix
v11=1;
v12=0;
v21=0;
v22=1;
w11=0.5;
w12=-0.495;
w21=-0.495;
w22=0.5;
c=[v11,v12,w11,w12;v21,v22,w21,w22];

% set up inputs
tend=1000;
t=0:tend;
x=ones(2,tend+1)*bg;
x(1,tend/10+1)=x(1,tend/10+1)+1;
x(2,tend/10+1)=x(2,tend/10+1)-1;
% x(1,tend/10+1:tend)=x(1,tend/10+1:tend)+1;
% x(2,tend/10+1:tend)=x(2,tend/10+1:tend)-1;

% set up outputs
y=zeros(2,tend+1);

% find outputs
for i=2:tend+1,
    z=[x(:,i-1);y(:,i-1)];
    y(:,i)=c*z;
end

% plot results
clf
subplot(211)
plot(t,x)
axis([0 tend bg-1.1 bg+1.1])
xlabel('time step')
ylabel('input')
title('Leaky Integration in a Reciprocal Network')
subplot(212)
plot(t,y)
% axis([0 tend bg-1.1 bg+1.1])
xlabel('time step')
ylabel('output')
