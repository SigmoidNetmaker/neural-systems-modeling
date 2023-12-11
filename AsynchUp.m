% AsynchUp.m
% this function computes asynchronous updates of autoassociative  
% networks where yIinitial is the initial state (column) vector,
% W is the connectivity matrix, nTs is number of time steps (some
% multiple of ten) and array Y holds state vector y through time

function Y = AsynchUp(yInitial,W,nTs) % delcare the function

[dum,nUnits]=size(W); % find the number of units in the network
Y=zeros(nTs/10,nUnits); % zero the output Y array
y=yInitial; % initialize the state of y to yInitial
for t=1:nTs % for each time step 
   rIndx=ceil(rand*nUnits); % randomly choose a state in y to update
   q=W(rIndx,:)*y; % update the selected state in y
   y(rIndx)=q>0; % impose the threshold nonlinearity
   if rem(t,10)==0, Y(t/10,:)=y'; end, % at intervals save to Y array
end % end the asynchronous update loop
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

