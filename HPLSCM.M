% hplscm.m
% this script will lesion the
% Hopfield covarience matrix CM
% by changing each element to zero
% with probability prob
%

[m,n] = size(CM);
mask = rand(m) > prob;
CM = CM .* mask;

% old-fashioned way
% [m,n]=size(CM);
% for i=1:m,
%    for j=1:m,
%       if rand(1,1) < prob,
%          CM(i,j)=0;
%       end,
%    end,
% end;
