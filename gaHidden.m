% gaHidden.m
% this script uses the genetic algorithm to optimize the number of 
% hidden units in a feedforward network trained using back-propagation
% note: this script calls script backPropTrainFORga

InPat = [0 0;1 0;0 1]; % labeled line input patterns
DesOut = [0;1;1]; % labeled line desired output patterns
[nPat,nIn]=size(InPat); % pattern number and inputs number
[nPat,nOut]=size(DesOut); % patterns number and output number
maxIts=7000; % set maximum number of allowed iterations
popSize=5; % set the population size
pow=fliplr(0:popSize-1); % set powers for decoding
pw2=2.^pow'; % find powers of two for decoding genes
POP=rand(popSize)>0.5; % randomize initial population
chromL=5; % set length of each chromosome
numGen=20; % set the number of generations
muRate=0.01; % set the mutation rate
nHidVec=zeros(1,popSize); % set hidden number hold vector
nitVec=zeros(1,popSize); % set iteration number hold vector
meanHid=zeros(1,numGen); % set mean hidden units hold vector
meanNit=zeros(1,numGen); % set mean iterations hold vector

for gen=1:numGen % for each generation
    nHidPre=nHidVec; % save previous hidden number vector
    nHidVec=POP*pw2; % decode the new population of chromosomes
    for chrom=1:popSize % for each chromosome in the population
        if nHidVec(chrom)==0 % if chromosome encodes 0 hidden units
            nitVec(chrom)=maxIts; % set number of iterations to max
        elseif nHidVec(chrom)~=nHidPre(chrom) % if chrom changed
            nHid=nHidVec(chrom); % set hidden unit number to chrom
            backPropTrainFORga % train using back-propagation
            nitVec(chrom)=c; % save required number of iterations
        end % end evaluation conditional
    end % end loop over chromosomes in population
    meanHid(gen)=mean(nHidVec); % mean number of hidden units
    meanNit(gen)=mean(nitVec); % mean number of iterations
    if numGen==gen, break; end % do not change last generation
    normNit=nitVec./sum(nitVec); % normalize iteration numbers
    ranVec=rand(1,popSize); % generate a vector of random numbers
    normRan=ranVec./sum(ranVec); % normalize the random vector
    pertNit=normNit+normRan/3; % randomly perturb nits
    [theNits,index]=sort(pertNit); % sort chroms by perturbed nits
    dad=POP(index(1),:); % dad has smallest number of iterations
    mom=POP(index(2),:); % mom has next smallest number
    coSite=ceil(rand*chromL); % choose a random crossover site
    son=[dad(1:coSite) mom(coSite+1:chromL)]; % generate son
    dtr=[mom(1:coSite) dad(coSite+1:chromL)]; % generate daughter
    POP(index(popSize),:)=son; % replace least fit by son
    POP(index(popSize-1),:)=dtr; % replace next least fit by dtr
    MUMX=rand(popSize)<muRate; % generate random mutation matrix
    POP=abs(POP-MUMX); % mutate the chromosomes
end % end loop over generations



figure(1)
clf
gens=1:numGen;
subplot(211)
plot(gens,meanNit,'k','linewidth',2)
axis([1 numGen 500 5000])
ylabel('mean iterations','fontsize',14)
xlabel('generation number','fontsize',14)
text(1.3,1000,'A','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)
subplot(212)
plot(gens,meanHid,'k','linewidth',2)
axis([1 numGen 0 32])
ylabel('mean hidden units','fontsize',14)
xlabel('generation number','fontsize',14)
text(1.3,3,'B','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)

figure(2)
clf
plot(meanHid,meanNit,'k*','linewidth',2)
xlabel('mean number of hidden units','fontsize',14)
ylabel('mean number of iterations','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)
