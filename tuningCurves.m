% tuningCurves.m
% this script makes the tuning curve figure

cf=linspace(1,2,211); 
tf=1.5; 
xexp=exp(-abs(cf-tf)/0.1); 
xgauss=exp((((cf-tf)/0.17).^2)*(-0.5));
theta=(cf-tf)*((pi/2)/0.5);
xcos=cos(theta);
xlin=abs(abs(cf-tf)-(0.5))*2;

cfIn=linspace(1,2,20); 
In1=exp(-abs(cfIn-cfIn(7))/0.1); 
In2=exp(-abs(cfIn-cfIn(13))/0.1); 
InUnits=1:20;


clf
figure(1)
plot(cf,xexp,'k','linewidth',2)
hold
plot(cf,xgauss,'k--','linewidth',2.3)
plot(cf,xlin,'k-.','linewidth',2.3)
plot(cf,xcos,'k:','linewidth',2.3)
hold
legend('exponential','Gaussian','linear','cosine')
axis([1 2 0 1.02])
set(gca,'fontsize',14)
set(gca,'linewidth',2)
xlabel('training frequency','fontsize',14)
ylabel('input unit response','fontsize',14)

figure(2)
plot(InUnits,In1,'ko-',InUnits,In2,'ko--','linewidth',2)
axis([1 20 -0.02 1.02])
set(gca,'xtick',[2 4 6 8 10 12 14 16 18 20])
set(gca,'fontsize',14)
set(gca,'linewidth',2)
xlabel('input unit number','fontsize',14)
ylabel('input unit responses','fontsize',14)



return
plot(tf,Out,'k','linewidth',2)
axis square
axis([1 2 0.25 3])
set(gca,'xtick',[1 1.25 1.5 1.75 2])
set(gca,'fontsize',14)
set(gca,'linewidth',2)
xlabel('test frequency','fontsize',14)
ylabel('output responses','fontsize',14)