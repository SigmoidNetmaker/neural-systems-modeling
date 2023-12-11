% autoConnectivity.m
% this script makes all of the auto-associator connectivity matrices
% (Hebb (HB), post-synaptic (PO), pre-synaptic (PR), and Hopfield (HP))
% using pattern matrix P; the script implements three different methods;
% pattern matrix P must already be available in the workspace

[nPat,nUnits] = size(P); % find numbers of patterns and units
HB = zeros(nUnits); PO = zeros(nUnits); % define and zero HB and PO
PR = zeros(nUnits); HP = zeros(nUnits); % define and zero PR and HP

% this method implements the summation for each connection in turn
for i=1:nUnits % for each unit as the post-synaptic unit
   for j=1:nUnits % for each unit as the pre-synaptic unit
      for l=1:nPat % for each pattern (loop variable is letter l)
         HBDW=P(l,i) * P(l,j); % compute Hebbian update
         PODW=P(l,i) * (2*P(l,j) -1); % compute post-synaptic update
         PRDW=(2*P(l,i) -1) * P(l,j); % compute pre-synaptic update
         HPDW=(2*P(l,i) -1) * (2*P(l,j) -1); % compute Hopfield update
         HB(i,j) = HB(i,j) + HBDW; % update connection in Hebb matrix 
         PO(i,j) = PO(i,j) + PODW; % update connection in post-synaptic 
         PR(i,j) = PR(i,j) + PRDW; % update connection in pre-synaptic
         HP(i,j) = HP(i,j) + HPDW; % update connection in Hopfield
      end % end pattern loop
   end % end pre-synaptic unit loop
end % end post-synaptic unit loop

% this method implements the summation pattern-by-pattern
% for l=1:nPat, % for each pattern (loop variable is letter l)
%    HBDW=P(l,:)' * P(l,:); % compute update for entire Hebb matrix
%    PODW=P(l,:)' * (2*P(l,:) -1); % compute update for post-synaptic
%    PRDW=(2*P(l,:)' -1) * P(l,:); % compute update for pre-synaptic
%    HPDW=(2*P(l,:)' -1) * (2*P(l,:) -1); % compute update for Hopfield
%    HB = HB + HBDW; % update entire Hebbian matrix
%    PO = PO + PODW; % update entire post-synaptic matrix
%    PR = PR + PRDW; % update entire pre-synaptic matrix
%    HP = HP + HPDW; % update entire Hopfield matrix
% end % end pattern loop

% this method computes each matrix in one step of matrix multiplication
% HB=P' * P; % compute Hebbian matrix
% PR=(2*P' -1) * P; % compute post-synaptic matrix
% PO=P' * (2*P -1); % compute pre-synaptic matrix
% HP=(2*P' -1) * (2*P -1); % compute Hopfield matrix

MSK = (ones(nUnits) - eye(nUnits)); % construct the masking matrix
HB = HB .* MSK; % zero self-connections in Hebbian matrix
PO = PO .* MSK; % zero self-connections in post-synaptic matrix
PR = PR .* MSK; % zero self-connections in pre-synaptic matrix
HP = HP .* MSK; % zero self-connections in Hopfield matrix

