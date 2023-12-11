% WilsonCPG.m
% this script implements a linear version of Wilson's 
% locust flight central pattern generator (CPG)

v1=0; v2=1; v3=0; v4=0; % set input weights
w11=0.9; w12=0.2; w13=0; w14=0; % feedback weights to unit one
w21=-0.95; w22=0.4; w23=-0.5; w24=0; % weights to unit two
w31=0; w32=-0.5; w33=0.4; w34=-0.95; % weights to unit three
w41=0; w42=0; w43=0.2; w44=0.9; % feedback weights to unit four
V=[v1;v2;v3;v4]; % compose input weight matrix (vector)
W=[w11 w12 w13 w14;w21 w22 w23 w24; % compose feedback...
   w31 w32 w33 w34;w41 w42 w43 w44]; % weight matrix

tEnd=100; % set end time
tVec=0:tEnd; % set time vector
nTs=tEnd+1; % find number of time steps
x=zeros(1,nTs); % zero input vector
fly=11; % set time to start flying
x(fly)=1; % set input to one at fly time

y=zeros(4,nTs); % zero output vector
for t=2:nTs, % for each time step
    y(:,t)=W*y(:,t-1) + V*x(t-1); % compute output
end % end loop

[eVec,eVal]=eig(W); % find eigenvalues and eigenvectors
eVal=diag(eVal); % extract eigenvalues
magEVal=abs(eVal); % find magnitude of eigenvalues
angEVal=angle(eVal)./(2*pi); % find angles of eigenvalues
[eVec eVal magEVal angEVal] % show eigenvectors, eigenvalues, magnitude


% plot results (units y2 and y3 only)
clf
plot(tVec,x,'k-.',tVec,y(2,:),'k',tVec,y(3,:),'k--','linewidth',2.5)
axis([0 tEnd -0.6 1.1])
xlabel('time step','fontsize',14)
ylabel('input and unit responses','fontsize',14)
legend('input','left motoneuron','right motoneuron')
set(gca,'fontsize',14)
set(gca,'linewidth',2)


figure(2)
plot(tVec,y(1,:),'b',tVec,y(2,:),'b',tVec,y(3,:),'r',tVec,y(4,:),'r')
