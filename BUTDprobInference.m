% BUTDprobInference.m
% this script simulates bottom-up/top-down processing in the
% visual system using probabilistic inference 

% set initial prior distributions for location and feature
pl1=0.5; pl2=1-pl1;
pf1=0.5; pf2=1-pf1;

% set conditional distributions for combo given loc and feat
pc1gl1f1=0.5; pc1gl2f1=0.1; pc1gl1f2=0.1; pc1gl2f2=0.3; 
pc2gl1f1=0.1; pc2gl2f1=0.5; pc2gl1f2=0.3; pc2gl2f2=0.1; 
pc3gl1f1=0.1; pc3gl2f1=0.3; pc3gl1f2=0.5; pc3gl2f2=0.1; 
pc4gl1f1=0.3; pc4gl2f1=0.1; pc4gl1f2=0.1; pc4gl2f2=0.5; 

% set conditional distribution for image given combination
pi1gc1=0.5; pi1gc2=0.1; pi1gc3=0.1; pi1gc4=0.3;
pi2gc1=0.1; pi2gc2=0.5; pi2gc3=0.3; pi2gc4=0.1;
pi3gc1=0.1; pi3gc2=0.3; pi3gc3=0.5; pi3gc4=0.1;
pi4gc1=0.3; pi4gc2=0.1; pi4gc3=0.1; pi4gc4=0.5;

% compute un-normalized posterior of feature 1 given image 1
pf1gi1BayesU=pf1*...
    (pi1gc1*pc1gl1f1*pl1 + pi1gc2*pc2gl1f1*pl1+...
    pi1gc3*pc3gl1f1*pl1 + pi1gc4*pc4gl1f1*pl1+...
    pi1gc1*pc1gl2f1*pl2 + pi1gc2*pc2gl2f1*pl2+...
    pi1gc3*pc3gl2f1*pl2 + pi1gc4*pc4gl2f1*pl2);

% compute un-normalized posterior of feature 2 given image 1
pf2gi1BayesU=pf2*...
    (pi1gc1*pc1gl1f2*pl1 + pi1gc2*pc2gl1f2*pl1+...
    pi1gc3*pc3gl1f2*pl1 + pi1gc4*pc4gl1f2*pl1+...
    pi1gc1*pc1gl2f2*pl2 + pi1gc2*pc2gl2f2*pl2+...
    pi1gc3*pc3gl2f2*pl2 + pi1gc4*pc4gl2f2*pl2);

% compute normalized posterior of feature 1 given image 1
pf1gi1Bayes=pf1gi1BayesU/(pf1gi1BayesU+pf2gi1BayesU);


% compute un-normalized posterior of combination 1 given image 1
pc1gi1BayesU=pi1gc1*...
    (pc1gl1f1*pl1*pf1 + pc1gl2f1*pl2*pf1+ ...
     pc1gl1f2*pl1*pf2 + pc1gl2f2*pl2*pf2);

% compute un-normalized posterior of combination 2 given image 1
pc2gi1BayesU=pi1gc2*...
    (pc2gl1f1*pl1*pf1 + pc2gl2f1*pl2*pf1+ ...
     pc2gl1f2*pl1*pf2 + pc2gl2f2*pl2*pf2);
 
% compute un-normalized posterior of combination 3 given image 1
pc3gi1BayesU=pi1gc3*...
    (pc3gl1f1*pl1*pf1 + pc3gl2f1*pl2*pf1+ ...
     pc3gl1f2*pl1*pf2 + pc3gl2f2*pl2*pf2);

% compute un-normalized posterior of combination 4 given image 1
pc4gi1BayesU=pi1gc4*...
    (pc4gl1f1*pl1*pf1 + pc4gl2f1*pl2*pf1 + ...
     pc4gl1f2*pl1*pf2 + pc4gl2f2*pl2*pf2);

% compute normalized posterior of combination 1 given image 1
pc1gi1Bayes=pc1gi1BayesU/...
    (pc1gi1BayesU+pc2gi1BayesU+pc3gi1BayesU+pc4gi1BayesU);


