% avoidanceLearnCall.m
% this script models avoidance learning as a reinforcement learning 
% with two upper motoneurons (sumo and fumo) and one "call" neuron

nTrials=2000; % set number of learning trials 
a=0.005; % set learning rate
bprob=0.005; % set baseline probability of exploration
wsh=0; % set initial modifiable weight to sumo from hear
wfh=1; % set initial modifiable weight to fumo from hear
wch=0; % set initial modifiable weight to call from hear
hear=1; % set response of hear 

for c=1:nTrials, % for each trial of avoidance learning
    if c<=nTrials/10,   % if during pretrial interval
        rews=0; rewf=1; % set rewards for pretraining
    else                % if during training interval
        rews=1; rewf=0; % set rewards for training
    end % end reward set conditional
    call=wch*hear; % compute the response of call
    call=0;
    sumo=wsh*hear; % compute response of sumo
    fumo=wfh*hear; % compute response of fumo
    spin=sumo>fumo; % spin if sumo is larger than fumo
    prob=bprob+bprob*call; % compute probability of exploration
    if prob>rand, spin=1-spin; end % explore sometimes
    callrec(c)=call; % save responses of call
    sumorec(c)=sumo; % save responses of sumo
    fumorec(c)=fumo; % save responses of fumo
    spinrec(c)=spin; % save the spin actions
    if c<=nTrials/10,              % if pretraining
        pain=0;                    % no pain is delivered
    elseif c>nTrials/10 & spin==1, % if spin during training
        pain=0;                    % pain is avoided
    elseif c>nTrials/10 & spin==0, % if no spin during training
        pain=1;                    % pain is not avoided
    end % end pain conditional
    wch=wch+a*(pain-wch); % update the hear-call weight
    if spin==1,                  % if a spin was produced
        wsh=wsh+a*(rews-wsh);    % update the hear-sumo weight
    else                         % if the rabbit froze instead
        wfh=wfh+a*(rewf-wfh);    % update the hear-fumo weight
    end % end update conditional
end % end main training loop


% plot results
clf
trln=1:nTrials;
lnh=[nTrials/10 nTrials/10];
lnv=[-1 3];
plot(trln,callrec,'k-.',trln,sumorec,'k',trln,fumorec,'k--',...
    'linewidth',2)
indxspin=find(spinrec==1);
hold
plot(trln(indxspin),spinrec(indxspin)*1.3,'k.')
plot(lnh,lnv,'k','linewidth',2)
hold
axis([0 nTrials -0.3 2.5])
set(gca,'ytick',[0 1])
legend('call','sumo','fumo','spin',1)
xlabel('training cycles','fontsize',14)
ylabel('response                              ','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)





