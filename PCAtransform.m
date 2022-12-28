function Xt = PCAtransform(X,W)
% This function performs PCA to reduce the dimension of X
%   PCAtransform(X,W) transforms X to the K-dimensional PC space defined
%   by W; Each column of W is a principle component. 


%Xt = (W^tX^t)^t or Xt = XW
X_t = (X')';
W_t = (W')';
Xt = ((X_t.* W_t)')';
%Xt = X.*W.*X_t;




end
