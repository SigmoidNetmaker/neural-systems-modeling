% script for iterating the
% nonlinear lateral inhibition
% model; a prior loop brings
% the network to steady state
% before input presentation 
% xp=ones(1:32)';
% xp=xp*0.5;
% xc=xp;
xp=zeros(1:32)';
xc=xp;
a=0.1; b=1-a;
for i=1:30
   xc= a*(W*xp) + b*xp;
   xc=(exp(-xc) + 1) .^ (-1);
   xc=xc .* uk;
   xp=xc;
end
for i=1:60
   u=IN(:,i);
   xc=a*(V*u) + a*(W*xp) + b*xp;
   xc=(exp(-xc) + 1) .^ (-1);
   xc=xc .* uk;
   xp=xc;
   OUT(:,i)=xc;
end