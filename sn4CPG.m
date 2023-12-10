% sn4CPG.m
% this script attempts to simulate
% the locust flight CPG

% set connections
v11=0;
v21=1;
v31=0;
v41=0;
w11=0.9;
w12=0.2;
w13=0;
w14=0;
w21=-0.95;
w22=0.4;
w23=-0.5;
w24=0;
w31=0;
w32=-0.5;
w33=0.4;
w34=-0.95;
w41=0;
w42=0;
w43=0.2;
w44=0.9;


% construct connectivity matrix
c=[v11,w11,w12,w13,w14;...
    v21,w21,w22,w23,w24;...
    v31,w31,w32,w33,w34;
    v41,w41,w42,w43,w44];

% set up inputs
tend=100;
t=1:tend;
x=zeros(1,tend);
start=tend/10;
x(start:tend)=ones(1,tend-start+1);
% x(start:40)=ones(1,31);
% x(start)=1;

% set up outputs
y=zeros(4,tend);

% find outputs
for i=2:tend,
    z=[x(i-1);y(:,i-1)];
    y(:,i)=c*z;
end

% plot results (units y2 and y3 only)
clf
plot(t,x,t,y(2,:),t,y(3,:))
title('Simulation of the Flight Control CPG')
xlabel('time step')
ylabel('input and responses of y2 and y3')

% plot results (all units)
% clf
% subplot(211)
% plot(t,x,t,y(2,:),t,y(3,:))
% subplot(212)
% plot(t,x,t,y(1,:),t,y(4,:))

% find modes, stability (magnitude)
% and controlability of network
a=c(:,2:5);
b=c(:,1);
[evec,eval]=eig(a);
eiga=diag(eval);
maga=abs(eiga);
convec=inv(evec)*b;
tol=0.00000001;
convec=abs(convec)>tol;
[eiga maga convec]


