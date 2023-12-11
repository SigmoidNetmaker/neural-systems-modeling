% plotFourHiddenUnits.m
% this script plots out the responses of the hiddens units 
% when rbpVelocityStorageNonlinear.m is set up with four hidden units

figure(2)
clf
subplot(211)
plot(tVec,Out(1,:),'k',tVec,Out(3,:),'k--',...
    'linewidth',2.5)
axis([0 tEnd 0 0.55]) % for four hidden units
ylabel('hidden units','fontsize',14)
text(57,0.49,'A','fontsize',14)
set(gca,'linewidth',2)
set(gca,'fontsize',14)
subplot(212)
plot(tVec,Out(2,:),'k',tVec,Out(4,:),'k--',...
    'linewidth',2.5)
axis([0 tEnd 0 0.55]) % for four hidden units
xlabel('time steps','fontsize',14)
ylabel('hidden units','fontsize',14)
text(57,0.49,'B','fontsize',14) % for four hidden units
set(gca,'linewidth',2)
set(gca,'fontsize',14)

