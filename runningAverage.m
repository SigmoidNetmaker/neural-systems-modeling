% runningAverage.m
% this script implements a running average of a noise series

mn=5; % set mean of noise series
var=20; % set variance of noise
sd=sqrt(var); % find the noise standard deviation
nObs=100; % set the number of noise values in the series
o=randn(1,nObs)*sd+mn; % generate Gaussian noise series
NoiseMean=mean(o) % find the mean of the noise
o=[0 o]; % pad the noise vector with a zero
v=zeros(1,nObs+1); % define hold vector for running average
kg=zeros(1,nObs+1); % define hold vector for correction gain
v(1)=0; % set initial condition for running average
kg(1)=1; % set initial correction gain value
for n=2:nObs+1; % for each noise value
    kg(n)=1/(n-1); % update correction gain value
    v(n)=v(n-1) + (o(n)-v(n-1))*kg(n); % running average
end % end running average loop
EndRunAvg=v(nObs+1) % grab the last value of running average


% plot results
clf
subplot(311)
plot(1:nObs,o(2:nObs+1),'k','linewidth',2)
ylabel('noise','fontsize',14)
text(95,14.5,'A','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(312)
plot(1:nObs+1,v,'k','linewidth',2)
axis([0 nObs+1 0 10])
ylabel('running avg','fontsize',14)
text(95,8.5,'B','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

subplot(313)
plot(1:nObs+1,kg,'k','linewidth',2)
axis([0 nObs+1 0 1.05])
ylabel('corr weight','fontsize',14)
xlabel('time step','fontsize',14)
text(95,0.88,'C','fontsize',14)
set(gca,'fontsize',14)
set(gca,'linewidth',2)

