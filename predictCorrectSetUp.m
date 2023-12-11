% predictCorrectSetUp.m
% this script sets up a predictor-corrector model of target tracking

range=80; % set range of space units (space is -range:0:range)
CellPrefT=10; % enter PBN cell preferred T position (in space units)
lightOff=12; % enter lights off position (in space units)
lightOn=21; % enter lights on position (in space units)
nTpos=31; % set number of positions (spaces) target will assume
pTvar=25; % set variance of prediction (target motion model)
pVTvar=9; % set variances of observation (visual likelihood)
TposVec=0:nTpos-1; % set target position vector (in space units)
space=(-range:range)'; % make the space
nSpace=length(space); % find the number of spaces
shift=(nSpace+1)/2; % compute the shift parameter 

pTgauss=exp((space.^2/pTvar)*(-0.5)); % pTgauss as discrete Gaussian
pTgauss=pTgauss/sum(pTgauss); % normalize the discrete Gaussian
pTgauss=circshift(pTgauss,shift+1); % shift Gaussian (note +1)
pTTpre=zeros(nSpace); % zero conditional target probability matrix 
for s=1:nSpace, % for each location in space
    pTTpre(:,s)=pTgauss; % set each column of target prob matrix
    pTgauss=[pTgauss(nSpace);pTgauss(1:nSpace-1)]; % rotate 
end % end loop that makes conditional target probability matrix
pVToff=ones(nSpace,1)*1/nSpace; % set pVToff as uniform distribution
pVTgauss=exp((space.^2/pVTvar)*(-0.5)); % set pVTon as Gaussian
pVTgauss=pVTgauss/sum(pVTgauss); % normalize the discrete Gaussian
pVTgauss=circshift(pVTgauss,shift); % shift Gaussian (note no +1)
pVTon=zeros(nSpace); % zero the visual input likelihood matrix
for s=1:nSpace, % for each location in space
    pVTon(:,s)=pVTgauss; % set each column of likelihood matrix
    pVTgauss=[pVTgauss(nSpace);pVTgauss(1:nSpace-1)]; % rotate
end % end loop that makes likelihood matrix





% subplot(211)
% mesh(pVTon)
% subplot(212)
% mesh(pTTpre)


