# neural-systems-modeling
This repository contains MATLAB code for all the computational neuroscience models presented in the book:  
Anastasio TJ (2010) Tutorial on Neural Systems Modeling, Sinauer Associates

All of the code (MATLAB mfiles) was written to be easily followed. Step-by-step instructions for using the code, along with the mathimatical basis of the models and their neurobiological implications, are presented in the book, to which the user of this repository is referred for details.    

The book is organized into 14 chapters, each with its own set of mfiles. The book chapters and the mfiles to which they belong are listed below.   

Chapter 1. Vectors, Matrices, and Basic Neural Computations  

introPlay.m -- performs some simple vector manipulations and computations  
BiVarGaussPlay.m -- computes and displays bivariate Gaussian distributions  
habGWR.m -- simulates habituation of the Aplysia gill withdrawl reflex  
sn1posFB.m -- implements positive feedback onto a single model neuron (also called a "unit")  
BigMess.m -- computes responses of single-layer network with random input and feedback connections
  
Chapter 2. Recurrent Connections and Simple Neural Circuits  

sn1posFB -- computes responses of single model neuron with positive feedback  
sn1FBwithTauDel -- computes responses of neuron with time constant and positive feedback  
sn2posFB.m  -- computes responses of two model neurons in series with positive feedback  
sn2Raphan.m -- simulates vestibular velocity storage with two parallel pathways  
sn2VelStorLeak.m -- simulates velocity storage and leakage with forward and feeback pathways  
sn2Integrator.m -- computes responses of two units with feedback and reciprocal connections  
sn2HarOsc.m  -- simulates a central pattern generator with two units and one input  
sn2HarOsc2.m -- simulates a central pattern generator with two units and two inputs  
sn3BurstGen.m -- simulates a relaxation-oscillator burst-generator with three model neurons  
sn4CPG.m -- simulates the locust flight central pattern generator using four model neurons  
snNposFB.m -- computes the responses of N units with positive feedback in series  

Chapter 3. Forward and Recurrent Lateral Inhibition  

GAUSS.m -- constructs a Gaussian connection-weight profile  
REPCON.m -- constructs a weight matrix by shifting and laminating a weight profile  
ITLIN.m -- iterates a lateral inhibitory network of linear model neurons  
ITNLIN.m -- iterates a lateral inhibitory network of nonlinear model neurons  
itrel.m -- iterates a winner-take-all lateral inhibitory network  
setit.m -- sets parameters for a winner-take-all lateral inhibitory network  

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

rlPatterns.m -- holds input and desired-output patterns for reinforcement learning  
rlTrainOne.m -- uses perturbation of one weight at a time to train network with only one output
rltrain.m -- uses perturbation of all weights simultaneously to train network with only one output  
rlTrainOneWhile.m -- one-weight-at-a-time perturbation training until error below tolerance  
rlTrailAll.m -- all-weight perturbation training with update based on whole pattern set  
rlTrainAllRanIn.m -- all-weight perturbation training with update computed for each pattern  
rlTrainAllWhile.m -- all-weight perturbation training until error below tolerance  
rlTrainPGD.m -- all-weight perturbation training using parallel gradient descent  
rlver.m -- verifies pattern associating networks trained using reinforcement learning  
rlSetUP.m -- makes initially random wieght matrices for two-layered networks  
rlDistRepTrain.m --  all-weight perturbation training of two-layered networks  
rlDistRepVer.m -- verifies two-layered pattern associating networks trained by perturbation  




Chapter 8. Information Transmission and Unsupervised Learning

Chapter 9. Probability Estimation and Supervised Learning

Chapter 10. Time-Series Learning and Nonlinear Signal Processing

Chapter 11. Temporal-Difference Learning and Reward Prediction

Chapter 12. Predictor-Corrector Models and Probabilistic Inference

Chapter 13. Simulated Evolution and the Genetic Algorithm

Chapter 14. Future Directions in Neural Systems Modeling  
Note: This final chapter is purely prospective and has no associated code.  








