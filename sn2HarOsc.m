% sn2HarOsc.m
% this script attempts a simulation of
% a harmonic oscillator using simple neurons

% set connection weights
v11=1;
v21=-10;
w11=1;
w12=-1;
w21=1;
w22=0;

% construct connectivity matrix
c=[v11,w11,w12;v21,w21,w22];

% set up inputs
tend=100;
t=1:tend;
x=zeros(1,tend);
start=tend/10;
x(start:tend)=ones(1,tend-start+1);

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
