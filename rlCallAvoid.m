% script rlCallAviod.m
% this script models avoidance learning
% as a reinforcement learning problem;
% this version only simulates training
% with one tone, two upper motoneurons,
% and one "call" neuron
%

% set parameters for reinforcement learning
ntrials=2000; % set number of trials 
alpha=0.005; % set learning rate for call
beta=0.005; % set learning rate for the upmos
bprob=0.005; % set baseline probability of innovation

% set rewards
rspr=0; % reward for spin pretraining
rstr=1; % reward for spin during training
rfpr=1; % reward for freeze pretraining
rftr=0; % reward for freeze during training

% set baseline input weights
bhc=1; % for hear to call
bhs=1; % for hear to spin
bhf=1; % for hear to freeze

% set initial values of modifiable weights
whc=0;
whs=0;
whf=1;

% set response of sensory neurons
hear=1; % for hearing

% train the network
for i=1:ntrials, % do for each trial
   % set the rewards for the current trial
   if i<=ntrials/10,
      rews=rspr; rewf=rfpr;
   else
      rews=rstr; rewf=rftr;
   end
   
   % compute the responses of the call and upper motoneurons
   call=(whc+bhc)*hear; % compute the response of call
   % call=1;
   supmo=(whs+bhs)*hear; % compute response of spin upmo
   fupmo=(whf+bhf)*hear; % compute response of freeze upmo
   
   % decide if a spin will be produced (spin=1 means spin)
   spin=supmo>fupmo; % spin if supmo is larger than fupmo
   prob=bprob+bprob*(call-1); % compute the probability of innovation
   if prob>rand, spin=1-spin; end % innovate sometimes
   
   % save upper motoneuron responses and spins
   callrec(i)=call; % for call
   supmorec(i)=supmo; % for spin upmo
   fupmorec(i)=fupmo; % for freeze upmo
   spinrec(i)=spin; % for the action itself
   
   % update weight from hear to call
   if i<=ntrials/10,              % pretraining
      pain=0;                     % no pain is delivered
   elseif i>ntrials/10 & spin==1, % spin during training
      pain=0;                     % pain is avoided
   elseif i>ntrials/10 & spin==0, % no spin during training
      pain=1;                     % pain is not avoided
   end
   whc=whc+alpha*(pain-whc); % update the hear-call weight
   
   % update weights from hear to supmo or fupmo
   if spin==1,                  % if a spin was produced
      whs=whs+beta*(rews-whs); % update the hear-supmo weight
   else                         % if the rabbit froze instead
      whf=whf+beta*(rewf-whf); % update the hear-freeze weight
   end
   
end % end main loop

% plot results
clf
trln=1:ntrials;
lnh=[ntrials/10 ntrials/10];
lnv=[0 3];
plot(trln,callrec,'k-.',trln,supmorec,'k',trln,fupmorec,'k--',...
    'linewidth',2)
indxspin=find(spinrec==1);
hold
plot(trln(indxspin),spinrec(indxspin)*2.3,'k.')
plot(lnh,lnv,'k','linewidth',2)
hold
axis([0 ntrials 0 3.8])
legend('call','spin upmo','freeze upmo','spin action',1)
xlabel('training cycles','fontsize',14)
ylabel('response                  ','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)





