% approxAndCatoFig.m
% this script trains a back-prop network on sine, and shows
% catastriphic interference by then training the same network
% on exponential
%

% set up inputs and outputs
% the range from 0 to pi is
% divided into 41 places and
% sine is computed on odd values
% and exponential on even values
x=linspace(0,pi,43)';
indx=1:43;
odd=find(rem(indx,2)~=0);
even=find(rem(indx,2)==0);
si=x(odd);
so=sin(si);
ei=x(even);
eo=exp(-ei);

% set bias and numberof hidden units
b=1; 
nHid=10; 
a=0.1;

% clear plot window
figure(1)
clf

fs=18; % set font size
lw=2; % set line width

% randomize network and test on
% sine function
InPat=si;
DesOut=so;
[nPat,nIn]=size(InPat);  
[nPat,nOut]=size(DesOut);  
V=rand(nHid,nIn+1)*2-1; 
U=rand(nOut,nHid+1)*2-1; 
Inb=[InPat b*ones(nPat,1)]; 
Hid=(1./(1+exp(-V*Inb')))'; 
Hidb=[Hid b*ones(nPat,1)]; 
Out=(1./(1+exp(-U*Hidb')))'; 
subplot(221)
plot(si,so,'k+',InPat,Out,'k*','markersize',8)
axis([-0.3 3.5 -0.05 1.05])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
% xlabel('input','fontsize',fs)
ylabel('output','fontsize',fs)
text(2.95,0.92,'A','fontsize',fs+2)

% train on sine function
% and retest
backPropTrain
subplot(222)
plot(si,so,'k+',InPat,Out,'k*','markersize',8)
axis([-0.3 3.5 -0.05 1.05])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
% xlabel('input','fontsize',fs)
% ylabel('output','fontsize',fs)
text(2.95,0.92,'B','fontsize',fs+2)

% train on exponential and
% test on exponential
InPat=ei;
DesOut=eo;
[nPat,nIn]=size(InPat);  
[nPat,nOut]=size(DesOut);  
backPropTrain
subplot(223)
plot(ei,eo,'k+',InPat,Out,'k*','markersize',8)
axis([-0.3 3.5 -0.05 1.05])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('input','fontsize',fs)
ylabel('output','fontsize',fs)
text(2.95,0.92,'C','fontsize',fs+2)

% retest on sine
InPat=si;
DesOut=so;
[nPat,nIn]=size(InPat);  
[nPat,nOut]=size(DesOut);  
Inb=[InPat b*ones(nPat,1)]; 
Hid=(1./(1+exp(-V*Inb')))'; 
Hidb=[Hid b*ones(nPat,1)]; 
Out=(1./(1+exp(-U*Hidb')))'; 
subplot(224)
plot(si,so,'k+',InPat,Out,'k*','markersize',8)
axis([-0.3 3.5 -0.05 1.05])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('input','fontsize',fs)
% ylabel('output','fontsize',fs)
text(2.95,0.92,'D','fontsize',fs+2)









