% sn2Raphan.m
% this script attempts a rough simulation
% of velocity storage as modeled by Raphan; 
% it has one input and two neurons

% set connection weights
v1=1;
v2=0.18;
w11=0;
w12=0.2;
w21=0;
w22=0.95;

% set geometric decay
% (nice for storage: gdk=0.9)
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
title('Parallel Pathway Model of Velocity Storage')
xlabel('time step')
ylabel('input and outputs')
