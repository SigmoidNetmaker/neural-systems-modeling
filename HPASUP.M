% hpasup.m
% this script computes one
% iteration of the Hopfield
% network, where v is the
% state vector and CM is the
% covarience matrix; 
% update is asynchronous
%
[m,n]=size(CM);
[sdrv rindx]=sort(rand(1:n));
for i=1:n,
   for j=1:n,
      v(rindx(i)) = CM(rindx(i),:)*v;
      v=v>0;
   end,
end;
