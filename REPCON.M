function MX = repcon(vr)
% makes a repeating connectivity
% matrix by laminating shifted
% versions of the same vector;
% enter: MX = repcon(vr), where
% MX is the matrix to be made 
% and vr is a row vector with the
% desired connectivity pattern;
% MX must be a square matrix with
% same number of columns as vr
[m,n] = size(vr);
for i = 1:n
   MX(i,:) = vr;
   vr = [vr(n) vr(1:n-1)];
end
