% NleakSeries.m
% this script sets up N units, with positive feedback, in series;

% set number of model neurons
n=25;

% set time step, time constant,
% and end time in seconds
tEnd=1000;
tVec=0:tEnd;
nTs=tEnd+1;

% set feedback and input weights
V=[1;zeros(n-1,1)];
wmain=ones(1,n)*0.95;
woff=ones(1,n-1)*0.05;
W=diag(wmain,0)+diag(woff,-1);

% set up input
x=zeros(1,nTs);
start=101;
x(start)=1;

% set up outputs
y=zeros(n,nTs);

% find outputs
for t=2:nTs,
    y(:,t)=W*y(:,t-1) + V*x(t-1);
end

[eVec,eVal]=eig(W); % find eigenvalues and eigenvectors
eVal=diag(eVal); % extract eigenvalues
magEVal=abs(eVal); % find magnitude of eigenvalues
[eVec eVal magEVal] % show eigenvectors, eigenvalues, magnitude

% plot results
clf
subplot(311)
plot(tVec,x)
ylabel('input pulse')
title('Pulse Response of Many Leaks in Series')
subplot(312)
plot(tVec,y)
ylabel('all units')
subplot(313)
plot(tVec,y(n,:))
ylabel('last unit')
xlabel('time step')
