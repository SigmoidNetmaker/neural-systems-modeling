% rbpShortTermMemTrain.m
% this script uses real-time recurrent back-propagation to train a 
% recurrent neural network model to simulate short-term memory 

nUnits=8; % set number of units
b=1; % set bias
commonBwt=-2.5; % set common bias weight
a=0.1; % set learning rate
nIts=100000; % set number of training iterations
pGate=0.5; % set proportion of gates
M=(rand(nUnits,nUnits+3)-0.5)*2; % randomize connectivity matrix
M(:,1)=ones(nUnits,1)*commonBwt; % set common bias weights
H=zeros(nUnits,nUnits+3,nUnits); % zero partial derivative matrix
Msk=ones(nUnits,nUnits+3); % set masking matrix to all ones
Msk(:,1)=zeros(nUnits,1); % mask out bias weights

item=0.01; itemPre=item; % set initial and previous item
gate=0.00; gatePre=gate; % set initial and previous gate
dout=0.01; doutPre=dout; % set initial and previous desired output
y=ones(nUnits,1)*itemPre; % set initial y value
z=[b;item;gate;y]; % initialize state vector
for c=2:nIts, % for each training cycle
    q=M*z; % find weighted input sums to hidden and output units
    y=1./(1+exp(-q)); % squash weighted sums to hid and out
    e=dout-y(nUnits); % compute error
    Hpre=H; H=H-H; % save then zero the partial matrices
    for k=1:nUnits, % for all hidden and output units
        for l=1:nUnits, % for all hidden and output units
            hld=M(k,l+3)*Hpre(:,:,l); % weight each H matrix
            hld(k,:)=hld(k,:)+z'; % add state vector to row k
            H(:,:,k)=H(:,:,k)+hld; % accumulate sum
        end % end l loop
        dSquash=y(k)*(1-y(k)); % derivative of squash
        H(:,:,k)=H(:,:,k)*dSquash; % scale by dSquash
    end % end k loop
    deltaM=e*H(:,:,nUnits); % find delta M
    deltaM=a*deltaM.*Msk; % apply learning rate and mask delta M
    M=M+deltaM; % update the connectivity matrix
    item=rand; % set new item at a random value 
    if gatePre==1, % if the gate had been open...
       dout=itemPre; % then set desired output to previous item...
       gate=0; % and zero the gate
    elseif gatePre==0; % if the gate had not been open...
       dout=doutPre; % then keep the previous desired output
       gate=rand<pGate; % probabilistically open the gate
    end % end item gating procedure
    z=[b;item;gate;y]; % update state vector
    itemPre=item; gatePre=gate; doutPre=dout; % store previous values
end % end c (training) loop



