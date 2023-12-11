% midDopeLMS.m
% this script simulates the midbrain dopamine system
% using least mean squares learning or simple tracking

a=0.8; % set learning rate
nTrials=20; % set number of trials
nTimes=5; % set number of time points per trial

vLMS=zeros(1,nTimes); % set weigths for LMS
vRL=zeros(1,nTimes);% set weights for RL
TcourseLMS=zeros(nTrials,nTimes); % LMS time course
TcourseRL=zeros(nTrials,nTimes); % RL time course

count=0; % zero counter

for tr=1:nTrials, % for each learning trail
    rtg=1; % set the reward to go
    if tr==10, rtg=0; end % withold reward once
    vLMS=vLMS+(rtg-vLMS)/(count+1); % via least mean squares
    count=count+1; % increment the counter
    vRL=vRL + a*(rtg-vRL); % via simple reinforcement tracking 
    TcourseLMS(tr,:)=vLMS; % save the LMS values
    TcourseRL(tr,:)=vRL; % save the RL values
end % end learning trial loop

TcourseLMS
TcourseRL

figure(1)
mesh(TcourseLMS)
figure(2)
mesh(TcourseRL)


