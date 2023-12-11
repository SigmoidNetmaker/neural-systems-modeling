% GaussianDeviatesFig.m

% for univariate gaussian
% set mean and variance
mean=5;
var=4;
sd=sqrt(var);

% compute the Gaussian density funciton
x=-5:15;
xSmoo=linspace(-5,15,1000);
guss=(1/(sd*sqrt(2*pi)))*exp((-1/2)*((xSmoo-mean)/sd).^2);

% generate Gaussian distributed random numbers
gussrv=randn(1,100000)*sd+mean;
propd=hist(gussrv,x);
propd=propd/sum(propd);
sSamp=50;
gaussUniSamp=gussrv(1:sSamp);

% for bivaraite gaussian
% set parameters of bivariate Gaussian
me1=5;
me2=5;
sd1=2;
sd2=2;
r=0.5;

% set other parameters
ngrdpts=50;
endgrid=2*max(me1,me2);
nrvs=500;

% set up input values
x1=linspace(0,endgrid,ngrdpts);
x2=linspace(0,endgrid,ngrdpts);
[gridx1,gridx2]=ndgrid(x1,x2);

% compute bivariate Gaussian probabilities
probx1x2=(1/(2*pi*sd1*sd1*sqrt(1-r^2)))* ...
    exp(-(1/(2*(1-r^2)))*...
    (((gridx1-me1)/sd1).^2 - ...
    2*r*(((gridx1-me1)/sd1).*((gridx2-me2)/sd2)) + ...
    ((gridx2-me2)/sd2).^2));

% construct the c matrix
c=[sd1,0;sd2*r,sd2*sqrt(1-r^2)];

% generate nrvs bivariate variables
z=zeros(2,nrvs);
for i=1:nrvs,
    z(:,i)=c*randn(2,1)+[me1;me2];
end

% make lines
vals=0:0.1:10;
driv=vals;
spont=ones(length(vals))*2.5;

% show plots
fs=14; % set font size
lw=2; % set line width
clf
subplot(121)
plot(xSmoo,guss,'k',x,propd,'k+','linewidth',lw)
hold
plot(gaussUniSamp,ones(sSamp)*0.1,'kx')
hold
axis([-5 15 0 0.2])
axis square
set(gca,'xtick',[-5 0 5 10 15])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('value')
ylabel('probability')
text(-4,0.18,'A','fontsize',fs)
subplot(122)
colormap([0 0 0])
contour(gridx1,gridx2,probx1x2,'linewidth',lw)
hold
plot(z(1,:),z(2,:),'kx')
plot(driv,driv,'k--',driv,spont,'k--',spont,driv,'k--',...
    'linewidth',lw)
hold
axis square
set(gca,'ytick',[0 2.5 5 7.5 10])
set(gca,'xtick',[0 2.5 5 7.5 10])
set(gca,'linewidth',lw)
set(gca,'fontsize',fs)
xlabel('value 1')
ylabel('value 2')
text(0.5,9,'B','fontsize',fs)

return

% show mesh plot of bivariate gaussian
colormap([0 0 0])
mesh(gridx1,gridx2,probx1x2)



