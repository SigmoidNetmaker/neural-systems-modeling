% setit.m
% script for setting
% iterative relaxation
% parameters

% set parameters
k=-25:25;
[m,n]=size(k);
V=eye(n);
gvar=3.0;
dvar=15.0;
% dwt=0.1;
dwt=0.3;
% dwt=0.5;
% dvar=12.0;
% dwt=0.34;
% the following sets of three 
% parameters were optimized
% using the genetic algorithm
% (the first set is better)
% gvar=1.0;
% dvar=14.0;
% dwt=0.204;
% gvar=1.0;
% dvar=13.0;
% dwt=0.256;
% gvar=1.0;
% dvar=16.0;
% dwt=0.191;
gvar=1.0;
dvar=20;
dwt=0.178;

% set input
% uncomment the next statements
% for the signal in noise input
% where the signal is at a random 
% location
hold=randperm(34);
rl=hold(1)+8;
signal=zeros(1,51);
signal(rl-1:rl+1)=ones(1,3);
noise=rand(1,51);
in=signal+noise;

% uncomment the next statements
% for the signal in noise input
% where the signal is at the
% middle
% signal=zeros(1,51);
% signal(25:27)=ones(1,3);
% noise=rand(1,51);
% in=signal+noise;
% rl=26;

% uncomment the next statement
% for the 1/2 sine input
% in=2*sin(pi*(0:50)./50);

% make the lateral 
% connectivity matrix
g=gauss(k,gvar);
d=gauss(k,dvar);
p=g-(dwt*d);
pr=[p(26:51) p(1:25)];
W=repcon(pr);

% iterate relaxation in the
% network and plot results
itrel
subplot(211)
plot(k,OUT)
axis([-25 25 0 11])
subplot(212)
plot(k,in,rl-26,2.2,'*')
axis([-25 25 -0.5 3])

