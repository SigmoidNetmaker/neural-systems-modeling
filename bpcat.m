% script bpcat.m
% this script trains a back-prop
% network on sine, and shows
% catastriphic interference by
% then training the same network
% on exponential
%

% set up inputs and outputs
% the range from 0 to pi is
% divided into 41 places and
% sine is computed on odd values
% and exponential on even values
x=linspace(0,pi,41)';
s=sin(x);
e=exp(-x);
ind=1:41;
odd=find(rem(ind,2)~=0);
even=find(rem(ind,2)==0);
si=x(odd);
so=s(odd);
ei=x(even);
eo=e(even);
plot(si,so,'*',ei,eo,'*')

% set up network and back-prop 
% training
ni=1;
nh=10;
no=1;
a=0.25;
b=1.0;
mm=0.9;
tl=0.1;
itn=15000;

% clear plot window
clf

% randomize network and test on
% sine function
bprnmx
PI=si;
PO=so;
bpbpv
subplot(221)
plot(si,so,'*',PI,O,'+')
axis([-0.3 3.5 -0.05 1.05])
xlabel('input')
ylabel('output')
title('initial random')

% train on sine function
% and retest
bpbpt
bpbpv
subplot(222)
plot(si,so,'*',PI,O,'+')
axis([-0.3 3.5 -0.05 1.05])
xlabel('input')
ylabel('output')
title('trained on sin')

% train on exponential and
% test on exponential
PI=ei;
PO=eo;
bpbpt
bpbpv
subplot(223)
plot(ei,eo,'*',PI,O,'+')
axis([-0.3 3.5 -0.05 1.05])
xlabel('input')
ylabel('output')
title('trained on exp')

% retest on sine
PI=si;
PO=so;
bpbpv
subplot(224)
plot(si,so,'*',PI,O,'+')
axis([-0.3 3.5 -0.05 1.05])
xlabel('input')
ylabel('output')
title('trained on exp')