[pc1gi1Bayes pf1gi1Bayes]



% these conditionals are consistent (but effect for F is backwards)
% set conditional distributions for combo given loc and feat
% pc1gl1f1=0.8; pc1gl2f1=0.1; pc1gl1f2=0.1; pc1gl2f2=0.0; 
% pc2gl1f1=0.1; pc2gl2f1=0.8; pc2gl1f2=0.0; pc2gl2f2=0.1; 
% pc3gl1f1=0.1; pc3gl2f1=0.0; pc3gl1f2=0.8; pc3gl2f2=0.1; 
% pc4gl1f1=0.0; pc4gl2f1=0.1; pc4gl1f2=0.1; pc4gl2f2=0.8; 
% set conditional distribution for image given combination
% pi1gc1=0.8; pi1gc2=0.1; pi1gc3=0.1; pi1gc4=0.0;
% pi2gc1=0.1; pi2gc2=0.8; pi2gc3=0.0; pi2gc4=0.1;
% pi3gc1=0.1; pi3gc2=0.0; pi3gc3=0.8; pi3gc4=0.1;
% pi4gc1=0.0; pi4gc2=0.1; pi4gc3=0.1; pi4gc4=0.8;

% these conditionals are consistent
% set conditional distributions for combo given loc and feat
% pc1gl1f1=0.8; pc1gl2f1=0.1; pc1gl1f2=0.1; pc1gl2f2=0.0; 
% pc2gl1f1=0.1; pc2gl2f1=0.8; pc2gl1f2=0.0; pc2gl2f2=0.1; 
% pc3gl1f1=0.1; pc3gl2f1=0.0; pc3gl1f2=0.8; pc3gl2f2=0.1; 
% pc4gl1f1=0.0; pc4gl2f1=0.1; pc4gl1f2=0.1; pc4gl2f2=0.8; 
% set conditional distribution for image given combination
% pi1gc1=0.8; pi1gc2=0.1; pi1gc3=0.1; pi1gc4=0.0;
% pi2gc1=0.1; pi2gc2=0.8; pi2gc3=0.0; pi2gc4=0.1;
% pi3gc1=0.1; pi3gc2=0.0; pi3gc3=0.8; pi3gc4=0.1;
% pi4gc1=0.0; pi4gc2=0.1; pi4gc3=0.1; pi4gc4=0.8;

% these conditionals are consistent
% set conditional distributions for combo given loc and feat
% pc1gl1f1=0.75; pc1gl2f1=0.10; pc1gl1f2=0.10; pc1gl2f2=0.05; 
% pc2gl1f1=0.10; pc2gl2f1=0.75; pc2gl1f2=0.05; pc2gl2f2=0.10; 
% pc3gl1f1=0.10; pc3gl2f1=0.05; pc3gl1f2=0.75; pc3gl2f2=0.10; 
% pc4gl1f1=0.05; pc4gl2f1=0.10; pc4gl1f2=0.10; pc4gl2f2=0.75; 
% set conditional distribution for image given combination
% pi1gc1=0.75; pi1gc2=0.10; pi1gc3=0.10; pi1gc4=0.05;
% pi2gc1=0.10; pi2gc2=0.75; pi2gc3=0.05; pi2gc4=0.10;
% pi3gc1=0.10; pi3gc2=0.05; pi3gc3=0.75; pi3gc4=0.10;
% pi4gc1=0.05; pi4gc2=0.10; pi4gc3=0.10; pi4gc4=0.75;

