function RM = smrnmx(m,n)
% RM = smrnmx(m,n)
% this function generates an [m,n]
% matrix of random numbers between
% -1 and +1
%
RM=rand(m,n)-(ones(m,n)*0.5);
RM=RM*2;


