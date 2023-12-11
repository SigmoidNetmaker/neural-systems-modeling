% rbpShortTermMemSS.m
% this script explores the steady-state behavior of recurrent neural 
% networks trained using recurrent back-propagation to simulate short-
% term memory (this script uses values from rpbShortTermMemTrain.m)

b=1; % set bias
bg=0.01; % set background
sl=100; % set segment length
tVec=1:sl; % set time step vector
level=0.1:0.1:1; % set desired input item levels
Out=zeros(10,sl); % zero actual output array
gate=zeros(1,sl); % set gate input to zero
gate(sl/10)=1; % set the "in" gate

for l=1:10, % for each level 
    item=ones(1,sl)*bg; % set background of item input
    item(sl/10)=level(l); % set item level
    y=ones(nUnits,1)*bg; % set initial y value
    Out(l,1)=y(nUnits); % set first y output value
    z=[b;item(1);gate(1);y]; % set initial state
    for t=2:sl, % for each time step
        q=M*z; % compute weighted input sum
        y=1./(1+exp(-q)); % squash weighted sum
        Out(l,t)=y(nUnits); % store y output
        z=[b;item(t);gate(t);y]; % reset state
    end % end t loop
end % end l loop

% plot results
figure(4)
clf
plot(tVec,Out,'k','linewidth',2)
axis([0 sl 0 1])
xlabel('time steps','fontsize',14)
ylabel('output responses','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',12,'fontsize',14)
