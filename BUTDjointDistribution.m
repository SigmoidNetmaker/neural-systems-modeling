% BUTDjointDistribution.m
% this script simulates bottom-up/top-down processing in the
% visual system using the joint distribution 

% set initial prior distributions for location and feature
pl1=0.1; pl2=1-pl1;    pf1=0.5; pf2=1-pf1;
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

% compute the joint distribution (dimension order is I C L F)
joint=zeros(4,4,2,2); 
joint(1,1,1,1)=pi1gc1*pc1gl1f1*pl1*pf1;
joint(2,1,1,1)=pi2gc1*pc1gl1f1*pl1*pf1;
joint(3,1,1,1)=pi3gc1*pc1gl1f1*pl1*pf1;
joint(4,1,1,1)=pi4gc1*pc1gl1f1*pl1*pf1;
joint(1,2,1,1)=pi1gc2*pc2gl1f1*pl1*pf1;
joint(2,2,1,1)=pi2gc2*pc2gl1f1*pl1*pf1;
joint(3,2,1,1)=pi3gc2*pc2gl1f1*pl1*pf1;
joint(4,2,1,1)=pi4gc2*pc2gl1f1*pl1*pf1;
joint(1,3,1,1)=pi1gc3*pc3gl1f1*pl1*pf1;
joint(2,3,1,1)=pi2gc3*pc3gl1f1*pl1*pf1;
joint(3,3,1,1)=pi3gc3*pc3gl1f1*pl1*pf1;
joint(4,3,1,1)=pi4gc3*pc3gl1f1*pl1*pf1;
joint(1,4,1,1)=pi1gc4*pc4gl1f1*pl1*pf1;
joint(2,4,1,1)=pi2gc4*pc4gl1f1*pl1*pf1;
joint(3,4,1,1)=pi3gc4*pc4gl1f1*pl1*pf1;
joint(4,4,1,1)=pi4gc4*pc4gl1f1*pl1*pf1;

joint(1,1,2,1)=pi1gc1*pc1gl2f1*pl2*pf1;
joint(2,1,2,1)=pi2gc1*pc1gl2f1*pl2*pf1;
joint(3,1,2,1)=pi3gc1*pc1gl2f1*pl2*pf1;
joint(4,1,2,1)=pi4gc1*pc1gl2f1*pl2*pf1;
joint(1,2,2,1)=pi1gc2*pc2gl2f1*pl2*pf1;
joint(2,2,2,1)=pi2gc2*pc2gl2f1*pl2*pf1;
joint(3,2,2,1)=pi3gc2*pc2gl2f1*pl2*pf1;
joint(4,2,2,1)=pi4gc2*pc2gl2f1*pl2*pf1;
joint(1,3,2,1)=pi1gc3*pc3gl2f1*pl2*pf1;
joint(2,3,2,1)=pi2gc3*pc3gl2f1*pl2*pf1;
joint(3,3,2,1)=pi3gc3*pc3gl2f1*pl2*pf1;
joint(4,3,2,1)=pi4gc3*pc3gl2f1*pl2*pf1;
joint(1,4,2,1)=pi1gc4*pc4gl2f1*pl2*pf1;
joint(2,4,2,1)=pi2gc4*pc4gl2f1*pl2*pf1;
joint(3,4,2,1)=pi3gc4*pc4gl2f1*pl2*pf1;
joint(4,4,2,1)=pi4gc4*pc4gl2f1*pl2*pf1;

joint(1,1,1,2)=pi1gc1*pc1gl1f2*pl1*pf2;
joint(2,1,1,2)=pi2gc1*pc1gl1f2*pl1*pf2;
joint(3,1,1,2)=pi3gc1*pc1gl1f2*pl1*pf2;
joint(4,1,1,2)=pi4gc1*pc1gl1f2*pl1*pf2;
joint(1,2,1,2)=pi1gc2*pc2gl1f2*pl1*pf2;
joint(2,2,1,2)=pi2gc2*pc2gl1f2*pl1*pf2;
joint(3,2,1,2)=pi3gc2*pc2gl1f2*pl1*pf2;
joint(4,2,1,2)=pi4gc2*pc2gl1f2*pl1*pf2;
joint(1,3,1,2)=pi1gc3*pc3gl1f2*pl1*pf2;
joint(2,3,1,2)=pi2gc3*pc3gl1f2*pl1*pf2;
joint(3,3,1,2)=pi3gc3*pc3gl1f2*pl1*pf2;
joint(4,3,1,2)=pi4gc3*pc3gl1f2*pl1*pf2;
joint(1,4,1,2)=pi1gc4*pc4gl1f2*pl1*pf2;
joint(2,4,1,2)=pi2gc4*pc4gl1f2*pl1*pf2;
joint(3,4,1,2)=pi3gc4*pc4gl1f2*pl1*pf2;
joint(4,4,1,2)=pi4gc4*pc4gl1f2*pl1*pf2;

