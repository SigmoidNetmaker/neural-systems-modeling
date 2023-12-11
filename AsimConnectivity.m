% AsimConnectivity.m
% this script makes an asymmetric Hopfield matrix (HP) with symmetric
% auto-covariation weights to which are added asymmetric weights due to 
% the covariation of each pattern with the next one in the sequence;
% pattern matrix P must already be available in the workspace

a=2; % set size of asymmetric modulation
[nPat,nUnits] = size(P); % find numbers of patterns and units

HP = zeros(nUnits); % zero the Hopfield connectivity matrix
HP=(2*P' -1) * (2*P -1); % compute Hopfield auto-covariation matrix
for l=1:nPat-1, % for each pair of successive patterns
   HPDW=(2*P(l+1,:)' -1) * (2*P(l,:) -1); % compute asymmetric update
   HP = HP + a*HPDW; % update entire Hopfield connectivity matrix
end % end pattern loop

MSK = (ones(nUnits) - eye(nUnits)); % construct the masking matrix
HP = HP .* MSK; % zero self-connections in Hopfield matrix





