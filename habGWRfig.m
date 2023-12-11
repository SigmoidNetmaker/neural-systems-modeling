% habGWRfig.m
% this script sets up a very simple simulation of habituation
% of the Aplysia gill withdrawl reflex

stv=4; % set start weight value

dec=0.7; % set weight decrement

pls=[0 0 1 0 0]; % set up a pulse

x=[pls pls pls pls pls pls]; % set up a series of pulses as the input

[dum nTs]=size(x); % find the size of the input time series

y=zeros(1,nTs); % set up a hold vector for the output time series

v=stv; % set weight to start weight value

for t=1:nTs, % at each time step
    y(t)=v*x(t); % find the output 
    if x(t)>0, % if the input is present
        v=v*dec; % then decrement the weight
    end % end the conditional
end % end the for loop

lw=3; % set line width
fs=18; % set font size
clf % clear the plotting window
subplot(211) % set up the top subplot
plot(x,'k','linewidth',lw) % plot out the input time series
axis([0 nTs 0 1.1]) % reset the axis limits
xlabel('time step','fontsize',fs) % label the x axis
ylabel('input','fontsize',fs) % label the y asis
text(1,0.92,'A','fontsize',fs+2) % place the letter A near the top-left
set(gca,'fontsize',fs)
set(gca,'linewidth',lw)
subplot(212) % set up the bottom subplot
plot(y,'k','linewidth',lw) % plot our the output time series
axis([0 nTs 0 stv+0.5]) % reset the axis limits
xlabel('time step','fontsize',fs) % label the x axis
ylabel('output','fontsize',fs) % label the y axis
text(1,3.7,'B','fontsize',fs+2) % place the letter B near the top-left
set(gca,'fontsize',fs)
set(gca,'linewidth',lw)





