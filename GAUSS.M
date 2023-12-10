function gd = gauss(k,var)
% this function computes a
% gaussian curve, where k is
% a row vector of values and
% var is the variance of the
% desired gaussian curve
gd = (k/var) .^ 2.0 * (-0.5);
gd = exp(gd);