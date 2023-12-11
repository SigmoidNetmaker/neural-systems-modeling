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







rlPatterns.m -- holds input and desired-output patterns for perturbative reinforcement learning  
rlTrainOne.m -- uses perturbation of one weight at a time to train network with only one output  
rltrain.m -- uses perturbation of all weights simultaneously to train network with only one output  
rlTrainOneWhile.m -- one-weight-at-a-time perturbation training until error below tolerance  
rlTrailAll.m -- all-weight perturbation training with update based on whole pattern set  
rlTrainAllRanIn.m -- all-weight perturbation training with update computed for each pattern  
rlTrainAllWhile.m -- all-weight perturbation training until error below tolerance  
rlTrainPGD.m -- all-weight perturbative reinforcement training using parallel gradient descent  
rlver.m -- verifies pattern associating networks trained using perturbative reinforcement learning  
rlSetUP.m -- makes initially random wieght matrices for two-layered networks  
rlDistRepTrain.m --  all-weight perturbative reinforcement training of two-layered networks  
rlDistRepVer.m -- verifies two-layered pattern associating networks trained by perturbation  
rlAvoid.m -- implements a schema model of avoidance conditioning using reinforcement learning  
rlCallAvoid.m -- implements avoidance conditioning model with addition of an innovation unit  
rlDisAv.m -- implements avoidance conditioning model in which innovation unit can be lesioned  

Chapter 8. Information Transmission and Unsupervised Learning  



Chapter 9. Probability Estimation and Supervised Learning

Chapter 10. Time-Series Learning and Nonlinear Signal Processing

Chapter 11. Temporal-Difference Learning and Reward Prediction  

tdgrid.m -- sets up a simple grid world for temporal difference learning  
tdseq.m -- generates state transition sequence using allowed transitions in grid world  
tdapt.m -- updates grid world state values using adaptive dynamic programming  
tdlms.m -- updates grid world state values using the least mean squares algorithm  
tdtdu.m -- updates grid world state values using the temporal difference algorithm  
tdmds.m -- simulates mesencephalic dopamine system using temporal difference learning  

Chapter 12. Predictor-Corrector Models and Probabilistic Inference

Chapter 13. Simulated Evolution and the Genetic Algorithm  



Chapter 14. Future Directions in Neural Systems Modeling  
Note: This final chapter is purely prospective and has no associated code.  








