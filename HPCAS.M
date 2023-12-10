function OUT = hpcas(v,M,itn)
% this function computes asynchronous
% iterations of autoassociative networks,
% where v is the state vector, M is the
% connectivity matrix, itn is the number 
% of iterations and OUT is a matrix
% to hold v over time; some units will
% update before others have had a turn
%
[m,n]=size(M);
OUT=zeros(m,itn/10);
for i=1:itn,
   [sdrv rindx]=max(rand(1,n));
   v(rindx)=M(rindx,:)*v;
   v(rindx)=v(rindx)>0;
   if rem(i,10)==0, OUT(:,i/10)=v; end,
end;
OUT=round(OUT);
OUT=OUT';
