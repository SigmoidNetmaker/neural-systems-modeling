% script tdtdu.m
% this script updates state values 
% using the TD algorithm; states
% and allowed transitions are as
% specified in tdgrid.m 

% start clock
tic

% set number of epochs,
% learning rate, etc
epo=1000;
lr=0.1;
dec=0.999;
% dec=1;
% epo=1;

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
      count(st)=count(st)+1;
      indx=find(tm(:,st)~=0);
   	[nin dum]=size(indx);
      dum=randperm(nin);
      newst=indx(dum(1));
      if newst==tsr | newst==tsp,
         tsf=1;
    	end
      vals(st)=vals(st)+(lr*dec^count(st))*...
         (rew+vals(newst)-vals(st));
      st=newst;
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
title('TD Reinforcement')
subplot(122)
plot(epos,rms)
xlabel('Epoch')
ylabel('RMS Error')
title('TD Reinforcement')







