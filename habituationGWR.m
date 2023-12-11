% habituationGWR.m
% this script sets up a very simple simulation of habituation
% of the Aplysia gill withdrawal reflex

stv=4; % set start weight value

dec=0.7; % set weight decrement

pls=[0 0 1 0 0]; % set up a pulse

x=[pls pls pls pls pls pls]; % set up a series of pulses as the input

[dum nTs]=size(x); % find the size of the input time series

y=zeros(1,nTs); % set up (define) a vector for the output time series

v=stv; % set weight to start weight value

for t=1:nTs, % for each time step do
    y(t)=v*x(t); % find the output 
    if x(t)>0, % if the input is present
        v=v*dec; % then decrement the weight
    end % end the conditional
end % end the for loop

clf % clear the plotting window
subplot(211) % set up the top subplot
plot(x) % plot out the input time series
axis([0 nTs 0 1.1]) % reset the axis limits
xlabel('time step') % label the x axis
ylabel('input') % label the y asis
text(1,1,'A') % place the letter A near the top-left
subplot(212) % set up the bottom subplot
plot(y) % plot our the output time series
axis([0 nTs 0 stv+0.5]) % reset the axis limits
xlabel('time step') % label the x axis
ylabel('output') % label the y axis
text(1,4,'B') % place the letter B near the top-left




