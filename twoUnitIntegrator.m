% twoUnitIntegrator.m
% this script implements the two-unit integrator model

bg=0; % set background
v11=1; v12=0; % set weights to unit one from inputs
v21=0; v22=1; % set weights to unit two from inputs
w11=0.5; w12=-0.499; % set feedback weights to unit one 
w21=-0.499; w22=0.5; % set feedback weights to unit two
V=[v11 v12;v21 v22]; % compose input weight matrix
W=[w11 w12;w21 w22]; % compose feedback weight matrix

tEnd=1000; % set end time
tVec=0:tEnd; % set time vector
nTs=tEnd+1; % find number of time steps
x=ones(2,nTs)*bg; % zero input array
x(1,101)=x(1,101)+1; % set "push" input
x(2,101)=x(2,101)-1; % set "pull" input

y=zeros(2,nTs); % zero the output vector
for t=2:nTs,  % do for each time step
    y(:,t)=W*y(:,t-1) + V*x(:,t-1);  % compute output 
end  % end loop

[eVec,eVal]=eig(W); % find eigenvalues and eigenvectors
eVal=diag(eVal); % extract eigenvalues
magEVal=abs(eVal); % find magnitude of eigenvalues
[eVec eVal magEVal] % show eigenvectors, eigenvalues, magnitude


% plot results
clf
plot(tVec,x,'k-.',tVec,y(1,:),'k',tVec,y(2,:),'k--','linewidth',2.5)
axis([0 tEnd bg-1.1 bg+1.1])
xlabel('time step','fontsize',14)
ylabel('input and unit responses','fontsize',14)
legend('input one','input two','unit one','unit two',4)
set(gca,'linewidth',2)
set(gca,'fontsize',14)

