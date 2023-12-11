% gaNonlinearHalfCPG.m
% this script attempts to train the half CPG oscillator using the
% genetic algorithm

% tEnd=500; % set end time
% tVec=0:tEnd; % set time vector
% nTs=tEnd+1; % find number of time steps
% x=zeros(1,nTs); % zero the input vector
% fly=51; % set time step to start flying
% land=450; % set time step to land again
% x(fly:land)=ones(1,land-fly+1); % make input
% v1=9; v2=0; % set weights from inputs
% V=[v1;v2]; % compose input weight matrix
% df=0.05; % enter desired oscillation frequency
% tb=1:land-fly+1; % enter time base for oscillating
% dsin=sin(2*pi*df*tb); % find desired sine component
% dcos=cos(2*pi*df*tb); % find desired cosine compoment
% dsin=dsin/norm(dsin); % normalize desired sine
% dcos=dcos/norm(dcos); % normalize desired cosine
% w11=1; w12=-12; w21=5; w22=1.1;
% W=[w11,w12;w21,w22]; % compose feedback weight matrix
% [eVec,eVal]=eig(W); % find eigenvalues and eigenvectors
% eVal=diag(eVal); % extract eigenvalues
% magEVal=abs(eVal); % find magnitude of eigenvalues
% angEVal=angle(eVal)./(2*pi); % find angles of eigenvalues
% y=zeros(2,nTs); % zero output vector
% for t=2:nTs, % for each time step
%     q=W*y(:,t-1) + V*x(t-1);  % compute weighted input sum
%     y(:,t)=1./(1+exp(-q)); % squash q to find output
% end  % end loop
% clf
% plot(tVec,x,'k-.',tVec,y(1,:),'k',tVec,y(2,:),'k--','linewidth',2.5)
% axis([1 tEnd -0.1 1.1])
% xlabel('time step','fontsize',14)
% ylabel('input and unit responses','fontsize',14)
% legend('input','unit one','unit two')
% set(gca,'linewidth',2)
% set(gca,'fontsize',14)
% angEVal
% return

popSize=30; % set the population size
pow=fliplr(0:4); % set powers for decoding
pw2=2.^pow'; % set powers of two for decoding genes
chromL=20; % set chromosome length
POP=rand(popSize,chromL)>0.5; % randomize initial population 
numGen=500; % set the number of generations
muRate=0.01; % set mutation rate
meanErr=zeros(1,numGen); % mean error hold vector

tEnd=500; % set end time
tVec=0:tEnd; % set time vector
nTs=tEnd+1; % find number of time steps
x=zeros(1,nTs); % zero the input vector
fly=51; % set time step to start flying
land=450; % set time step to land again
x(fly:land)=ones(1,land-fly+1); % make input
v1=9.5; v2=0; % set weights from inputs
V=[v1;v2]; % compose input weight matrix
df=0.23; % enter desired oscillation frequency
tb=1:land-fly+1; % enter time base for oscillating
dsin=sin(2*pi*df*tb); % find desired sine component
dcos=cos(2*pi*df*tb); % find desired cosine compoment
dsin=dsin/norm(dsin); % normalize desired sine
dcos=dcos/norm(dcos); % normalize desired cosine

