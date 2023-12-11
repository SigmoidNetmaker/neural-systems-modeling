% halfCPG.m
% this script attempts the half CPG oscillator

v1=1; v2=0; % set weights from inputs
w11=0.9; w12=-0.44; % set weights to unit one
w21=0.43; w22=0.9; % set weights to unit two
V=[v1;v2]; % compose input weight matrix
W=[w11 w12;w21 w22]; % compose feedback weight matrix

tEnd=100; % set end time
tVec=0:tEnd; % set time vector
nTs=tEnd+1; % find number of time steps
x=zeros(1,nTs); % zero the input vector
start=11; % set the input start time 
x(start)=1; % set the input pulse at start time

y=zeros(2,nTs); % zero the output vector
for t=2:nTs,  % do for each time step
    y(:,t)=W*y(:,t-1) + V*x(t-1);
end  % end loop

[eVec,eVal]=eig(W); % find eigenvalues and eigenvectors
eVal=diag(eVal); % extract eigenvalues
magEVal=abs(eVal); % find magnitude of eigenvalues
angEVal=angle(eVal)./(2*pi); % find angles of eigenvalues
[eVec eVal magEVal angEVal] % show eigenvectors, eigenvalues, magnitude

% plot results
clf
plot(tVec,x,'k-.',tVec,y(1,:),'k',tVec,y(2,:),'k--','linewidth',2.5)
xlabel('time step','fontsize',14)
ylabel('input and unit responses','fontsize',14)
legend('input','unit one','unit two')
set(gca,'linewidth',2)
set(gca,'fontsize',14)



