% gridworldSetUp.m
% this script sets up the stochastic gridworld

nStates=12; % set number of states
stateVec=(1:12)'; % set a state number vector
r=zeros(nStates,1); % set a reinforcement vector
ProbMat=zeros(nStates); % define a probability matrix

tsr=12; % designate the terminal state of reward
tsp=8; % designate the terminal state of punishment
intReSt=7; % designate an intermediate state for reinforcement
r(tsr)=+1; % set reinforcement of reward terminal state
r(tsp)=-1; % set reinforcement of punishment terminal state
r(intReSt)=0; % set intermediate reinforcement if desired

% enter the transition matrix
TM = ...
[0  1  0  0  1  0  0  0  0  0  0  0
 1  0  1  0  0  0  0  0  0  0  0  0
 0  1  0  1  0  0  1  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  0  0
 1  0  0  0  0  0  0  0  1  0  0  0
 0  0  0  0  0  0  0  0  0  0  0  0
 0  0  1  0  0  0  0  0  0  0  1  0
 0  0  0  1  0  0  1  0  0  0  0  0
 0  0  0  0  1  0  0  0  0  1  0  0
 0  0  0  0  0  0  0  0  1  0  1  0
 0  0  0  0  0  0  1  0  0  1  0  0
 0  0  0  0  0  0  0  0  0  0  1  0];

% use the transition matrix to find the probability matrix
for j=1:nStates, % for each state
    indx=find(TM(:,j)~=0); % find indices of allowed next states
    if isempty(indx), prob=0; % if no next state assign zero prob  
    else prob=1/sum(TM(:,j)); end % else compute probability
    ProbMat(indx,j)=prob; % enter probability into prob matrix
end % end probability matrix loop

% solve for the exact state values
exVals=inv(ProbMat'-eye(nStates))*(-r);





% enter exact state values from book where r(intReSt)=0
exValsBook=[-0.2911; -0.4177; -0.5443; -0.7722; -0.1646;...
       0; -0.4430; -1; -0.0380; 0.0886; 0.2152; 1];
   
% compare solved values with book values
[exVals exValsBook]



 
 

 
 
 
