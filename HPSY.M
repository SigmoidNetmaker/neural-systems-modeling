function OUT = hpsy(v,M,itn)
% this function computes synchronous
% iterations through autoassociative
% networks where v is the state vector,
% M is the connectivity matrix, itn is 
% the desired number of iterations and
% OUT is a martix to hold v through time
%
[m,n]=size(M);
OUT=zeros(m,itn);
for i=1:itn,
   v = M*v;
   v = v>0;
   OUT(:,i)=v;
end;
OUT=OUT';

