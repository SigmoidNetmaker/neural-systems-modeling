# neural-systems-modeling
This repository contains MATLAB code for all the computational neuroscience models presented in the book:  
Anastasio TJ (2010) Tutorial on Neural Systems Modeling, Sinauer Associates

All of the code (MATLAB mfiles) is extensively commented and was written to be easily followed. Step-by-step instructions for using the code, along with the mathimatical basis of the models and their neurobiological implications, are presented in the book, to which the user of this repository is referred for details.    

The book is organized into 14 chapters, each with its own set of mfiles. The book chapters and the mfiles to which they belong are listed below.   

Chapter 1. Vectors, Matrices, and Basic Neural Computations  

oneUnitWithPosFB.m -- implements positive feedback onto single model neuron (unit)  
habituationGWR.m -- simulates habituation of the Aplysia gill withdrawl reflex  
habGWRfig.m -- same simulation as habituationGWR.m but also produces figures  
BigMess.m -- computes responses of network with random input and feedback connections

Chapter 2. Recurrent Connections and Simple Neural Circuits  

twoLeakSeries.m -- computes responses of two units in series with positive feedback  
NleakSeries.m -- computes responses of N units in series with positive feedback  
velocityStoreLeak.m -- implements parallel and feedback models of velocity storage or leakage  
twoUnitIntegrator.m -- simulates neural integration using feedback and reciprocal connections  
WilsonCPG.m -- implements linear version of Wilson's locust flight central pattern generator  
nonlinearWilsonCPG.m -- implements nonlinear version of locust flight central pattern generator  
halfCPG.m -- shows that each half of Wilson's locust flight CPG is itself an oscillator  

Chapter 3. Forward and Recurrent Lateral Inhibition  

gaussPro.m -- constructs a discrete Gaussian connection-weight profile  
shiftLam.m -- makes connectivity matrix as shifted versions of weight profile  
forwardLatInhib.m -- implements some forward lateral inhibition examples  
winnersTakeAll.m -- simulates a winners-take-all lateral inhibitory network  
feedbackLatInhib.m -- implements some feedback lateral inhibition examples  
BassoAndWurtz.m -- simulates findings of Basso and Wurtz on superior colliculus  

Chapter 4. Covariation Learning and Auto-Associative Memory  

autoPatterns.m -- holds sets of patterns to be remembered by auto-associative networks  
autoConnectivity.m -- makes Hebb, post, pre, and Hopfield auto-associator matrices  
synchUp.m -- computes synchronous updates of auto-associator networks  
AsynchUp.m -- computes asynchronous updates of auto-associator networks  
autoExamples.m -- implements some auto-associator network recall examples  
autoExercises.m -- implements some auto-associator network optimality examples  
AsimConnectivity.m -- makes asymmetric Hopfield auto-associator matrix  
trySequence.m -- explores sequence recall in an asymmetric Hopfield network  
longSequence.m -- explores long-term behavior of an asymmetric Hopfield network  

Chapter 5. Unsupervised Learning and Distributed Representations  

SOMpatterns.m -- holds some input patterns for unsupervised learning  
NormalizePatterns.m -- normalizes patterns for use in unsupervised learning  
KohonenSOM.m -- implements a self-organizing map using the basic Kohonen algorithm  
SOMoutImage.m -- images the output of the model neurons in a self-organizing map  
tuningCurves.m -- shows the tuning curve used to train the tonotopic auditory map  
tonotopicSOM.m -- produces tonotopically orgaized auditory map using Kohonen algorithm

Chapter 6. Supervised Learning and Non-Uniform Representations  

superPatterns.m -- holds some patterns for supervised learning examples  
HebbPatAssoc.m -- trains two-layered networks to associate patterns using Hebb rule  
covarPatAssoc.m -- trains two-layered networks to associate patterns using covarience rule  
squashDerivSquash.m -- illustrates squashing function and derivative of squashing funciton  
deltaRuleTrain.m -- trains two-layered network to associate patterns using delta rule  
backPropTrain.m -- trains three-layered network to associate patterns using backpropagation  
approxAndCatoFig.m -- trains back-prop on sine then exp and shows catastriphic interference  
interleaveSinExp.m -- trains a back-prop network on both sine and exp through interleaving  

Chapter 7. Reinforcement Learning and Associative Conditioning  

pertPatterns.m -- holds some patterns for purturbative reinforcement learning  
pertGradientOneByOne.m -- trains two-layered pattern associator using single weight perturbation  
pertGradientParallel.m -- trains two-layered pattern associator using parallel weight perturbations  
pertDirDriftOneByOne.m -- trains two-layered pattern associator using single weight directed drift  
pertDirectedDrift.m -- trains two-layered pattern associator using parallel directed drift algorithm  
pertDistributedRep.m -- produces nonuniform distributed representation of commands via directed drift  
avoidanceLearn.m -- implements reinforcement learning schema model of avoidance with two command units  
avoidanceLearnCall.m -- implements avoidance schema model with two command and one innovation unit  

Chapter 8. Information Transmission and Unsupervised Learning  

infoCOMP.m -- computes entropies and mutual information given input and conditional probabilities  
info2by2.m -- illustrates information transmission in a neural network with two inputs and two outputs  
info1byN.m -- computes mutual information between one input and N outputs with stochastic relationship  
infoMax2by2.m -- trains a network with two inputs and two outputs using Bell/Sejnowski infomax algorithm  
infoMaxBBS.m -- implements blind source separation using Bell/Sejnowski infomax algorithm  
competitive2by2.m -- trains two-input to two-output network using competitive unsupervised learning  
infoSOMbackground.m -- trains winner-take-all network and finds conditional prob between input and output  

Chapter 9. Probability Estimation and Supervised Learning  

GaussianDeviatesFig.m -- illustrates bivariate Gaussian distribution with covariation  
classifyFishBayesRule.m -- illustrates fish classification example using Bayes Rule  
classifyFishBackProp.m -- uses backpropagation to train a network to classify fish  
unisensoryBayesRule.m -- computes unisensory target probability using Bayes Rule  
unisensoryDeltaRule.m -- trains a unit to estimate unisensory target prob using delta rule  
bisensoryBayesRule.m -- computes bisensory target probability using Bayes Rule  
bisensoryDeltaRule.m -- trains a unit to estimate bisensory target prob using delta rule  

Chapter 10. Time-Series Learning and Nonlinear Signal Processing  

rbpTwoUnitIntegrator.m -- uses recurrent back-propagation to train a linear neural integrator  
rbpVelocityStorageLinear.m -- uses recurrent back-prop to train linear network on velocity storage  
rbpVelocityStorageNonlinear.m -- uses recurrent back-prop to train nonlinear network on velocity storage  
plotFourHiddenUnits.m -- plots responses of four hiddens units trained to simulate velocity storage  
itemGate.m -- generates items to be remembered and their gates used to train models of short-term memory  
rbpShortTermMemTrain.m -- uses recurrent back-prop to train a network to simulate short-term memory  
rbpShortTermMemTest.m -- tests behavior of recurrent network trained to simulate short-term memory  
rbpShortTermMemSS.m -- explores steady-state behavior of network trained to simulate short-term memory  

Chapter 11. Temporal-Difference Learning and Reward Prediction  



Chapter 12. Predictor-Corrector Models and Probabilistic Inference

Chapter 13. Simulated Evolution and the Genetic Algorithm  



Chapter 14. Future Directions in Neural Systems Modeling  
Note: This final chapter is purely prospective and has no associated code.  








