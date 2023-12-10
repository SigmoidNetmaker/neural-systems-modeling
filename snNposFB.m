% NleakSeries.m
% this script sets up N units, with positive feedback, in series;

% set number of model neurons
n=25;

% set time step, time constant,
% and end time in seconds
tend=1000;
t=0:tend;
nts=tend+1;

% set feedback and input weights
v=[1;zeros(n-1,1)];
wmain=ones(1,n)*0.95;
woff=ones(1,n-1)*0.05;
w=diag(wmain,0)+diag(woff,-1);

% construct connectivity matrix
c=[v,w];

% set up input
x=zeros(1,nts);
start=(nts-1)/10+1;
x(start)=1;

% set up outputs
y=zeros(n,nts);

% find outputs
for i=2:nts,
    z=[x(i-1);y(:,i-1)];
    y(:,i)=c*z;
end

% plot results
clf
subplot(311)
plot(t,x)
subplot(312)
plot(t,y)
subplot(313)
plot(t,y(n,:))
