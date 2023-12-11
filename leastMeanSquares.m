% leastMeanSquares.m
% this script updates state values using the LMS algorithm
% note: script gridworldSetUp must be run first

nEpo=1000; % set number of epochs

v=zeros(nStates,1); % define estimated state values vector
v(tsr)=r(tsr); v(tsp)=r(tsp); % set terminal state values
count=zeros(nStates,1); % define update count holding vector
vEst=zeros(ceil(nEpo/10+1),nStates); % define value hold array
rms=zeros(ceil(nEpo/10+1),1); % define RMS error hold array
vEst(1,:)=v'; % save initial state values 
rms(1)=sqrt(mean((exVals-v).^2)); % save initial RMS error

for epo=1:nEpo, % do for all epochs
   tsf=0; % zero terminal state flag 
   st=1; % start epoch at state one
   trj=st; % set the first state of the trajectory
   while tsf==0, % while terminal state flag equals zero
       indx=find(TM(:,st)~=0); % find indices of allowed next states
       nIndx=length(indx); % find the number of allowed next states
       choose=ceil(rand*nIndx); % choose an index at random
       nextSt=indx(choose); % choose the next state at random
       if nextSt==tsr | nextSt==tsp, tsf=1; end % check if terminal
       st=nextSt; % set current state to next state
       trj=[trj st]; % add new state to the state trajectory
   end % end of trajectory
   lTrj=length(trj); % find the length (in states) of trajectory
   rTrj=zeros(lTrj,1); % set up the reinforcement trajectory
   trj=fliplr(trj); % reverse the order of the state trajectory
   if trj(1)==tsr, rTrj(1)=r(tsr); % set end-state reward ...
   elseif trj(1)==tsp, rTrj(1)=r(tsp); end % or punishment
   rTrj(find(trj==intReSt))=r(intReSt); % intermediate reinforcement 
   rtg=0; % zero the reward-to-go
   for tr=1:lTrj, % for each transition on (reversed) trajectory
       rtg=rtg+rTrj(tr); % increment the reward to go
       v(trj(tr))=v(trj(tr))+... % update the state values ...
           (rtg-v(trj(tr)))/(count(trj(tr))+1); % via LMS
       count(trj(tr))=count(trj(tr))+1; % increment the counter
   end % end trajectory update loop
   if rem(epo,10)==0, % every ten epochs
       vEst(epo/10+1,:)=v'; % save value estimates 
       rms(epo/10+1)=sqrt(mean((exVals-v).^2)); % save rms error
   end % end conditional
end % end of nEpo epochs



% output results
[stateVec exVals v]

% plot results
if nEpo<10, return, end
fs=14; % set font size
lw=2; % set line width
hold=exVals([1 2 3 4 5 7 9 10 11])';
plotExVals=[hold;hold];
clf
testEpo=0:10:nEpo;
subplot(121)
plot(testEpo,vEst(:,[1 2 3 4 5 7 9 10 11]),'k',...
    [0 nEpo],plotExVals,'k--','linewidth',1.5)
% axis([0 nEpo -1 0.6]);
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('epoch')
ylabel('state values')
text(850,0.52,'A','fontsize',fs)
subplot(122)
plot(testEpo,rms,'k','linewidth',lw)
% axis([0 nEpo 0 0.4])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('epoch')
ylabel('RMS error')
text(850,0.38,'B','fontsize',fs)