joint(1,1,2,2)=pi1gc1*pc1gl2f2*pl2*pf2;
joint(2,1,2,2)=pi2gc1*pc1gl2f2*pl2*pf2;
joint(3,1,2,2)=pi3gc1*pc1gl2f2*pl2*pf2;
joint(4,1,2,2)=pi4gc1*pc1gl2f2*pl2*pf2;
joint(1,2,2,2)=pi1gc2*pc2gl2f2*pl2*pf2;
joint(2,2,2,2)=pi2gc2*pc2gl2f2*pl2*pf2;
joint(3,2,2,2)=pi3gc2*pc2gl2f2*pl2*pf2;
joint(4,2,2,2)=pi4gc2*pc2gl2f2*pl2*pf2;
joint(1,3,2,2)=pi1gc3*pc3gl2f2*pl2*pf2;
joint(2,3,2,2)=pi2gc3*pc3gl2f2*pl2*pf2;
joint(3,3,2,2)=pi3gc3*pc3gl2f2*pl2*pf2;
joint(4,3,2,2)=pi4gc3*pc3gl2f2*pl2*pf2;
joint(1,4,2,2)=pi1gc4*pc4gl2f2*pl2*pf2;
joint(2,4,2,2)=pi2gc4*pc4gl2f2*pl2*pf2;
joint(3,4,2,2)=pi3gc4*pc4gl2f2*pl2*pf2;
joint(4,4,2,2)=pi4gc4*pc4gl2f2*pl2*pf2;

% compute un-normalized posterior of feature 1 given image 1
pf1gi1JointU=joint(1,1,1,1)+joint(1,2,1,1)+...
    joint(1,3,1,1)+joint(1,4,1,1)+...
    joint(1,1,2,1)+joint(1,2,2,1)+...
    joint(1,3,2,1)+joint(1,4,2,1);

% compute un-normalized posterior of feature 2 given image 1
pf2gi1JointU=joint(1,1,1,2)+joint(1,2,1,2)+...
    joint(1,3,1,2)+joint(1,4,1,2)+...
    joint(1,1,2,2)+joint(1,2,2,2)+...
    joint(1,3,2,2)+joint(1,4,2,2);

% compute normalized posterior of feature 1 given image 1
pf1gi1Joint=pf1gi1JointU/(pf1gi1JointU+pf2gi1JointU);


% compute un-normalized posterior of combinaiton 1 given image 1
pc1gi1JointU=joint(1,1,1,1)+joint(1,1,2,1)+...
    joint(1,1,1,2)+joint(1,1,2,2);

% compute un-normalized posterior of combinaiton 2 given image 1
pc2gi1JointU=joint(1,2,1,1)+joint(1,2,2,1)+...
    joint(1,2,1,2)+joint(1,2,2,2);

% compute un-normalized posterior of combinaiton 3 given image 1
pc3gi1JointU=joint(1,3,1,1)+joint(1,3,2,1)+...
    joint(1,3,1,2)+joint(1,3,2,2);

% compute un-normalized posterior of combinaiton 4 given image 1
pc4gi1JointU=joint(1,4,1,1)+joint(1,4,2,1)+...
    joint(1,4,1,2)+joint(1,4,2,2);

% compute normalized posterior of combinaiton 1 given image 1
pc1gi1Joint=pc1gi1JointU/...
    (pc1gi1JointU+pc2gi1JointU+pc3gi1JointU+pc4gi1JointU);


[pc1gi1Joint pf1gi1Joint]


% % compute un-normalized posterior of feature 1 given image 3
% pf1gi3JointU=joint(3,1,1,1)+joint(3,2,1,1)+...
%     joint(3,3,1,1)+joint(3,4,1,1)+...
%     joint(3,1,2,1)+joint(3,2,2,1)+...
%     joint(3,3,2,1)+joint(3,4,2,1);
% 
% % compute un-normalized posterior of feature 2 given image 3
% pf2gi3JointU=joint(3,1,1,2)+joint(3,2,1,2)+...
%     joint(3,3,1,2)+joint(3,4,1,2)+...
%     joint(3,1,2,2)+joint(3,2,2,2)+...
%     joint(3,3,2,2)+joint(3,4,2,2);
% 
% % compute normalized posterior of feature 1 given image 3
% pf1gi3Joint=pf1gi3JointU/(pf1gi3JointU+pf2gi3JointU);
% 
% 
% % compute un-normalized posterior of combinaiton 1 given image 3
% pc1gi3JointU=joint(3,1,1,1)+joint(3,1,2,1)+...
%     joint(3,1,1,2)+joint(3,1,2,2);
% 
% % compute un-normalized posterior of combinaiton 2 given image 3
% pc2gi3JointU=joint(3,2,1,1)+joint(3,2,2,1)+...
%     joint(3,2,1,2)+joint(3,2,2,2);
% 
% % compute un-normalized posterior of combinaiton 3 given image 3
% pc3gi3JointU=joint(3,3,1,1)+joint(3,3,2,1)+...
%     joint(3,3,1,2)+joint(3,3,2,2);
% 
% % compute un-normalized posterior of combinaiton 4 given image 3
% pc4gi3JointU=joint(3,4,1,1)+joint(3,4,2,1)+...
%     joint(3,4,1,2)+joint(3,4,2,2);
% 
% % compute normalized posterior of combinaiton 1 given image 3
% pc1gi3Joint=pc1gi3JointU/...
%     (pc1gi3JointU+pc2gi3JointU+pc3gi3JointU+pc4gi3JointU);
% 
% 
% [pc1gi3Joint pf1gi3Joint]

 % sum(sum(sum(sum(joint))))






    









