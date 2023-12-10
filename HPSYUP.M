% hpsyup.m
% this script computes one
% iteration through the 
% Hopfield network where
% v is the state vector 
% and CM is the matrix of
% covariences; update is
% synchronous
%
v = CM*v;
v = v>0;

