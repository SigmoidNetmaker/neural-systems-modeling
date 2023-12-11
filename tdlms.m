% script tdlms.m
% this script updates state values 
% using the LMS algorithm; states
% and allowed transitions are as
% specified in tdgrid.m and sequences
% are generated using tdseq.m

% start clock
tic

% set number of epochs
epo=1000;
% epo=1;

% set holding vectors
vals=zeros(nr*nc,1);
count=zeros(nr*nc,1);
rms=zeros(epo/10,1);
valest=zeros(epo/10,nr*nc);

% do for all epochs
for k=1:epo,

	% generate a sequence 
	tdseq

	% set terminal reward
	[dum nst]=size(trj);
	if trj(nst)==tsr,
	   rew=1;
	elseif trj(nst)==tsp,
	   rew=-1;
	end

	% update values for the states in the sequence
	for i=1:nst-1,
	   count(trj(i))=count(trj(i))+1;
	   vals(trj(i))=vals(trj(i))+1/(count(trj(i))+1)*(rew-vals(trj(i)));
    end

%%%%%   older, more general version
% % % 	reverse the sequence and
% % % 	set terminal reward
% % % 	[dum nst]=size(trj);
% % % 	rew=zeros(nst,1);
% % % 	trj=fliplr(trj);
% % % 	if trj(1)==tsr,
% % % 	   rew(1)=1;
% % % 	elseif trj(1)==tsp,
% % % 	   rew(1)=-1;
% % % 	end
% % % 
% % % 	update values for the states in the sequence
% % % 	rtg=0;
% % % 	for i=1:nst,
% % %       rtg=rtg+rew(i);
% % % 	   count(trj(i))=count(trj(i))+1;
% % % 	   vals(trj(i))=vals(trj(i))+1/(count(trj(i))+1)*(rtg-vals(trj(i)));
% % %     end

   % find the difference between the computed values
   % and the exact values
   if rem(k,10)==0,
      difs=eval-vals;
      rms(k/10)=sqrt(mean(difs.^2));
      valest(k/10,:)=vals';
   end
   

end

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
title('LMS Reinforcement')
subplot(122)
plot(epos,rms)
xlabel('Epoch')
ylabel('RMS Error')
title('LMS Reinforcement')



