% BiVarGaussPlay.m
% this script plays with the 
% bivariate Gaussian distribution
%

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

% show plots
clf
contour(gridx1,gridx2,probx1x2)
hold
plot(z(1,:),z(2,:),'+')
hold
axis square
xlabel('variable z1')
ylabel('variable z2')
title('Bivariate Gaussian Deviates')

return

% show mesh plot of bivariate gaussian
colormap([0 0 0])
mesh(gridx1,gridx2,probx1x2)



