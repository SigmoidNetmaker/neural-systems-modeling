% hpallm.m, makes all of the
% Hebb (HB), post-synaptic (PO),
% pre-synaptic (PR), and Hopfield
% covariance (CM) matrices using
% patterns in matrix P where P[m,n]
% has m patterns of n unit states;
% connetivity matrices are [n,n]
%
[m,n] = size(P);
HB = zeros(n);
PO = zeros(n);
PR = zeros(n);
CM = zeros(n);
for i=1:n,
   for j=1:n,
      for k=1:m,
         hbdw=(P(k,i))*(P(k,j));
         podw=(P(k,i))*((2*P(k,j))-1);
         prdw=((2*P(k,i))-1)*(P(k,j));
         cvdw=((2*P(k,i))-1)*((2*P(k,j))-1);
         HB(i,j) = HB(i,j) + hbdw;
         PO(i,j) = PO(i,j) + podw;
         PR(i,j) = PR(i,j) + prdw;
         CM(i,j) = CM(i,j) + cvdw;
      end,
   end,
end,
MSK = (ones(n) - eye(n));
HB = HB .* MSK;
PO = PO .* MSK;
PR = PR .* MSK;
CM = CM .* MSK;
