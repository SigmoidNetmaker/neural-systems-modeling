% gaOpfield.m
% this script uses the genetic algorithm with binary chromosomes
% to optimize the Hopfield (covariation) rule

nUnits=5; % set number of units in network
nPats=3; % set number of patterns
YSS=zeros(nPats,nUnits); % define stable-state output array
probA=0.5; % set actual probability that any pattern element is 1
nTs=200; % set number of asymmetric updates for networks
popSize=5; % set the population size
pow=fliplr(0:popSize-1); % set powers for decoding
pw2=2.^pow'; % find powers of two for decoding genes
POP=rand(popSize)>0.5; % randomize initial population 
chromL=5; % set length of each chromosome
numGen=30; % set the number of generations
muRate=0.01; % set mutation rate
probEvec=zeros(1,popSize); % estimated probability hold vector 
DiffVec=zeros(1,popSize); % difference hold vector
meanprobE=zeros(1,numGen); % mean estimated probability hold vector
meanDiff=zeros(1,numGen); % mean difference hold vector

for gen=1:numGen % for each generation
    probEpre=probEvec; % store previous estimated probability vector
    probEvec=0.01+(0.49/31)*POP*pw2; % decode chroms into probabilities
    P=rand(nPats,nUnits)<probA; % pattern elements are 1 with probA
    for chrom=1:popSize % for each chromosome in the population
        if probEvec(chrom)~=probEpre(chrom) % if chromosome has changed
            probE=probEvec(chrom); % set estimated probability to chrom
            OP=(P'-probE)*(P-probE); % make optimal Hopfield matrix
            MSK=(ones(nUnits)-eye(nUnits)); % make mask matrix
            OP=OP.*MSK; % zero diagonal of connectivity matrix
            for pat=1:nPats, % for each pattern
                y=(P(pat,:)*0.5)'; % start state at half strength
                for t=1:nTs, % for each iteration
                    rindx=ceil(rand*nUnits); % random index  
                    q=OP(rindx,:)*y; % find weighted input
                    y(rindx)=q>0; % apply threshold of 0
                end; % end asychronous updates
                YSS(pat,:)=y'; % save stable state in output array
            end % end loop over patterns
            DiffVec(chrom)=sum(sum(abs(P-YSS))); % difference on recall
        end % end change conditional
    end % end population loop
    meanprobE(gen)=mean(probEvec); % save mean estimated probability
    meanDiff(gen)=mean(DiffVec); % save mean difference
    if numGen==gen, break; end % do not change last generation
    if norm(DiffVec)==0, normDiff=DiffVec; % if norm is zero leave it
    else normDiff=DiffVec./norm(DiffVec); end % else normalize diff
    ranVec=rand(1,popSize); % generate a vector of random numbers
    normRan=ranVec./norm(ranVec); % normalize the random vector
    pertDiff=normDiff+normRan/3; % randomly perturb values for chroms
    [diffs,index]=sort(pertDiff); % sort chromosomes by perturbed value
    dad=POP(index(1),:); % dad has smallest perturbed value
    mom=POP(index(2),:); % mom has next smallest value
    coSite=ceil(rand*chromL); % choose a random crossover site
    son=[dad(1:coSite) mom(coSite+1:chromL)]; % generate son
    dtr=[mom(1:coSite) dad(coSite+1:chromL)]; % generate daughter
    POP(index(popSize-1),:)=son; % replace least fit by son
    POP(index(popSize),:)=dtr; % replace next least fit by dtr
    MUMX=rand(popSize)<muRate; % generate random mutation matrix
    POP=abs(POP-MUMX); % mutate the genome
end % end loop over generations



% plot results
clf
gens=1:numGen;
probAvec=probA*ones(1,numGen);
subplot(211)
plot(gens,meanDiff,'k','linewidth',2)
axis([1 numGen 0 15])
ylabel('mean difference','fontsize',14)
xlabel('generation number','fontsize',14)
text(1.5,1.7,'A','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)
subplot(212)
plot(gens,meanprobE,'k',gens,probAvec,'k--','linewidth',2)
axis([1 numGen 0 0.6])
legend('mean estimate','desired probability',4)
ylabel('mean estimated prob','fontsize',14)
xlabel('generation number','fontsize',14)
text(1.5,0.07,'B','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)

