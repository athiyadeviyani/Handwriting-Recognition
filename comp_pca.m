function [EVecs, EVals] = comp_pca(X)
% Input: 
%   X:  N x D matrix (double)
% Output: 
%   EVecs: D-by-D matrix (double) contains all eigenvectors as columns
%       NB: follow the Task 1.3 specifications on eigenvectors.
%   EVals:
%       Eigenvalues in descending order, D x 1 vector (double)
%   (Note that the i-th columns of Evecs should corresponds to the i-th element in EVals)
    
    % gets the size of the matrix
    [N, D] = size(X);
    
    % gets the covariance matrix
    covar_m = MyCov(X);
    
    % compute the eigenvectors and eigenvalues
    [PC, V] = eig(covar_m);
    
    % Sort the variances in decreasing order by ordering eigenvalues
    
    % Extract diagonal of matrix as vector
    V = diag(V);
    
    % Sort the variances in decreasing order
    [tmp, ridx] = sort(V, 1, 'descend');
    EVals = V(ridx);
    EVecs = PC(:,ridx);
    
    % Iterate over each column to check if the first element of each eigenvector is non-negative
    for i=1:D 
        if EVecs(1,i) < 0
            EVecs(:,i) = EVecs(:,i) .* (-1);
        end
    end

end

