% script tdgrid.m
% this script sets up a grid world 
% for temporal difference learning

% enter numbers of rows and columns
% in the grid world and initialize
% holding matricies
nr=3; nc=4;
tm=zeros(nr*nc);

% enter matrix of coordinates
coor=[1 1
      1 2
      1 3
      1 4
      2 1
      2 2
      2 3
      2 4
      3 1
      3 2
      3 3
      3 4];

% enter allowed transitions as rows 
% in a matrix, as follows for each row:
% [coor-from coor-to]
at=[1 1 1 2
    1 1 2 1
    1 2 1 1
    1 2 1 3
    1 3 1 2
    1 3 1 4
    1 3 2 3
    1 4 1 3
    1 4 2 4
    2 1 1 1
    2 1 3 1
    2 3 1 3
    2 3 2 4
    2 3 3 3
    3 1 2 1
    3 1 3 2
    3 2 3 1
    3 2 3 3
    3 3 2 3
    3 3 3 2
    3 3 3 4];

% enter each allowed transition as 
% a 1 in the transition matrix
% (this is computed on the basis of
% the coordinates of allowed transitions)
tmr=nc*at(:,3)-nc+at(:,4);
tmc=nc*at(:,1)-nc+at(:,2);
[nat,dum]=size(at);
for i=1:nat,
   tm(tmr(i),tmc(i))=1;
end

% enter exact values for each state
eval=[-0.2911
   -0.4177
   -0.5443
   -0.7722
   -0.1646
    0
   -0.4430
   -1
   -0.0380
    0.0886
    0.2152
    1];
 
 % set state numbers for the terminal states
 tsp=8;
 tsr=12;
 
 
