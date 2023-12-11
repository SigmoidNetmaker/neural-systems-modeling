% velocityStoreLeak.m
% this script implements the parallel-pathway and 
% positive feedback models of velocity storage, and
% the negative feedback model of velocity leakage

v1=1; v2=0.18; % set weights from the input
w11=0; w12=0.2; % set feedback weights to unit one
w21=0.; w22=0.95; % set feedback weights to unit two

V=[v1;v2]; % compose input weight matrix (vector)
W=[w11 w12;w21 w22]; % compose feedback weight matrix

tEnd=100; % set end time
tVec=0:tEnd; % set time vector
nTs=tEnd+1; % find number of time steps
dkc=0.9; % set input geometric decay constant
x=(dkc).^(tVec); % generate input

y=zeros(2,nTs); % zero the output vector
for t=2:nTs,  % do for each time step
    y(:,t)=W*y(:,t-1) + V*x(t-1); % compute output
end  % end loop



% plot results
clf
plot(tVec,x,'k-.',tVec,y(1,:),'k',tVec,y(2,:),'k--','linewidth',2.5)
% axis([0 tEnd 0 1.05])
xlabel('time step','fontsize',14)
ylabel('input and unit responses','fontsize',14)
legend('input','unit one','unit two')
set(gca,'linewidth',2)
set(gca,'fontsize',14)

return

% parallel-pathway model of velocity storage
v1=1; v2=0.18; w11=0; w12=0.2; w21=0; w22=0.95; dkc=0.9;
% positive-feedback model of velocity storage
v1=1; v2=0; w11=0; w12=0.2; w21=0.2; w22=0.9; dkc=0.9;
% negative-feedback model of velocity leakage
v1=1; v2=0; w11=0; w12=-0.2; w21=0.2; w22=0.9; dkc=0.95;



