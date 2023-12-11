% script rlDisAv.m
% this script models discriminative avoidance 
% learning as a reinforcement learning problem;
% this version simulates two upper motoneurons
% and one "call" neuron
%

% set call flag
callflag=1; % 1 for intact, 0 for lesion 

% set parameters for reinforcement learning
ntrials=2000; % set number of trials 
alpha=0.01; % set learning rate for call
beta=0.01; % set learning rate for the upmos
bprob=0.1; % set baseline probability of innovation
eprob=0.1; % set maximum extra probability

% set auditory responses (note overlap)
h1csp=0.5; h1csm=0.1; % for h1
h2csp=0.1; h2csm=0.5; % for h2
hncsp=0.4; hncsm=0.4; % for hn

% set baseline input weights
bhc=1; % for hear to call
bhs=1; % for hear to spin
bhf=1; % for hear to freeze

% set initial values of modifiable weights
whc1=0; whc2=0; whcn=0; % for the hear-call weights
whs1=0; whs2=0; whsn=0; % for the hear-spin weights
whf1=1; whf2=1; whfn=1; % for the hear-freeze weights

% train the network
for i=1:ntrials, % do for each trial
   
   % first deliver the cs minus
   % set the auditory responses
   h1=h1csm; % for h1
   h2=h2csm; % for h2
   hn=hncsm; % for hn
   pain=0; % no shock and no pain
   rews=0; % no reward for a step
   rewf=1; % best to freeze
   
   % compute the responses of the call and upper motoneurons
   call=whc1*h1+whc2*h2+whcn*hn+bhc*(h1+h2+hn); % for call
   supmo=whs1*h1+whs2*h2+whsn*hn+bhs*(h1+h2+hn); % for spin upmo
   fupmo=whf1*h1+whf2*h2+whfn*hn+bhf*(h1+h2+hn); % for freeze upmo
   
   % apply callflag
   call=call*callflag;

   % save cs minus responses 
   creccsm(i)=call; % for call
   sreccsm(i)=supmo; % for spin upmo
   freccsm(i)=fupmo; % for freeze upmo
      
   % decide if a spin will be produced (spin=1 means spin)
   spin=supmo>fupmo; % spin if supmo is larger than fupmo
   prob=bprob+eprob*(call-1); % compute innovation probability  
   if callflag==0, prob=bprob; end % no boost without call
   if prob>rand, spin=1-spin; end % innovate sometimes
   
   % update weights from hear to call
   whc1=whc1+alpha*(pain-whc1)*h1; % for whc1
   whc2=whc2+alpha*(pain-whc2)*h2; % for whc2
   whcn=whcn+alpha*(pain-whcn)*hn; % for whcn

   % update weights from hear to supmo or fupmo
   if spin==1,                       % if a spin was produced
      whs1=whs1+beta*(rews-whs1)*h1; % update hear-supmo weights
      whs2=whs2+beta*(rews-whs2)*h2;
      whsn=whsn+beta*(rews-whsn)*hn;
   else                              % if the rabbit froze instead
      whf1=whf1+beta*(rewf-whf1)*h1; % update hear-fupmo weights
      whf2=whf2+beta*(rewf-whf2)*h2;
      whfn=whfn+beta*(rewf-whfn)*hn;
   end                          
   
   % next deliver the cs plus
   % set the auditory responses
   h1=h1csp; % for h1
   h2=h2csp; % for h2
   hn=hncsp; % for hn
   
   % compute the responses of the call and upper motoneurons
   call=whc1*h1+whc2*h2+whcn*hn+bhc*(h1+h2+hn); % for call
   supmo=whs1*h1+whs2*h2+whsn*hn+bhs*(h1+h2+hn); % for spin upmo
   fupmo=whf1*h1+whf2*h2+whfn*hn+bhf*(h1+h2+hn); % for freeze upmo

   % apply callflag
   call=call*callflag;

   % save cs plus responses 
   creccsp(i)=call; % for call
   sreccsp(i)=supmo; % for spin upmo
   freccsp(i)=fupmo; % for freeze upmo
      
   % decide if a spin will be produced (spin=1 means spin)
   spin=supmo>fupmo; % spin if supmo is larger than fupmo
   prob=bprob+eprob*(call-1); % compute innovation probability  
   if callflag==0, prob=bprob; end % no boost without call
   if prob>rand, spin=1-spin; end % innovate sometimes
   
   % update weight from hear to call
   if i<=ntrials/10,              % pretraining
      pain=0;                     % no pain is delivered
   elseif i>ntrials/10 & spin==1, % spin during training
      pain=0;                     % pain is avoided
   elseif i>ntrials/10 & spin==0, % no spin during training
      pain=1;                     % pain is not avoided
   end
   whc1=whc1+alpha*(pain-whc1)*h1; % for whc1
   whc2=whc2+alpha*(pain-whc2)*h2; % for whc2
   whcn=whcn+alpha*(pain-whcn)*hn; % for whcn
   
   % set the rewards for the current trial
   if i<=ntrials/10, % in the pretraining interval
      rews=0; rewf=1; % no shock, best to stay still
   else               % during training
      rews=1; rewf=0; % for the the cs plus
   end
   
   % update weights from hear to supmo or fupmo
   if spin==1,                       % if a spin was produced
      whs1=whs1+beta*(rews-whs1)*h1; % update hear-supmo weights
      whs2=whs2+beta*(rews-whs2)*h2;
      whsn=whsn+beta*(rews-whsn)*hn;
   else                              % if the rabbit froze instead
      whf1=whf1+beta*(rewf-whf1)*h1; % update hear-fupmo weights
      whf2=whf2+beta*(rewf-whf2)*h2;
      whfn=whfn+beta*(rewf-whfn)*hn;
   end    
   
end % end main loop

% plot results
clf
trln=1:ntrials;
lnh=[ntrials/10 ntrials/10];
lnv=[0 2.5];
plot(trln,creccsp,'g',trln,creccsm,'g--',...
   trln,sreccsp,'r',trln,sreccsm,'r--',...
   trln,freccsp,'b',trln,freccsm,'b--')
hold
plot(lnh,lnv,'k')
hold
axis([0 ntrials 0.8 2.5])
set(gca,'ytick',[1 1.5 2])
set(gca,'yticklabel','1|1.5|2')
xlabel('training cycles')
ylabel('response size')
text(220,2.2,'start training')
legend('call cs+','call cs-','spin upmo cs+','spin upmo cs-',...
   'freeze upmo cs+','freeze upmo cs-')








