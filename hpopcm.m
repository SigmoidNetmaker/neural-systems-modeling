% hpopcm.m, makes the optimal
% autoassociative connectivity
% matrix given p, the probability
% that any pattern element is a 1;
% connetivity matrices are [n,n];
% outer-product method is used
%
[m,n] = size(P);
OP = zeros(n);
for k=1:m,
   opdw=(P(k,:)-p)'*(P(k,:)-p);
   OP = OP + opdw;
end,
MSK = (ones(n) - eye(n));
OP = OP .* MSK;

OP2=(P-p)'*(P-p);
OP2=OP2.*MSK;


