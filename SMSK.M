% script smsk.m
% this script produces a self-organizing
% feature map using the stripped-down
% Kohonen algorithm; P is the matrix of
% patterns, v is the state vector, CM is the
% connectivity matrix, itn is the number 
% of iterations and a is the initial learning
% rate that is decremented by d each iteration;
% the extent of neighborhood interactions is
% specified by nh; parameters are not reset,
% so rerunning the algorithm will pick-up
% where the previous run left off
%
a=1;
d=1;
nh=1;
itn=100;
[m,n]=size(CM);
[p,q]=size(P);
for i=1:itn,
   [rv pindx]=max(rand(1,p));
   v=CM*(P(pindx,:))';
   [rv vindx]=max(v);
   fn=vindx-nh;
   ln=vindx+nh;
   if fn < 1, fn=1; end,
   if ln > m, ln=m; end,
   for j=fn:ln,
      hld=CM(j,:)+a*P(pindx,:);
      CM(j,:)=hld/norm(hld);
      a=a*(d);
   end,
end;
