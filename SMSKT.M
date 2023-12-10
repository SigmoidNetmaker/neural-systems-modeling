% script smskt.m
% this script produces a tonotopically
% orgainzed central auditory map using
% the stripped-down Kohonen algorithm;
% cf is the vector of input central frequencies
% which can be either uniformly spaced or
% expanded midrange and qf is their qulaity factor,
% ip is the input pattern at a randomly chosen
% test frequency tf (cf and tf in 1-2 range);
% v is the state vector, CM [10,20] is the
% connectivity matrix, itn is the number 
% of iterations and a is the initial learning
% rate that is decremented by d each iteration;
% the extent of neighborhood interactions is
% specified by nh; parameters are not reset,
% so rerunning the algorithm will pick-up
% where the previous run left off
%
itn=500;
a=1;
d=1;
nh=1;
qf=0.3;
cf=linspace(1,2,20);
% cf=[linspace(1.0,1.385,7) linspace(1.45,1.55,6) linspace(1.615,2.0,7)];
for i=1:itn,
   tf=rand(1)+1;
   ip=exp(-abs(cf-tf)/qf);
   v=CM*ip';
   [rv vindx]=max(v);
   fn=vindx-nh;
   ln=vindx+nh;
   if fn < 1, fn=1; end,
   if ln > 10, ln=10; end,
   for j=fn:ln,
      hld=CM(j,:)+a*ip;
      CM(j,:)=hld/norm(hld);
      a=a*(d);
   end,
end;
