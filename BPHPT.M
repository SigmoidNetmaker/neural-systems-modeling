% bphpt.m makes a Hopfield pattern
% associator matrix CM using input
% patterns in matrix PI and output
% patterns in matrix PO,  where
% PI[p,n] has p patterns of n input
% units and PO[p,m] has p patterns
% of m output units; CM is [m,n]
%
[p,n]=size(PI);
[p,m]=size(PO);
CM = zeros(m,n);
for i=1:m,
   for j=1:n,
      for k=1:p,
         dw=((2*PO(k,i))-1)*((2*PI(k,j))-1);
         CM(i,j) = CM(i,j) + dw;
      end,
   end,
end; 


% more elegant alternative
CM2=zeros(m,n);
for k=1:p,
    dw=((2*PO(k,:))-1)'*((2*PI(k,:))-1);
    CM2=CM2+dw;
end

% most elegant alternative
CM3=(2*PO-1)'*(2*PI-1);

CM
CM2
CM3