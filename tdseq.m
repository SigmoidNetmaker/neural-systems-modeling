% script tdseq.m
% this script generates a
% state transition sequence
% using the states and allowed
% transitions specified by
% the script tdgrid.m

% set terminal states and
% terminal state flag
tsr=12;
tsp=8;
tsf=0;

%set start state to 1
st=1;
trjc=[coor(st,:)]';
trj=st;

% generate a trajectory, 
% starting at state 1,1
while tsf==0; % do until a terminal state is reached
   indx=find(tm(:,st)~=0); % find allowed transition states
   [nin dum]=size(indx); % count allowed transition states
   dum=randperm(nin); % generate a random order
   st=indx(dum(1)); % choose one allowed state at random
   trj=[trj st]; % add new state to the state trajectory
   trjc=[trjc coor(st,:)']; % also add coordinates of state
   if st==tsr | st==tsp, % check if new state is terminal
      tsf=1;             % if so, set terminal state flag
   end
end
trjc=trjc';


