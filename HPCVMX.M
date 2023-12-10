% hpcvmx.m makes a Hopfield 
% covariance matrix CM using
% patterns in matrix P where
% P[m,n] had m patterns of 
% n unit values; CM is [n,n]
%
[m,n]=size(P);
CM = zeros(n);
for i=1:n,
   for j=1:n,
      for k=1:m,
         dw=((2*P(k,i))-1)*((2*P(k,j))-1);
         CM(i,j) = CM(i,j) + dw;
      end,
   end,
end,
CM = CM .* (ones(n) - eye(n)); 