for gen=1:numGen; % for each generation
    w11pop=(POP(:,1:5)*pw2)/2;
    w12pop=-(POP(:,6:10)*pw2)/2;
    w21pop=(POP(:,11:15)*pw2)/2;
    w22pop=(POP(:,16:20)*pw2)/2;
    error=zeros(1,popSize); % zero the error vector
    for chrom=1:popSize; % for each chromosome in the population
        w11=w11pop(chrom);
        w12=w12pop(chrom);
        w21=w21pop(chrom);
        w22=w22pop(chrom);
        w22=0;
        W=[w11,w12;w21,w22]; % compose feedback weight matrix
        y=zeros(2,nTs); % zero output vector
        for t=2:nTs, % for each time step
            q=W*y(:,t-1) + V*x(t-1);  % compute weighted input sum
            y(:,t)=1./(1+exp(-q)); % squash q to find output
        end  % end loop
        cpg=y(1,fly:land)-mean(y(1,fly:land));
        cpg=cpg/norm(cpg);
        error(chrom)=1-norm([dsin*cpg' dcos*cpg']);
    end % end phenotype evaluation loop
    meanErr(gen)=mean(error); % save the mean error
    if numGen==gen, break; end % don't change last generation
    normErr=error./sum(error); % normalize errors
    ranVec=rand(1,popSize); % generate random vector
    normRan=ranVec./sum(ranVec); % normalize random vector
    pertErr=normErr+normRan; % randomly perturb errors
    [theErrs,index]=sort(pertErr); % sort by perturbed errors
    dad1=POP(index(1),:); % dad1 has smallest perturbed error
    mom1=POP(index(2),:); % mom1 has second smallest error
    dad2=POP(index(3),:); % dad2 has third smallest error
    mom2=POP(index(4),:); % mom2 has fourth smallest error
    permSites=randperm(chromL-1); % randomly permute sites
    cos1=permSites(1); % find crossover site for couple 1 
    cos2=permSites(2); % find crossover site for couple 2
    son1=[dad1(1:cos1) mom1(cos1+1:chromL)]; % son 1
    dtr1=[mom1(1:cos1) dad1(cos1+1:chromL)]; % daughter 1
    son2=[dad2(1:cos2) mom2(cos2+1:chromL)]; % son 2
    dtr2=[mom2(1:cos2) dad2(cos2+1:chromL)]; % daughter 2
    POP(index(popSize),:)=son1; % replace least fit by son 1
    POP(index(popSize-1),:)=dtr1; % second least fit by dtr 1
    POP(index(popSize-2),:)=son2; % third least fit by son 2
    POP(index(popSize-3),:)=dtr2; % fourth least fit by dtr 2
    MUMX=rand(size(POP))<muRate;  % random mutation matrix
    POP=abs(POP-MUMX); % mutate the chromosomes
end % end loop over generations
[minErr,indME]=min(error); % find chromosome with minimal error

% plot error over generations and
% report most fit parameters and show performance
w11=w11pop(indME);
w12=w12pop(indME);
w21=w21pop(indME);
w22=w22pop(indME);
w22=0;
W=[w11,w12;w21,w22]; % compose feedback weight matrix
y=zeros(2,nTs); % zero output vector
for t=2:nTs, % for each time step
    q=W*y(:,t-1) + V*x(t-1);  % compute weighted input sum
    y(:,t)=1./(1+exp(-q)); % squash q to find output
end  % end loop


minErr
W

% plot results
clf
subplot(311)
plot(meanErr,'k','linewidth',2)
axis([1 numGen 0 Inf])
xlabel('generation number','fontsize',14)
ylabel('mean error','fontsize',14)
text(1.5,460,'A','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)
subplot(312)
plot(tVec,x,'k-.',tVec,y(1,:),'k',tVec,y(2,:),'k--')
axis([1 tEnd -0.1 1.1])
xlabel('time step','fontsize',14)
ylabel('input and unit responses','fontsize',14)
legend('input','unit one','unit two')
set(gca,'linewidth',2)
set(gca,'fontsize',14)
subplot(313)
plot(tVec(201:250),y(1,201:250),'k','linewidth',2)
axis([201, 250 -0.1 1.1])
xlabel('time step','fontsize',14)
ylabel('unit one','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)

return

w11=0.9; w12=-0.44; % set weights to unit one
w21=0.43; w22=0.9; % set weights to unit two

[eVec,eVal]=eig(W); % find eigenvalues and eigenvectors
eVal=diag(eVal); % extract eigenvalues
magEVal=abs(eVal); % find magnitude of eigenvalues
angEVal=angle(eVal)./(2*pi); % find angles of eigenvalues
[eVec eVal magEVal angEVal] % show eigenvectors, eigenvalues, magnitude



