% script bpdrt.m
% this script trains a pattern associator
% using the delta rule; PI is the matrix of
% input patterns, PO is the matrix of output
% patterns, O is the actual output matrix, 
% CM is the connectivity matrix, v is the 
% state vector, e is the error vector,
% itn is the number of iterations, a is the
% learning rate, me is the maximum error and
% and tl is the tolerance; parameters are not
% reset, so rerunning the algorithm will 
% pick-up where the previous run left off
%

a=1;
tl=0.1;
itn=10000;
[m,n]=size(CM);
[p,q]=size(PI);
me=10;
for k=1:itn,
   [rv pindx]=max(rand(1,p));
   v=CM*(PI(pindx,:))';
   v=1/(1+(exp(-v)));
   e=PO(pindx,:)'-v;
   for i=1:m;
      if abs(e(i))>tl,
         CM(i,:)=CM(i,:)+a*e(i)*PI(pindx,:);
      end,
   end;
   if rem(k,(5*p))==0,
      bpdrv;
      me=max(abs(PO-O));
   end,
   if me<tl, break, end,
 end;
 reqits=k
 
 
   