% sn1FBwithTauDel.m
% this script sets up a simple single
% model neuron with feedback; note that
% the neural time constant is taken
% into account
% parameters:
% v: input weight
% w: feedback weight
% c: connectivity matrix
% x: input vector
% y: output vector
% yc: current output
% yp: previous output
% z: state vector
% t: time vector
% del: time step
% tau: time constnat
% tend: end time 
% nts: number of time points
% inflag: input flag

% set input flag
% (1 for impulse, 2 for step)
inflag=1; 

% set time step, time constant,
% and end time in seconds
% (tau should be at least ten 
% times greater than del)
del=0.01;
tau=0.1;
tend=10;
nts=tend/del+1;
t=0:del:tend;

% set feedback and input weights
v=1;
w=0.9;

% set up input
x=zeros(1,nts);
start=(nts-1)/10+1;
if inflag==1,
    x(start)=1;
elseif inflag==2,
    x(start:nts)=ones(1,nts-start+1);
end

% set up outputs
y=zeros(1,nts);

% construct connectivity matrix
v=v*(del/tau);
w=1-(del/tau)+w*(del/tau);
c=[v,w];

% find outputs
for i=2:nts,
    z=[x(i-1);y(i-1)];
    y(i)=c*z;
end

% plot results
clf
subplot(211)
plot(t,x)
subplot(212)
plot(t,y)
