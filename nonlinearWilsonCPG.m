% nonlinearWilsonCPG.m
% this script attempts to implement a nonlinear version
% of Wilson's model of the locust flight CPG

% set input connection weights
V=[0 12 11.9 0]';

% set recurrent connection weights
W=[ 1    3    0    0
  -12    1   -6    0
    0   -6    1  -12 
    0    0    3    1];

% set up inputs
tEnd=500; % set end time
tVec=0:tEnd; % set time vector
nTs=tEnd+1; % find the number of time steps
x=zeros(1,nTs); % zero input vector
fly=11; % set time step to start flying
land=351; % set time step to land again
x(fly:land)=ones(1,land-fly+1); % make input

% find outputs
y=zeros(4,nTs); % zero output vector
for t=2:nTs, % for each time step
    q=W*y(:,t-1) + V*x(t-1);  % compute weighted input sum
    y(:,t)=1./(1+exp(-q)); % squash q to find output
end  % end loop 

% find modes, stability (magnitude)
% and controlability of network
% (note: the stability criterion is
% different for nonlinear networks)
[eVec,eVal]=eig(W); % find eigenvalues and eigenvectors
eVal=diag(eVal); % extract eigenvalues
magEVal=abs(eVal); % find magnitude of eigenvalues
angEVal=angle(eVal)./(2*pi); % find angles of eigenvalues

% plot results 
clf
plot(tVec,x,tVec,y)
axis([0 tEnd 0 1.1])
legend('input','left leak','left moto','right moto','right leak',1)
title('Nonlinear Flight Control CPG')
xlabel('time step')
ylabel('input and unit responses')
text(170,0.1,'fly')
text(410,0.1,'land')



