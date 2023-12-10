% hpallo.m, makes all of the
% Hebb (HB), post-synaptic (PO),
% pre-synaptic (PR), and Hopfield
% covariance (CM) matrices using
% patterns in matrix P where P[m,n]
% has m patterns of n unit states;
% connetivity matrices are [n,n];
% outer-product method is used
%
[m,n] = size(P);
HB = zeros(n);
PO = zeros(n);
PR = zeros(n);
CM = zeros(n);
for k=1:m,
   hbdw=(P(k,:))'*(P(k,:));
   podw=(P(k,:))'*((2*P(k,:))-1);
   prdw=((2*P(k,:))-1)'*(P(k,:));
   cvdw=((2*P(k,:))-1)'*((2*P(k,:))-1);
   HB = HB + hbdw;
   PO = PO + podw;
   PR = PR + prdw;
   CM = CM + cvdw;
end,
MSK = (ones(n) - eye(n));
HB = HB .* MSK;
PO = PO .* MSK;
PR = PR .* MSK;
CM = CM .* MSK;
