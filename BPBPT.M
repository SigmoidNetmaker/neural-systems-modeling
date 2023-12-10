% script bpbpt.m
% this script trains a pattern associator
% using backpropagation; PI and PO are the
% input and output pattern matrices, O is 
% actual output matrix, CH and CO are the 
% input-hidden and hidden-output matrices,
% in, hid and out are the activity vectors,
% b is the bias,  e is the error vector,
% itn is the number of iterations, a is
% the learning rate, mm is the momentum,
% me is the maximum error and and tl is the
% tolerance
%

% a=0.1;
% mm=0.9;
% tl=0.1;
% b=1;
% itn=15000;

[m,n]=size(CO);
[r,s]=size(CH);
[p,q]=size(PI);
DCO=zeros(m,n); PDCO=DCO;
DCH=zeros(r,s); PDCH=DCH;
me=10;
for k=1:itn,
   [rv pindx]=max(rand(1,p));
   in=[PI(pindx,:) b]';
   hid=CH*in;
   hid=1 ./(1+(exp(-hid)));
   hid=[hid' b]';
   out=CO*hid;
   out=1 ./(1+(exp(-out)));
   e=PO(pindx,:)-(out');
   if max(abs(e))>tl,
      in=in';hid=hid';out=out';
      og=(out.*(1-out)).*e;
      for i=1:m;
         DCO(i,:)=a*og(i)*hid;
      end,
      hg=(hid.*(1-hid)).*(og*CO);
      for i=1:r,
         DCH(i,:)=a*hg(i)*in;
      end;
      DCO=DCO+(mm*PDCO);
      DCH=DCH+(mm*PDCH);
      CO=CO+DCO;
      CH=CH+DCH;
      PDCO=DCO;
      PDCH=DCH;
   end;
   if rem(k,(5*p))==0,
      bpbpv
      me=max(abs(abs(PO-O)));
   end,
   if me<tl, break, end,
 end;
 % reqits=k
 
   