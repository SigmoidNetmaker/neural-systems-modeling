% sn3BurstGen.m
% this script attempts a simulation of
% a burst-generator/relaxation-oscillator 
% using simple neurons

% set input amplitude
inamp=1; 

% set pnflag (1 for PN, 0 for no PN)
pnflag=0;

% set connection weights
v11=1;
v21=-10;
v31=5;
w11=1;
w12=-1;
w13=0;
w21=3;
w22=1;
w23=-10;
w31=0;
w32=-1;
w33=0;

if pnflag==0,
    w23=0;
end

% construct connectivity matrix
c=[v11,w11,w12,w13;v21,w21,w22,w23;v31,w31,w32,w33];

% set up inputs
tend=100;
t=1:tend;
x=zeros(1,tend);
start=tend/10;
x(start:tend)=ones(1,tend-start+1);
x=x*inamp;

% set up outputs
y=zeros(3,tend);
yp=zeros(3,1); 
yc=zeros(3,1);
y(:,1)=yc;

% find outputs
for i=2:tend,
    z=[x(i-1);yp];
    yc=c*z;
    yc(find(yc<0))=0;
    yc(find(yc>50))=50;
    y(:,i)=yc;
    yp=yc;
end

% plot results
clf
plot(t,x,'-.',t,y(1,:),t,y(2,:),'--')
