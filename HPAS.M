function OUT = hpas(v,M,itn)
% this script computes asynchronous
% iterations of autoassociative networks,
% where v is the state vector, M is the
% connectivity matrix, itn is the number 
% of iterations and OUT is a matrix
% to hold v over time
%
[m,n]=size(M);
OUT=zeros(m,itn);
for i=1:itn,
   rindx=randperm(n);
   for j=1:n,
      v(rindx(j))=M(rindx(j),:)*v;
      v(rindx)=v(rindx)>0;
   end,
   OUT(:,i)=v;
end;
