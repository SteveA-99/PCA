function W = findPCs(X, K)
% This function finds the first K principle components of X

% Instructions: First, compute the estimated variance of X, denoted as S
%               Second, compute eigenvalues and corresponding 
%               eigenvectors of S
%               Third, sort the eigenvalues in a descend order
%               Four, find the top K principle components with the largest
%               eigenvalues
%


%step1
S = cov(X);

%step2
[e, Y] = eig(S);
%e = eigenvectors and y = eigenvalues diagonal

%step3
%A = sort(y, 'descend');
y = sort(diag(Y));

%step4
W = max(y);


end
