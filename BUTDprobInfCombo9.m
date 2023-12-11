% BUTDprobInfCombo9
% this script implements a simple simulation of visual
% processing using bottom-up/top-down probabilistic inference;
% there are 9 combos (and images) which are: c1(h,n) c2(n,h) 
% c3(v,n) c4(n,v) c5(h,h) c6(v,v) c7(h,v) c8(v,h) c9(n,n)
% the simulation shows that increased attention to the left 
% location (l1) can increase the posterior probability of the 
% vertical feature (f2) when presented with image (v,h) (i8);
% just run the script with pl1=0.5 and then with pl1=0.9;
% the effect is more pronounced than the example with only
% 4 combos and the matrix computations are clearer
%

% set location and feature priors
% (increase pl1 to increase expectation of location 1 (left))
pl1=0.5; pl2=1-pl1;
pf1=0.5; pf2=1-pf1;

% set a, b, and c
a=1; b=0.7071; c=0.5;

% set pcglf 
% l1,left;l2,right;f1;hor,f2,vert)
% rows are c1 thru c9
% cols are l1f1, l2f1, l1f2, l2f2
pcglf=...
   [a 0 0 0
    0 a 0 0
    0 0 a 0
    0 0 0 a
    b b 0 0
    0 0 b b
    b 0 0 b
    0 b b 0
    0 0 0 0];
% make columns sum to 1
for i=1:4,
    pcglf(:,i)=pcglf(:,i)/sum(pcglf(:,i));
end

% set pigc
% rows are i1 thru i9
% cols are c1 thru c9
pigc=...
   [a 0 0 0 b 0 b 0 0
    0 a 0 0 b 0 0 b 0
    0 0 a 0 0 b 0 b 0
    0 0 0 a 0 b b 0 0
    b b 0 0 a 0 c c 0
    0 0 b b 0 a c c 0
    b 0 0 b c c a 0 0
    0 b b 0 c c 0 a 0
    0 0 0 0 0 0 0 0 0];
% make columns sum to 1 (but not col 9)
for i=1:8,
    pigc(:,i)=pigc(:,i)/sum(pigc(:,i));
end

% find and display pf1gi8
pf1gi8U=pf1*(pigc(8,:)*pcglf(:,1)*pl1 + ...
             pigc(8,:)*pcglf(:,2)*pl2);
         
pf2gi8U=pf2*(pigc(8,:)*pcglf(:,3)*pl1 + ...
             pigc(8,:)*pcglf(:,4)*pl2);

pf2gi8=pf2gi8U/(pf1gi8U+pf2gi8U);

pf2gi8

