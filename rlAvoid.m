% script rlAviod.m
% this script models avoidance learning
% as a reinforcement learning problem
% based on two upper motoneurons: 
% sumo (for spin) and fumo (for freeze)
% 

% set parameters for reinforcement learning
ntrials=2000; % set number of trials 
preTrInt=800; % set pretraining interval
alpha=0.01; % set learning rate 
bprob=0.05; % set baseline probability of innovation 

% set rewards
rspr=0; % reward for spin pretraining
rstr=1; % reward for spin during training
rfpr=1; % reward for freeze pretraining
rftr=0; % reward for freeze during training

% set baseline input weights
bhs=1; % for hear to spin
bhf=1; % for hear to freeze

% set initial values of modifiable weights
whs=0;
whf=0;

% set response of sensory neurons
hear=1; % for hearing

% train the network
for i=1:ntrials, % do for each trian
   % set the rewards for the current trial
   if i<=preTrInt,
      rews=rspr; rewf=rfpr;
   else
      rews=rstr; rewf=rftr;
   end
   
   % compute the responses of the upper motoneurons
   sumo=(whs+bhs)*hear; % compute response of spin upmo
   fumo=(whf+bhf)*hear; % compute response of freeze upmo
   
   % decide if a spin will be produced (spin=1 means spin)
   spin=sumo>fumo; % spin if sumo is larger than fumo
   prob=bprob; % set inovation probability to its baseline 
   if prob>rand, spin=1-spin; end % innovate sometimes
   
   % save upper motoneuron responses and spins
   sumorec(i)=sumo; % for spin upmo
   fumorec(i)=fumo; % for freeze upmo
   spinrec(i)=spin; % for the action itself
   
   % update weights from hear to sumo or fumo
   if spin==1,                  % if a spin was produced
      whs=whs+alpha*(rews-whs); % update the hear-sumo weight
   else                         % if the rabbit froze instead
      whf=whf+alpha*(rewf-whf); % update the hear-freeze weight
   end
   
end % end main loop



% plot results
clf
trln=1:ntrials;
lnh=[preTrInt preTrInt];
lnv=[0 3];
plot(trln,sumorec,'k',trln,fumorec,'k--','linewidth',2)
indxspin=find(spinrec==1);
hold all
plot(trln(indxspin),spinrec(indxspin)*2.3,'k.')
plot(lnh,lnv,'k','linewidth',2)
axis([0 ntrials 0 3.4])
legend('sumo','fumo','spin',1)
xlabel('training cycles','fontsize',14)
ylabel('response                  ','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

