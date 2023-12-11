% HebbPatAssoc.m 
% this script trains two-layered binary networks
% to associate patterns using the Hebb rule

% [nPat,nIn]=size(InPat); % find number of patterns and number of inputs
% [nPat,nOut]=size(DesOut); % find numbers of patterns and outputs
% V=zeros(nOut,nIn); % initialize connectivity matrix V to all zeros
% for i=1:nOut, % for each output unit
%     for j=1:nIn, % for each input unit
%         for l=1:nPat, % for each pattern (letter l indexes patterns)
%             x=InPat(l,j); % set input x to input pattern
%             y=DesOut(l,i); % set output y to desired output
%             deltaV=y*x; % compute Hebb weight update
%             V(i,j)=V(i,j)+deltaV; % apply weight update
%         end % end pattern loop
%     end % end input unit loop
% end % end output unit loop
% 
% Out=zeros(nPat,nOut); % define array to hold output responses
% for l=1:nPat, % for each pattern (letter l indexes patterns)
%     x=InPat(l,:)'; % set input x to input pattern l
%     q=V*x; % find the weighted input sum q 
%     y=q>0; % threshold the weighted input sum to find y
%     Out(l,:)=y'; % set row l of Out to output y
% end % end pattern loop
% 
% V % show the trained weight matrix
% Out % show the trained output responses


% tighter alternatives to above
VHb=(DesOut)'*(InPat) % compute weight matrix V in one step
OutHb=(VHb*InPat')'>0 % compute thresholded output responses in one step
VPr=(2*DesOut-1)'*(InPat) % compute weight matrix V in one step
OutPr=(VPr*InPat')'>0 % compute thresholded output responses in one step
VPo=(DesOut)'*(2*InPat-1) % compute weight matrix V in one step
OutPo=(VPo*InPat')'>0 % compute thresholded output responses in one step
VCo=(2*DesOut-1)'*(2*InPat-1) % compute weight matrix V in one step
OutCo=(VCo*InPat')'>0 % compute thresholded output responses in one step


