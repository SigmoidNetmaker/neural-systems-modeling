% sn2VelStorLeak.m
% this script attempts a rough simulation
% of velocity storage and leakage; it has 
% one input and two neurons

% set connection weights
% (nice for storage: w12=0.2, w21=0.2, w22=0.9)
% (nice for leakage: w12=-0.2, w21=0.2, w22=0.9)
v1=1;
v2=0;
w11=0;
w12=0.2;
w21=0.2;
w22=0.9;

% set geometric decay
% (nice for storage: gdk=0.9)
% (nice for leakage: gdk=0.95)
gdk=0.9;

% construct connectivity matrix
c=[v1,w11,w12;v2,w21,w22];

% set up inputs
tend=100;
t=1:tend;
x=(gdk).^(t-1);

% set up outputs
y=zeros(2,tend);

% find outputs
for i=2:tend,
    z=[x(i-1);y(:,i-1)];
    y(:,i)=c*z;
end

% plot results
clf
plot(t,x,'-.',t,y(1,:),t,y(2,:),'--')
axis([0 tend 0 1.05])
title('Feedback Model of Velocity Leakage')
xlabel('time step')
ylabel('input and outputs')
