% tonotopicSOM.m
% this script produces a tonotopically orgaized central 
% auditory map using the basic Kohonen algorithm

nIn=20; % set the number of input units
nOut=10; % set the number of output units
a=2; % set the learning rate
dec=0.99; % set the learning rate decrement
nHood=1; % set the neighborhood size
nIts=500; % set the number of iterations
qf=3; % set the quality factor

cf=linspace(1,2,nIn); % set evenly spaced central frequencies
%%% cf=[linspace(1.0,1.385,7) linspace(1.45,1.55,6)... % alternat
%%% linspace(1.615,2.0,7)]; % set of cf's with expanded midrange
V=rand(nOut,nIn); % set initially random connectivity matrix
for c=1:nIts, % for each learning iteration
   tf=rand+1; % choose a test frequency at random
   x=exp(-abs(cf-tf)*qf); % compute the input pattern for tf
   y=V*x'; % compute output to chosen input pattern
   [winVal winIndx]=max(y); % find the index of the winning output
   fn=winIndx-nHood; % find first neighbor in training neighborhood
   ln=winIndx+nHood; % find last neighbor in training neighborhood
   if fn < 1, fn=1; end % keep first neighbor in bounds
   if ln > 10, ln=nOut; end % keep last neighbor in bounds
   for h=fn:ln, % for all units in training neighborhood
      hld=V(h,:)+a*x; % apply Kohonen update
      V(h,:)=hld/norm(hld); % normalize new weight vector
      a=a*(dec); % decrement the learning rate
   end % end neighbor training loop
end % end learning loop

Out=zeros(10); % declare an output array
tfVec=linspace(1,2,10); % set test frequencies
for f=1:10, % for each test frequency
   x=exp(-abs(cf-tfVec(f))*qf); % compute the input
   Out(f,:)=(V*x')'; % compute the output
end % end test loop



clf
subplot(121)
plot(tfVec,Out,'k','linewidth',2)
axis square
axis([1 2 0.25 3])
set(gca,'xtick',[1 1.25 1.5 1.75 2])
set(gca,'fontsize',14)
set(gca,'linewidth',2)
xlabel('test frequency','fontsize',14)
ylabel('output responses','fontsize',14)
text(1.05,2.7,'A','fontsize',14)
subplot(122)
colormap([0 0 0])
mesh(1:10,tfVec,Out,'linewidth',2)
axis square
axis([1 10 1 2 0.25 3])
set(gca,'fontsize',14)
set(gca,'linewidth',2)
xlabel('out num','fontsize',14)
ylabel('test freq','fontsize',14)
zlabel('output responses','fontsize',14)
text(0.5,1.8,3,'B','fontsize',14)


