% synchUp.m
% this function computes synchronous updates of autoassociative 
% networks where yIinitial is the initial state (column) vector,
% W is the connectivity matrix, nTs is the number of time steps, 
% and Y is an array to hold state vector y through time

function Y = synchUp(yInitial,W,nTs) % declare the function

[dum,nUnits]=size(W); % find the number of units in the network
Y=zeros(nTs,nUnits); % zero the output Y array
y=yInitial; % initialize the state of y to yInitial
for t=1:nTs % for each time step 
   q = W*y; % synchronously update y
   y = q>0; % impose the threshold nonlinearity
   Y(t,:)=y'; % save this state y to the output array Y
end % end the synchronous update loop
Y=[yInitial';Y]; % place yInitial as the first row of Y


return

[r,c]=size(Y);
Yimage=zeros(r,c,3);
Yimage(:,:,1)=Y;
Yimage(:,:,2)=Y;
Yimage(:,:,3)=Y;
clf
image(Yimage)
axis off
title('Network States','fontsize',14)



