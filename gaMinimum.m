% gaMinimum.m
% this script uses the genetic algorithm with binary chromosomes
% to find the minimum of a function

popSize=5; % set the population size
pow=fliplr(0:popSize-1); % set powers for decoding
pw2=2.^pow'; % find powers of two for decoding genes
POP=rand(popSize)>0.5; % randomize initial population
chromL=5; % set length of each chromosome
numGen=20; % set the number of generations
muRate=0; % set the mutation rate
meanVal=zeros(1,numGen); % set value hold vector

for gen=1:numGen; % for each generation
    dec=(POP*pw2)'; % convert the binary chromosomes to decimal numbers
    val=dec.^2-30*dec+230; % find value of function for each chromosome
    meanVal(gen)=mean(val); % find and store mean value for generation
    if numGen==gen, break; end % do not change last generation
    normVal=val./sum(val); % normalize the values for each chromosome
    ranVec=rand(1,popSize); % generate a vector of random numbers
    normRan=ranVec./sum(ranVec); % normalize the random vector
    pertVal=normVal+normRan; % randomly perturb values for chromosomes
    [theVals,index]=sort(pertVal); % sort chromosomes by perturbed value
    dad=POP(index(1),:); % dad has smallest perturbed value
    mom=POP(index(2),:); % mom has next smallest value
    coSite=ceil(rand*chromL); % choose a random crossover site
    son=[dad(1:coSite) mom(coSite+1:chromL)]; % generate son
    dtr=[mom(1:coSite) dad(coSite+1:chromL)]; % generate daughter
    POP(index(popSize),:)=son; % replace least fit by son
    POP(index(popSize-1),:)=dtr; % replace next least fit by dtr
    MUMX=rand(popSize)<muRate; % generate random mutation matrix
    POP=abs(POP-MUMX); % mutate the chromosomes
end % end loop over generations


% show population, the decimal value encoded by each chromosome, 
% and the value of each funciton
POP
dec
val

% plot the mean value over the generations
gens=1:numGen;
dmin=5*ones(1,numGen);
clf
plot(gens,meanVal,'k',gens,dmin,'k--','linewidth',2)
axis([1 numGen 0 100])
legend('mean value','desired minimum')
xlabel('generation number','fontsize',14)
ylabel('mean value','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)


      
      
      



