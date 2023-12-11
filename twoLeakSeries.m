% twoLeakSeries.m
% this script sets up two units in series with positive feedback

v1=1; v2=0; % set weights from the input
w11=0.95; w12=0; % set feedback weights to unit one
w21=0.5; w22=0.6; % set feedback weights to unit two
V=[v1;v2]; % compose input weight matrix (vector)
W=[w11 w12;w21 w22]; % compose feedback weight matrix

tEnd=100; % set end time
tVec=0:tEnd; % set time vector
nTs=tEnd+1; % find number of time steps
x=zeros(1,nTs); % zero the input vector
start=11; % set the input start time 
x(start)=1; % set the input pulse at start time

y=zeros(2,nTs); % zero the output vector
for t=2:nTs,  % do for each time step
    y(:,t)=W*y(:,t-1) + V*x(t-1); % compute output
end  % end loop

[eVec,eVal]=eig(W); % find eigenvalues and eigenvectors
eVal=diag(eVal); % extract eigenvalues
magEVal=abs(eVal); % find magnitude of eigenvalues
[eVec eVal magEVal] % show eigenvectors, eigenvalues, stability


% plot results
clf
plot(tVec,x,'k-.',tVec,y(1,:),'k',tVec,y(2,:),'k--','linewidth',2.5)
axis([0 tEnd 0 1.05])
xlabel('time step','fontsize',14)
ylabel('input and unit responses','fontsize',14)
legend('input','unit one','unit two')
set(gca,'linewidth',2)
set(gca,'fontsize',14)



