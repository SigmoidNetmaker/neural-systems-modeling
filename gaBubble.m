% gaBubble.m
% this script uses the genetic algorithm with binary chromosomes
% to optimize the activity bubble network

nUnits=51; % set number of units in network
s=-25:25; % set space vector for network and input
V=eye(nUnits); % set input matrix (same for all)
signal=zeros(nUnits,1); % set input signal baseline
signal(25:27)=ones(3,1); % set input pulse
popSize=15; % set the population size
pow=fliplr(0:4); % set powers for decoding
pw2=2.^pow'; % find powers of two for decoding genes
POP=rand(popSize,popSize-1)>0.5; % randomize initial population 
chromL=14; % set length of each chromosome
numGen=30; % set the number of generations
muRate=0.01; % set mutation rate
meanErr=zeros(1,numGen); % mean error hold vector

for gen=1:numGen; % for each generation
    gsdVec=POP(:,1:4)*pw2(2:5); % decode narrow gaussian sd genes
    gsdVec(find(gsdVec==0))=0.001; % change 0s to small values
    dsdVec=POP(:,5:9)*pw2; % decode wide gaussian sd genes
    dsdVec(find(dsdVec==0))=0.001; % change 0s to small values
    dwtVec=POP(:,10:14)*pw2; % decode wide gaussian weight genes
    dwtVec=0.1+0.013*dwtVec; % scale wide gaussian weights
    error=zeros(1,popSize); % zero the error vector
    for chrom=1:popSize; % for each chromosome in the population
        g=gaussPro(s,gsdVec(chrom)); % make the narrow gaussian
        d=gaussPro(s,dsdVec(chrom)); % make the wide gaussian
        dog=g-(dwtVec(chrom)*d); % make connectivity profile (DOG)
        dog=[dog(26:51) dog(1:25)]; % shift DOG profile 
        W=shiftLam(dog); % make connectivity matrix W from profile
        noise=rand(51,1); % make a new noise vector
        x=signal+noise; % add noise to signal to make input
        winnersTakeAll % find network responses for this input
        [nY,nTs]=size(y); % find the final response
        ySS=y(:,nTs); % take the final stable-state response
        % error(chrom)=sum([(10-ySS(25:27)')*20 ... % compute 
        %     ySS(1:24)' ySS(28:51)']);             % the error
            error(chrom)=sum([(10-ySS(26)')*20 ... % compute 
            ySS(1:25)' ySS(27:51)']);             % the error    
    end % end phenotype evaluation loop
    meanErr(gen)=mean(error); % save the mean error
    if numGen==gen, break; end % do not change last generation
    normErr=error./sum(error); % normalize errors
    ranVec=rand(1,popSize); % generate random vector
    normRan=ranVec./sum(ranVec); % normalize random vector
    pertErr=normErr+normRan; % randomly perturb errors
    [theErrs,index]=sort(pertErr); % sort by perturbed errors
    dad1=POP(index(1),:); % dad1 has smallest perturbed error
    mom1=POP(index(2),:); % mom1 has second smallest error
    dad2=POP(index(3),:); % dad2 has third smallest error
    mom2=POP(index(4),:); % mom2 has fourth smallest error
    permSites=randperm(chromL); % randomly permute sites
    coS1=permSites(1); % find crossover site for couple 1 
    coS2=permSites(2); % find crossover site for couple 2
    son1=[dad1(1:coS1) mom1(coS1+1:chromL)]; % son 1
    dtr1=[mom1(1:coS1) dad1(coS1+1:chromL)]; % daughter 1
    son2=[dad2(1:coS2) mom2(coS2+1:chromL)]; % son 2
    dtr2=[mom2(1:coS2) dad2(coS2+1:chromL)]; % daughter 2
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
minErr
[gsdVec(indME) dsdVec(indME) dwtVec(indME)]

g=gaussPro(s,gsdVec(indME)); 
d=gaussPro(s,dsdVec(indME)); 
p=g-(dwtVec(indME)*d); 
p=[p(26:51) p(1:25)]; 
W=shiftLam(p); 
noise=rand(51,1); 
x=(signal+noise); 
winnersTakeAll 


clf
subplot(211)
plot(meanErr,'k','linewidth',2)
axis([1 numGen 0 500])
xlabel('generation number','fontsize',14)
ylabel('mean error','fontsize',14)
text(1.5,460,'A','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)
subplot(212)
plot(s,y(:,2:19),'k')
hold
plot(s,y(:,20),'k','linewidth',2)
hold
axis([-25 25 -1 12])
xlabel('space','fontsize',14)
ylabel('output responses','fontsize',14)
text(-24,10.7,'B','fontsize',14) 
set(gca,'fontsize',14)
set(gca,'linewidth',2)
