% habGWR.m
% this script sets up a very
% simple simulation of habituation
% of the Aplysia gill withdrawl reflex
%

% set start weight value
stv=4;

% set weight decrement
dec=0.7;

% set up a pulse
pls=[0 0 1 0 0];

% set up a series of pulses as
% the inpujt
x=[pls pls pls pls pls pls];

% find the size of the input
[dum nts]=size(x);

% set up a hold vector for the output
y=zeros(1,nts);

% set weight to start weight value
v=stv;

% find output
for i=1:nts,
    y(i)=v*x(i);
    if x(i)>0,
        v=v*dec;
    end
end

% plot results
clf
subplot(211)
plot(x)
axis([0 nts 0 1.1])
xlabel('time step')
ylabel('input')
% title('Input and Output of a Simple Reflex Model')
title('Simulation of Habituation of a Refelx')
subplot(212)
plot(y)
axis([0 nts 0 stv+0.5])
xlabel('time step')
ylabel('output')



