% BigMess.m
% this script will set up a 
% single-layer network with
% random input and feedback 
% connections and compute the 
% output to a pulse or step
% input
%

% enter numbers of inputs
% and outputs
nin=10;
nout=10;

% enter scale for feedback weights
scw=0.5;

% set input flag
% (1 for pulse, 2 for step)
inflag=1; 

% enter cut-off and saturation
cut=0;
sat=1000;

% set time step and end time in seconds
tend=100;
t=0:tend;
nts=tend+1;

% set up input
x=zeros(nin,nts);
start=(nts-1)/10+1;
if inflag==1,
    x(:,start)=ones(nin,1);
elseif inflag==2,
    x(:,start:nts)=ones(nin,nts-start+1);
end

% set up outputs
y=zeros(nout,nts);

% construct connectivity matrices
v=randn(nout,nin);
w=randn(nout)*scw;

% find outputs
for i=2:nts,
    y(:,i)=w*y(:,i-1) + v*x(:,i-1);
    y(find(y(:,i)<cut),i)=0;
    y(find(y(:,i)>sat),i)=sat;
end

% plot results
subplot(221)
mesh(v)
xlabel('in num')
ylabel('out num')
zlabel('weight')
subplot(222)
mesh(x)
axis([0 nts 0 nin 0 1.1]) 
xlabel('time step')
ylabel('in num')
zlabel('input')
subplot(223)
mesh(w)
xlabel('out num')
ylabel('out num')
zlabel('weight')
subplot(224)
mesh(y)
axis([0 nts 0 nout 0 sat+10]) 
xlabel('time step')
ylabel('out num')
zlabel('output')


