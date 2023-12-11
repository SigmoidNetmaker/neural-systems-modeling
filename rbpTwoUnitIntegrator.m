% rbpTwoUnitIntegrator.m
% this script uses recurrent back-propagation to train a recurrent
% network of two linear units to act as leaky integrators

nOut=2; % set number of output units
a=0.005; % set learning rate 
nIts=100; % set number of training cycles
vAb=0.5; % set desired input weight absolute value
wAb=0.495; % set desired recurrent weight absolute value
V=[1,-1;-1,1]*vAb; % set desired input weight matrix
W=[1,-1;-1,1]*wAb; % set desired recurrent weight matrix
M=[V W]; % assemble desired connectivity matrix
tEnd=500; % set end time
xHld=zeros(2,tEnd+1); % zero input hold vector
xHld(1,tEnd/10+1)=1; % set positive input
xHld(2,tEnd/10+1)=-1; % set negative input
dHld=zeros(nOut,tEnd+1); % zero desired output hold vector
for t=2:tEnd+1, % for each time step
    z=[xHld(:,t-1);dHld(:,t-1)]; % set the state vector
    dHld(:,t)=M*z; % find the desired output
end % end loop for computing desired output

M=(rand(nOut,2+nOut)-0.5)*0.02; % randomize connectivity matrix
H=zeros(nOut,2+nOut,nOut); % zero partial derivative matrices
for c=1:nIts, % for each training cycle
    if rand<0.5, x=xHld; d=dHld; % randomly choose direction of ...
    else x=xHld*(-1); d=dHld*(-1); end % input and desired output
    z=[x(:,1);0;0]; % initialize unit state vector
    for t=2:tEnd+1, % for each time step
        y=M*z; % find responses of output units
        e=d(:,t)-y; % find error
        Hpre=H; % save the partial matrices
        H=H-H; % zero the partial matrices
        for k=1:nOut, % for both output units
            for l=1:nOut, % for both output units
                hld=M(k,l+2)*Hpre(:,:,l); % weight each H matrix
                hld(k,:)=hld(k,:)+z'; % add state vector to row k
                H(:,:,k)=H(:,:,k)+hld; % accumulate sum
            end % end l loop
        end % end k loop
        deltaM=M-M; % zero weight-update matrix
        for k=1:nOut, % for both output units
            deltaM=deltaM+e(k)*H(:,:,k); % find weight-update matrix
        end % end k loop
        deltaM=a*deltaM; % scale weight changes by learning rate
        M=M+deltaM; % update the connectivity matrix
        z=[x(:,t);y]; % update unit state vector
    end % end t (time step) loop
end % end c (training) loop



% observe final output
Out=zeros(nOut,tEnd+1); % zero y matrix
z=[xHld(:,1);0;0]; % set initial state
Out(:,1)=[0;0]; % set first output value
for t=2:tEnd+1, % for each time step
    Out(:,t)=M*z; % compute output
    z=[xHld(:,t);Out(:,t)]; % reset state
end % end t loop
% plot results 
tVec=0:tEnd; % set time vector
clf
plot(tVec,Out(1,:),'k',tVec,Out(2,:),'k--',tVec,d,'k-.','linewidth',2.5)
axis([0 tEnd -1.1 1.1])
xlabel('time steps','fontsize',14)
ylabel('output responses','fontsize',14)
legend('actual output one','actual output two','desired (for both)')
set(gca,'linewidth',2)
set(gca,'fontsize',14)
M % show connectivity matrix
        



