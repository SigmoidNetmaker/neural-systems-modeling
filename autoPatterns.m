% script autoPatterns.m
% this script holds patterns for autoassociative networks

P = [ 1 1 1 1 0 0 0 0 0 0
      0 0 0 0 0 0 1 1 1 1 ]

% P = [ 1 0 1 0 1 0 1 0 1 0
%       1 1 1 1 1 0 0 0 0 0 ]

% P = [ 1 0 1 0 1 0 1 0 1 0
%       1 0 0 1 1 1 1 0 0 1 ]

% P = [ 1 1 1 1 1 0 0 0 0 0
%       0 0 0 0 0 1 1 1 1 1 ]

% P=zeros(3,50);
% P(1,[1:2:49])=1;
% P(2,[1:5 11:15 21:25 31:35 41:45])=1;
% P(3,[2:2:50])=1;

[r,c]=size(P);
Pimage=zeros(r,c,3);
Pimage(:,:,1)=P;
Pimage(:,:,2)=P;
Pimage(:,:,3)=P;
clf
image(Pimage)
axis off
title('Patterns','fontsize',14)





