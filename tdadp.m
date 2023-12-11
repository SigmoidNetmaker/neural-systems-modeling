% script tdadp.m
% this script updates state values 
% using the ADP algorithm; states
% and allowed transitions are as
% specified in tdgrid.m 

% start clock
tic

% set number of epochs,
% learning rate, etc
epo=100;

% set holding vectors
vals=zeros(nr*nc,1);
vals(tsr)=1; vals(tsp)=-1;
count=zeros(nr*nc,1);
rms=zeros(epo/10,1);
valest=zeros(epo/10,nr*nc);

% do for all epochs
for k=1:epo,
   tsf=0; % zero terminal state flag 
   st=1; % start epoch at state 1
   rew=0; % set non-terminal state reward
   while tsf==0,
      indx=find(tm(:,st)~=0);
      prob=1/sum(tm(:,st));
      vals(st)=rew+sum(prob*vals(indx));
      [nin dum]=size(indx);
      dum=randperm(nin);
      st=indx(dum(1));
      if st==tsr | st==tsp,
         tsf=1;
    	end
  	end % end of while loop, end of one epoch

   % find the difference between the computed values
   % and the exact values
   if rem(k,10)==0,
      difs=eval-vals;
      rms(k/10)=sqrt(mean(difs.^2));
      valest(k/10,:)=vals';
   end
end % end of epo epochs

% stop clock
toc

% output results
[coor eval vals]
clf
epos=1:10:epo;
subplot(121)
plot(epos,valest)
axis([0 epo -1.1 1.1]);
xlabel('Epoch')
ylabel('State Value Estimates')
title('ADP Reinforcement')
subplot(122)
plot(epos,rms)
xlabel('Epoch')
ylabel('RMS Error')
title('ADP Reinforcement')



