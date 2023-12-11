# neural-systems-modeling
This repository contains MATLAB code for all the computational neuroscience models presented in the book:  
Anastasio TJ (2010) Tutorial on Neural Systems Modeling, Sinauer Associates

All of the code (MATLAB mfiles) is extensively commented and was written to be easily followed. Step-by-step instructions for using the code, along with the mathimatical basis of the models and their neurobiological implications, are presented in the book, to which the user of this repository is referred for details.    

The book is organized into 14 chapters, each with its own set of mfiles. The book chapters and the mfiles to which they belong are listed below.   

Chapter 1. Vectors, Matrices, and Basic Neural Computations  

oneUnitWithPosFB.m -- implements positive feedback onto a single model neuron (a "unit")  
habituationGWR.m -- simulates habituation of the Aplysia gill withdrawl reflex  
habGWRfig.m -- same simulation as habituationGWR.m but also produces figures  
BigMess.m -- computes responses of neural network with random input and feedback connections

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




HPPTNS.m -- holds sets of patterns to be remembered by auto-associative networks  
HPCVMX.m -- makes Hopfield auto-associative covariance matrix using nested loops  
HPALLM.m -- makes Hebb, post, pre, and Hopfield covariance matrices using nested loops  
HPALLO.m -- makes Hebb, post, pre, and Hopfield covariance matrices using outer product  
HPSYUP.m -- makes 1 synchronous update of an auto-associative network  
HPASUP.m -- makes 1 asychronous update of an auto-associative network  
HPSY.m -- computes N synchronous updates of an auto-associative network  
HPAS.m -- computes N asychronous updates of an auto-associative network  
HPCAS.m -- computes N asychronous updates and saves every 10th network state  
HPCMVR.m -- verifies auto-associative networks started from weak initial pattern  
HPLSCM.m -- lesions auto-associative networks by removing connections at random  
HPRNPT.m -- makes a set of random patterns according to preset probabilities  
hpopcm.m -- makes optimal associative matrix given probability of input presence  
hpopev.m -- creates and evaluates optimal associative network given input probability  

Chapter 5. Unsupervised Learning and Distributed Representations  

SMPTNS.m -- holds patterns for training self-organizing feature maps  
SMNP.m -- normalizes patters for training self-organizing feature maps  
SMRNMX.m -- makes a matrix of random numbers between -1 and +1  
SMSK.m -- performs unsupervised learning using simplified Kohonen algorithm  
SMVR.m -- verifies self-organized maps created using simplified Kohonen  
SMSKT.m -- simulates formation of a tonotopic self-organized feature map  
SMVRT.m -- verifies tonotopic self-organized feature map  

Chapter 6. Supervised Learning and Non-Uniform Representations  

BPPTNS.m -- holds input and desired output patterns for supervised learning  
URNMX.m -- makes initial weight matrix of random numbers between -1 and +1  
BPHPT.m -- trains a pattern associator network uisng the covariance rule  
BPHPV.m -- verifies a pattern associator trained uisng the covariance rule  
BPDRT.m -- trains a pattern associator network uisng the delta rule  
BPDRV.m -- verifies a pattern associator trained uisng the delta rule  
BPRNMX.m -- makes initially random weight matrices for two-layered networks  
BPBPT.m -- trains a two-layered pattern associator network uisng backpropagation  
BPBPV.m -- verifies a two-layered pattern associator trained uisng backpropagation  
bpcat.m -- shows how supervised training can easily overcome "catastrophic interference"  

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








