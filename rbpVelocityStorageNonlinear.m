% rbpVelocityStorageNonlinear.m
% this script uses recurrent back-propagation to train a nonlinear 
% recurrent network to perform velocity storage

nHid=4; % set number of hidden units (there are two inputs and outputs)
a=6; % set learning rate (0.1 or 6)
nIts=10000; % set number of training cycles
tEndDK=30; % set end time for each decay
tDK=0:tEndDK-1; % set timebase for each decay
tEnd=tEndDK*2; % set end time for whole time course
tauC=1; % set canal time constant (in time steps)
tauV=4; % set VOR time constant (in time steps)
xdkC=exp(-tDK/tauC); % compute canal exponential decay
xdkV=exp(-tDK/tauV); % compute VOR exponential decay
canUP=[ones(1,5)*0.5,0.5+xdkC(1:tEndDK-5)*0.1]; % set up input
canDN=[ones(1,5)*0.5,0.5-xdkC(1:tEndDK-5)*0.1]; % set down input
vorUP=[ones(1,7)*0.5,0.5+xdkV(1:tEndDK-7)*0.1]; % set up desired out
vorDN=[ones(1,7)*0.5,0.5-xdkV(1:tEndDK-7)*0.1]; % set down desired out
xHld=[canUP,canDN;canDN,canUP]; % assemble input hold array
dHld=[vorDN,vorUP;vorUP,vorDN]; % assemble desired output array
M=(rand(nHid+2,nHid+4)-0.5)*2; % randomize and scale weight matrix
H=zeros(nHid+2,nHid+4,nHid+2); % zero partial derivative matrix
Msk=ones(nHid+2,nHid+4); % set masking matrix
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

y=ones(nHid+2,1)*0.5; % initialize hidden and output state vector
for c=1:nIts, % for each training cycle
    sel=ceil(2*rand); % randomly set selector
    if sel==1, x=xHld; d=dHld; % if sel is one then set first driven
    elseif sel==2,    % if selector is two then
        x=[xHld(2,:);xHld(1,:)];     % set second
        d=[dHld(2,:);dHld(1,:)]; end % driven pattern
    z=[x(:,1);y]; % initialize whole state vector
    for t=2:tEnd, % for each time step
        q=M*z; % find weighted input sums to hiddens and outputs
        y=1./(1+exp(-q)); % squash weighted sums to hid and out
        e=d(:,t)-y(nHid+1:nHid+2); % compute error
        Hpre=H; H=H-H; % save and zero the partial matrices
        for k=1:nHid+2, % for all hidden and output units
            for l=1:nHid+2, % for all hidden and output units
                hld=M(k,l+2)*Hpre(:,:,l); % weight each H matrix
                hld(k,:)=hld(k,:)+z'; % add state vector to row k
                H(:,:,k)=H(:,:,k)+hld;  % accumulate sum
            end % end l loop
            dSquash=y(k)*(1-y(k)); % derivative of squash
            H(:,:,k)=H(:,:,k)*dSquash; % scale by dSquash
        end % end k loop
        deltaM=M-M; % zero weight change matrix
        for k=nHid+1:nHid+2, % for both output units
            deltaM=deltaM+e(k-nHid)*H(:,:,k); % find delta M
        end % end k loop
        deltaM=a*deltaM.*Msk; % scale and mask weight changes
        M=M+deltaM; % update the connectivity matrix
        W=M(1:nHid,3:nHid+2); % extract hidden-hidden weights
        W=min(W,0); % eliminate positive weights
        M(1:nHid,3:nHid+2)=W; % replace hidden-hidden weights
        z=[x(:,t);y]; % update state vector
    end % end t (time step) loop
end % end c (training) loop


% observe unit responses
Out=zeros(nHid+2,tEnd); % zero y matrix
Out(:,1)=y; % set first y output value
z=[xHld(:,1);y]; % set initial state vector
for t=2:tEnd, % for each time step
    q=M*z; % compute weighted input sum
    y=1./(1+exp(-q)); % squash weighted sum
    Out(:,t)=y; % store y output
    z=[xHld(:,t);y]; % reset state
end % end t loop

% compute and display SRs and gains
srVals=(Out(1:nHid,1))';
maxVals=max(Out(1:nHid,:)');
gainVals=(maxVals-srVals)/0.1;
srVals
gainVals

% plot results (ins/outs and hiddens)
tVec=1:tEnd; % set whole time course vector
clf
subplot(211)
plot(tVec,Out(nHid+1:nHid+2,:),'k',...
    tVec,x,'k-.',tVec,d,'k--','linewidth',2.5)
axis([0 tEnd 0.39 0.61])
ylabel('inputs and outputs','fontsize',14)
text(57,0.587,'A','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)
subplot(212)
plot(tVec,Out(1:nHid/2,:),'k',tVec,Out(nHid/2+1:nHid,:),'k--',...
    'linewidth',2.5)
% axis([0 tEnd 0.19 0.65]) % for LR low
% axis([0 tEnd 0 0.45]) % for LR high
axis([0 tEnd 0 0.55]) % for four hidden units
xlabel('time steps','fontsize',14)
ylabel('hidden units','fontsize',14)
% text(57,0.61,'B','fontsize',14) % for LR low
% text(57,0.41,'B','fontsize',14) % for LR high
text(57,0.49,'B','fontsize',14) % for four hidden units
set(gca,'linewidth',2)
set(gca,'fontsize',14)
M % show connectivity matrix

        