% these conditionals are consistent
% set conditional distributions for combo given loc and feat
% pc1gl1f1=0.60; pc1gl2f1=0.15; pc1gl1f2=0.15; pc1gl2f2=0.10; 
% pc2gl1f1=0.15; pc2gl2f1=0.60; pc2gl1f2=0.10; pc2gl2f2=0.15; 
% pc3gl1f1=0.15; pc3gl2f1=0.10; pc3gl1f2=0.60; pc3gl2f2=0.15; 
% pc4gl1f1=0.10; pc4gl2f1=0.15; pc4gl1f2=0.15; pc4gl2f2=0.60; 
% set conditional distribution for image given combination
% pi1gc1=0.60; pi1gc2=0.15; pi1gc3=0.15; pi1gc4=0.10;
% pi2gc1=0.15; pi2gc2=0.60; pi2gc3=0.10; pi2gc4=0.15;
% pi3gc1=0.15; pi3gc2=0.10; pi3gc3=0.60; pi3gc4=0.15;
% pi4gc1=0.10; pi4gc2=0.15; pi4gc3=0.15; pi4gc4=0.60;

% these conditionals are also consistent
% set conditional distributions for combo given loc and feat
% pc1gl1f1=0.5; pc1gl2f1=0.2; pc1gl1f2=0.2; pc1gl2f2=0.1; 
% pc2gl1f1=0.2; pc2gl2f1=0.5; pc2gl1f2=0.1; pc2gl2f2=0.2; 
% pc3gl1f1=0.2; pc3gl2f1=0.1; pc3gl1f2=0.5; pc3gl2f2=0.2; 
% pc4gl1f1=0.1; pc4gl2f1=0.2; pc4gl1f2=0.2; pc4gl2f2=0.5; 
% set conditional distribution for image given combination
% pi1gc1=0.5; pi1gc2=0.2; pi1gc3=0.2; pi1gc4=0.1;
% pi2gc1=0.2; pi2gc2=0.5; pi2gc3=0.1; pi2gc4=0.2;
% pi3gc1=0.2; pi3gc2=0.1; pi3gc3=0.5; pi3gc4=0.2;
% pi4gc1=0.1; pi4gc2=0.2; pi4gc3=0.2; pi4gc4=0.5;

% these conditionals are somewhat inconsistent
% set conditional distributions for combo given loc and feat
% pc1gl1f1=0.7; pc1gl2f1=0.1; pc1gl1f2=0.1; pc1gl2f2=0.1; 
% pc2gl1f1=0.1; pc2gl2f1=0.7; pc2gl1f2=0.1; pc2gl2f2=0.1; 
% pc3gl1f1=0.1; pc3gl2f1=0.1; pc3gl1f2=0.7; pc3gl2f2=0.1; 
% pc4gl1f1=0.1; pc4gl2f1=0.1; pc4gl1f2=0.1; pc4gl2f2=0.7; 
% set conditional distribution for image given combination
% pi1gc1=0.7; pi1gc2=0.1; pi1gc3=0.1; pi1gc4=0.1;
% pi2gc1=0.1; pi2gc2=0.7; pi2gc3=0.1; pi2gc4=0.1;
% pi3gc1=0.1; pi3gc2=0.1; pi3gc3=0.7; pi3gc4=0.1;
% pi4gc1=0.1; pi4gc2=0.1; pi4gc3=0.1; pi4gc4=0.7;

% these conditionals are highly inconsistent
% set conditional distributions for combo given loc and feat
% pc1gl1f1=0.5; pc1gl2f1=0.1; pc1gl1f2=0.1; pc1gl2f2=0.3; 
% pc2gl1f1=0.1; pc2gl2f1=0.5; pc2gl1f2=0.3; pc2gl2f2=0.1; 
% pc3gl1f1=0.1; pc3gl2f1=0.3; pc3gl1f2=0.5; pc3gl2f2=0.1; 
% pc4gl1f1=0.3; pc4gl2f1=0.1; pc4gl1f2=0.1; pc4gl2f2=0.5; 
% set conditional distribution for image given combination
% pi1gc1=0.5; pi1gc2=0.1; pi1gc3=0.1; pi1gc4=0.3;
% pi2gc1=0.1; pi2gc2=0.5; pi2gc3=0.3; pi2gc4=0.1;
% pi3gc1=0.1; pi3gc2=0.3; pi3gc3=0.5; pi3gc4=0.1;
% pi4gc1=0.3; pi4gc2=0.1; pi4gc3=0.1; pi4gc4=0.5;









    









