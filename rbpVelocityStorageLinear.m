% rbpVelocityStorageLinear.m
% this script uses recurrent back-progation to train a linear 
% recurrent network to perform velocity storage

nHid=2; % set number of hidden units (there are two inputs and outputs)
a=0.01; % set learning rate
nIts=100; % set number of training cycles
tEndDK=30; % set end time for each decay
tDK=0:tEndDK-1; % set timebase for each decay
tEnd=tEndDK*2; % set end time for whole time course
tauC=1; % set canal time constant (in time steps)
tauV=4; % set VOR time constant (in time steps)
xdkC=exp(-tDK/tauC); % compute canal exponential decay
xdkV=exp(-tDK/tauV); % compute VOR exponential decay
canUP=[zeros(1,5),+xdkC(1:tEndDK-5)]; % set up input
canDN=[zeros(1,5),-xdkC(1:tEndDK-5)]; % set down input
vorUP=[zeros(1,7),+xdkV(1:tEndDK-7)]; % set up desired output
vorDN=[zeros(1,7),-xdkV(1:tEndDK-7)]; % set down desired output
xHld=[canUP,canDN;canDN,canUP]; % assemble input hold array
dHld=[vorDN,vorUP;vorUP,vorDN]; % assemble desired output array
M=(rand(nHid+2,nHid+4)-0.5)*0.02; % randomize and scale weight matrix 
H=zeros(nHid+2,nHid+4,nHid+2); % zero partial derivative matrix
Msk=ones(nHid+2,nHid+2); % set masking matrix
Msk(nHid+1:nHid+2,1:2)=zeros(2); % zero input-output weights
Msk(1:nHid+2,3+nHid:3+nHid+1)=zeros(nHid+2,2); % weights from outputs
Msk(nHid+1:nHid+2,3:3+nHid-1)=zeros(2,nHid); % hidden-output weights
Msk(1:nHid/2,3:3+nHid/2-1)=zeros(nHid/2); % hidden same-side weights
Msk(nHid/2+1:nHid,3+nHid/2:3+nHid-1)=zeros(nHid/2); % hid same-side wts
M=M.*Msk; % mask connectivity matrix
uAb=2/nHid; % set hidden-output scale factor
U=ones(1,nHid/2)*uAb; % set and scale hidden-output weight submatrix
U=[-U,U;U,-U]; % set whole hidden-output matrix
M(nHid+1:nHid+2,3:nHid+2)=U; % insert hidden-output weights into M

y=zeros(nHid+2,1); % initialize hidden and output state vector
for c=1:nIts, % for each training cycle
    sel=ceil(2*rand); % randomly set selector
    if sel==1, x=xHld; d=dHld; % if one then set first driven
    elseif sel==2,    % if selector is two then
        x=[xHld(2,:);xHld(1,:)];     % set second
        d=[dHld(2,:);dHld(1,:)]; end % driven pattern
    z=[x(:,1);y]; % initialize whole state vector
    for t=2:tEnd, % for each time step
        y=M*z; % find responses of hidden and output units
        e=d(:,t)-y(nHid+1:nHid+2); % compute error
        Hpre=H; H=H-H; % save and zero the partial matrices
        for k=1:nHid+2, % for all hidden and output units
            for l=1:nHid+2, % for all hidden and output units
                hld=M(k,l+2)*Hpre(:,:,l); % weight each H matrix
                hld(k,:)=hld(k,:)+z'; % add state vector to row k
                H(:,:,k)=H(:,:,k)+hld;  % accumulate sum
            end % end l loop
        end % end k loop
        deltaM=M-M; % zero delta connectivity matrix
        for k=nHid+1:nHid+2, % for both output units
            deltaM=deltaM+e(k-nHid)*H(:,:,k); % find delta M
        end % end k loop
        deltaM=a*deltaM.*Msk; % apply learning rate and mask to changes
        M=M+deltaM; % update the connectivity matrix
        W=M(1:nHid,3:nHid+2); % extract hidden-hidden weights
        W=min(W,0); % eliminate positive weights
        M(1:nHid,3:nHid+2)=W; % replace hidden-hidden weights
        z=[x(:,t);y]; % update state vector
    end % end t loop
end % end c (training) loop



% observe hidden and output unit responses
Out=zeros(nHid+2,tEnd); % zero y matrix
Out(:,1)=y; % set first y output value
z=[xHld(:,1);y]; % set initial state
for t=2:tEnd, % for each time step
    y=M*z; % compute output
    Out(:,t)=y; % store y output
    z=[xHld(:,t);y]; % reset state
end % end t loop

% compute and display SRs and gains
srVals=(Out(1:nHid,1))';
maxVals=max(Out(1:nHid,:)');
gainVals=(maxVals-srVals)/0.1;
srVals
gainVals

% plot results
tVec=1:tEnd; % set whole time course vector
clf
subplot(211)
plot(tVec,Out(nHid+1:nHid+2,:),'k',...
    tVec,x,'k-.',tVec,d,'k--','linewidth',2.5)
axis([0 tEnd -1.1 1.1])
ylabel('inputs and outputs','fontsize',14)
text(57,0.85,'A','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)
subplot(212)
plot(tVec,Out(1:nHid/2,:),'k',tVec,Out(nHid/2+1:nHid,:),'k--',...
    'linewidth',2.5)
xlabel('time steps','fontsize',14)
ylabel('hidden units','fontsize',14)
text(57,0.4,'B','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)
M % show connectivity matrix
        
