% avoidanceLearn.m
% this script models avoidance learning as reinforcement learning
% with two upper motoneurons: sumo (for spin) and fumo (for freeze)

nTrials=2000; % set number of learning trials
preTrInt=800; % set pretraining interval
a=0.01; % set learning rate
bprob=0.005; % set baseline probability of exploration
wsh=0; % set initial modifiable weight to sumo from hear
wfh=0; % set initial modifiable weight to fumo from hear
hear=1; % set response of hear

for c=1:nTrials, % for each trial of avoidance learning
    if c<=preTrInt,     % if during pretrial interval
        rews=0; rewf=1; % set rewards for pretraining
    else                % if during training interval
        rews=1; rewf=0; % set rewards for training
    end % end reward set conditional
    sumo=wsh*hear; % compute response of sumo
    fumo=wfh*hear; % compute response of fumo
    spin=sumo>fumo; % spin if sumo is larger than fumo
    prob=bprob; % set exploration probability to its baseline
    if prob>rand, spin=1-spin; end % explore sometimes
    sumorec(c)=sumo; % save responses of sumo
    fumorec(c)=fumo; % save responses of fumo
    spinrec(c)=spin; % save the spin actions
    if spin==1,               % if a spin was produced
        wsh=wsh+a*(rews-wsh); % update the hear-sumo weight
    else                      % if the rabbit froze instead
        wfh=wfh+a*(rewf-wfh); % update the hear-fumo weight
    end % end update conditional
end % end main training loop



% plot results
clf
trln=1:nTrials;
lnh=[preTrInt preTrInt];
lnv=[-1 3];
plot(trln,sumorec,'k',trln,fumorec,'k--','linewidth',2)
indxspin=find(spinrec==1);
hold all
plot(trln(indxspin),spinrec(indxspin)*1.3,'k.')
plot(lnh,lnv,'k','linewidth',2)
axis([0 nTrials -0.3 2])
set(gca,'ytick',[0 1])
legend('sumo','fumo','spin',1)
xlabel('training cycles','fontsize',14)
ylabel('response                    ','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

